;==============================================================================
; Dragon Quest III - Bank $00
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $C00000-$C07FFF
; Instructions: 14585
; Bytes: 32770
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_00"

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_000
; Address: $C08002
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_000:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVC $54			  ; 50 54 | Branch if overflow clear
	JMP $080200		  ; 5C 00 02 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	ORA $001D,Y		  ; 19 1D 00 | Logical OR with accumulator (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	BVC $54			  ; 50 54 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080400		  ; 5C 00 04 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $7D6D,X		  ; 1D 6D 7D | Logical OR with accumulator (absolute,X)
	ORA $011D			; 0D 1D 01 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	JMP $500309		  ; 5C 09 03 50 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080400		  ; 5C 00 04 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $7D6D,X		  ; 1D 6D 7D | Logical OR with accumulator (absolute,X)
	ORA $011D			; 0D 1D 01 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	JMP $480309		  ; 5C 09 03 48 | Jump to address long
	JMP $5050			; 4C 50 50 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BRA $02			  ; 80 02 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $7D6D,X		  ; 1D 6D 7D | Logical OR with accumulator (absolute,X)
	ORA $011D			; 0D 1D 01 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_001
; Address: $C080CA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_001:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	JMP $480309		  ; 5C 09 03 48 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $03005C		  ; 5C 5C 00 03 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	ORA $001D,Y		  ; 19 1D 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $480309		  ; 5C 09 03 48 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $03005C		  ; 5C 5C 00 03 | Jump to address long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_002
; Address: $C08113
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_002:
	JSR $1717			; 20 17 17 | Jump to subroutine
	BPL $43			  ; 10 43 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	ORA $001D,Y		  ; 19 1D 00 | Logical OR with accumulator (absolute,Y)
	JMP $480309		  ; 5C 09 03 48 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $03005C		  ; 5C 5C 00 03 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	ORA $001D,Y		  ; 19 1D 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $500309		  ; 5C 09 03 50 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080300		  ; 5C 00 03 08 | Jump to address long
	CPY $20CC			; CC CC 20 | Compare Y register (absolute)
	BPL $43			  ; 10 43 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	ORA $011D,Y		  ; 19 1D 01 | Logical OR with accumulator (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	JMP $500302		  ; 5C 02 03 50 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080400		  ; 5C 00 04 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_003
; Address: $C081BB
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_003:
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $7D6D,X		  ; 1D 6D 7D | Logical OR with accumulator (absolute,X)
	ORA $021D			; 0D 1D 02 | Logical OR with accumulator (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $54			  ; 50 54 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080320		  ; 5C 20 03 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	BRA $01			  ; 80 01 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $7D6D,X		  ; 1D 6D 7D | Logical OR with accumulator (absolute,X)
	ORA $021D			; 0D 1D 02 | Logical OR with accumulator (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $080400		  ; 5C 00 04 08 | Jump to address long
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1D1D,X		  ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
	ORA $021D,X		  ; 1D 1D 02 | Logical OR with accumulator (absolute,X)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	BIT $25			  ; 24 25 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	AND #$EB			 ; 29 EB | Logical AND with accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	BIT $EB29			; 2C 29 EB | Test bits in accumulator (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA #$89			 ; 09 89 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_004
; Address: $C08269
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_004:
	BIT $C0CA			; 2C CA C0 | Test bits in accumulator (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	SBC #$EB			 ; E9 EB | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	EOR #$EC			 ; 49 EC | Exclusive OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	DEX				  ; CA | Decrement X register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	DEX				  ; CA | Decrement X register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $89			  ; 05 89 | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $2EC0			; CC C0 2E | Compare Y register (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CPY $2EC0			; CC C0 2E | Compare Y register (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	LDA $2EC0CA		  ; AF CA C0 2E | Read graphics status
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	INC $C0CA			; EE CA C0 | Increment (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$11			 ; 42 11 | Reserved instruction
	LDA #$EC			 ; A9 EC | Read graphics status
	ADC $C0CA,Y		  ; 79 CA C0 | Add with carry (absolute,Y)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	STA $C0CA,Y		  ; 99 CA C0 | Update graphics data
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$12			 ; 42 12 | Reserved instruction
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	BIT #$CA			 ; 89 CA | Test bits in accumulator (immediate)
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	LDY $CA			  ; A4 CA | Load from zero page into Y register
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_005
; Address: $C082D4
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_005:
	CMP $2EC0			; CD C0 2E | Compare accumulator (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	LSR $C0CD,X		  ; 5E CD C0 | Logical shift right (absolute,X)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	CMP #$E7			 ; C9 E7 | Compare accumulator (immediate)
	CMP #$FA			 ; C9 FA | Compare accumulator (immediate)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	ROR $3EC9,X		  ; 7E C9 3E | Rotate right (absolute,X)
	CMP #$69			 ; C9 69 | Compare accumulator (immediate)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	STY $42C9			; 8C C9 42 | Hardware register operation
	STA $77C9			; 8D C9 77 | Update graphics data
	STA $2EC9			; 8D C9 2E | Update graphics data
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	STY $C98F			; 8C 8F C9 | Store Y register to absolute address
	INC $C98F			; EE 8F C9 | Increment (absolute)
	BCC $C9			  ; 90 C9 | Branch if carry clear
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$0E			 ; 42 0E | Reserved instruction
	BCS $6C			  ; B0 6C | Branch if carry set
	BCC $C9			  ; 90 C9 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$10			 ; 42 10 | Reserved instruction
	BPL $6D			  ; 10 6D | Branch if positive
	STY $90			  ; 84 90 | Store Y register to zero page
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$12			 ; 42 12 | Reserved instruction
	BVS $6D			  ; 70 6D | Branch if overflow set
	LDA $90			  ; A5 90 | Read graphics status
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_006
; Address: $C0834C
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_006:
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$0D			 ; 42 0D | Reserved instruction
	BNE $6D			  ; D0 6D | Branch if not equal
	DEC $90			  ; C6 90 | Decrement (zero page)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$0F			 ; 42 0F | Reserved instruction
	BMI $6E			  ; 30 6E | Branch if negative
	BCC $C9			  ; 90 C9 | Branch if carry clear
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$11			 ; 42 11 | Reserved instruction
	BCC $6E			  ; 90 6E | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	STA ($C9),Y		  ; 91 C9 | Update graphics data
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$10			 ; 42 10 | Reserved instruction
	BPL $6D			  ; 10 6D | Branch if positive
	AND #$91			 ; 29 91 | Logical AND with accumulator (immediate)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$0F			 ; 42 0F | Reserved instruction
	BMI $6E			  ; 30 6E | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STA ($C9),Y		  ; 91 C9 | Update graphics data
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	BVC $6F			  ; 50 6F | Branch if overflow clear
	STA ($C9),Y		  ; 91 C9 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$32			 ; 42 32 | Reserved instruction
	BEQ $6E			  ; F0 6E | Branch if equal
	LDA $91			  ; A5 91 | Read graphics status
	CMP #$9E			 ; C9 9E | Compare accumulator (immediate)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$32			 ; 42 32 | Reserved instruction

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_007
; Address: $C083C1
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_007:
	BCS $65			  ; B0 65 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	REP #$A0			 ; C2 A0 | Reset processor status bits
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$32			 ; 42 32 | Reserved instruction
	BPL $66			  ; 10 66 | Branch if positive
	LDA ($A0,X)		  ; A1 A0 | Read graphics status
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$12			 ; 42 12 | Reserved instruction
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	BCC $A5			  ; 90 A5 | Branch if carry clear
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCS $A5			  ; B0 A5 | Branch if carry set
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	WDM #$11			 ; 42 11 | Reserved instruction
	LDA #$EC			 ; A9 EC | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	PHX				  ; DA | Push X register to stack
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	WDM #$12			 ; 42 12 | Reserved instruction
	BCS $65			  ; B0 65 | Branch if carry set
	LDY $2EC9			; AC C9 2E | Load from absolute address into Y register
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$11			 ; 42 11 | Reserved instruction
	BPL $66			  ; 10 66 | Branch if positive
	STZ $C9AC			; 9C AC C9 | Store zero to absolute
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	BVS $66			  ; 70 66 | Branch if overflow set
	LDA $C9AC,X		  ; BD AC C9 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_008
; Address: $C08431
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_008:
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	ROR $CE			  ; 66 CE | Rotate right (zero page)
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	DEC $2EC0			; CE C0 2E | Decrement (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	WDM #$12			 ; 42 12 | Reserved instruction
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BVS $CF			  ; 70 CF | Branch if overflow set
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	WDM #$1B			 ; 42 1B | Reserved instruction
	SBC #$EB			 ; E9 EB | Subtract with carry (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $2EC0			; CC C0 2E | Compare Y register (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	LDA ($D4,X)		  ; A1 D4 | Read graphics status
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	WDM #$1C			 ; 42 1C | Reserved instruction
	EOR #$EC			 ; 49 EC | Exclusive OR with accumulator (immediate)
	CPY $2EC0			; CC C0 2E | Compare Y register (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$1D			 ; 42 1D | Reserved instruction
	LDA #$EC			 ; A9 EC | Read graphics status
	CPY $2EC0			; CC C0 2E | Compare Y register (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	WDM #$1E			 ; 42 1E | Reserved instruction
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	ASL $C0CD			; 0E CD C0 | Arithmetic shift left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	ADC #$ED			 ; 69 ED | Add with carry (immediate)
	INC				  ; 1A | Increment accumulator
	CMP $2EC0			; CD C0 2E | Compare accumulator (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)
	ROL $C0C9			; 2E C9 C0 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_00B
; Address: $C084A8
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_00B:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420D		  ; 8F 0D 42 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $004200		  ; 8F 00 42 00 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $00420C		  ; 8F 0C 42 00 | Update graphics data
	LDX #$7F			 ; A2 7F | Load immediate value into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$40			 ; A9 40 | Read graphics status
	STA				  ; 9F 00 00 7E | Update graphics data
	STA				  ; 9F 00 00 7F | Update graphics data
	INC				  ; 1A | Increment accumulator
	INX				  ; E8 | Increment X register
	BNE $F4			  ; D0 F4 | Branch if not equal
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FDC		  ; 8F DC 7F 7E | Update graphics data
	LDA #$8F			 ; A9 8F | Read graphics status
	STA $2100			; 8D 00 21 | PPU graphics register access
	STA $7E7F88		  ; 8F 88 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_00F
; Address: $C084EF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_00F:
	JSL $C02735		  ; 22 35 27 C0 | Jump to subroutine long
	LDA #$81			 ; A9 81 | Read graphics status
	STA $7E7FDC		  ; 8F DC 7F 7E | Update graphics data
	STA $4200			; 8D 00 42 | Hardware register operation
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE4			; 8D E4 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_010
; Address: $C08509
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_010:
	JSL $C027B4		  ; 22 B4 27 C0 | Jump to subroutine long
	AND $5CC0			; 2D C0 5C | Logical AND with accumulator (absolute)
	CPY #$8B			 ; C0 8B | Compare Y register (immediate)
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $7FF0			; 9C F0 7F | Store zero to absolute
	STZ $7FF1			; 9C F1 7F | Store zero to absolute
	STZ $7FF2			; 9C F2 7F | Store zero to absolute
	STZ $7FF3			; 9C F3 7F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_011
; Address: $C0852B
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_011:
	STX $7FE4			; 8E E4 7F | Store X register to absolute address
	STX $7FDE			; 8E DE 7F | Store X register to absolute address
	STX $7FE0			; 8E E0 7F | Store X register to absolute address
	STX $7FE2			; 8E E2 7F | Store X register to absolute address
	STX $7FE8			; 8E E8 7F | Store X register to absolute address
	STX $7FEA			; 8E EA 7F | Store X register to absolute address
	STX $7FEC			; 8E EC 7F | Store X register to absolute address
	STX $7FEE			; 8E EE 7F | Store X register to absolute address
	STX $7FF6			; 8E F6 7F | Store X register to absolute address
	STX $7FF4			; 8E F4 7F | Store X register to absolute address
	STX $7FE6			; 8E E6 7F | Store X register to absolute address
	STX $93AE			; 8E AE 93 | Store X register to absolute address
	STX $95CC			; 8E CC 95 | Store X register to absolute address
	STX $94B0			; 8E B0 94 | Store X register to absolute address
	STX $95B2			; 8E B2 95 | Store X register to absolute address
	STX $966E			; 8E 6E 96 | Store X register to absolute address
	STX $99D9			; 8E D9 99 | Store X register to absolute address
	STX $7C40			; 8E 40 7C | Store X register to absolute address
	STX $7F7E			; 8E 7E 7F | Store X register to absolute address
	LDA #$59			 ; A9 59 | Read graphics status
	STA $7F7A			; 8D 7A 7F | Update graphics data
	LDA #$12			 ; A9 12 | Read graphics status
	STA $7F7B			; 8D 7B 7F | Update graphics data
	LDA #$E2			 ; A9 E2 | Read graphics status
	STA $7F7C			; 8D 7C 7F | Update graphics data
	LDA #$AA			 ; A9 AA | Read graphics status
	STA $7F7D			; 8D 7D 7F | Update graphics data
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	STX $7F84			; 8E 84 7F | Store X register to absolute address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $002133		  ; 8F 33 21 00 | Update graphics data
	STA $7FDA			; 8D DA 7F | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_012
; Address: $C08589
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_012:
	STZ $2116			; 9C 16 21 | PPU graphics register access
	STZ $2117			; 9C 17 21 | PPU graphics register access
	STZ $2115			; 9C 15 21 | PPU graphics register access
	LDA #$09			 ; A9 09 | Read graphics status
	STA $4320			; 8D 20 43 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $4321			; 8D 21 43 | Update graphics data
	LDX #$DE			 ; A2 DE | Load immediate value into X register
	ORA $8E			  ; 05 8E | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_013
; Address: $C085A0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_013:
	JSL $C0A243		  ; 22 43 A2 C0 | Jump to subroutine long
	STX $4324			; 8E 24 43 | Store X register to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $4325			; 8E 25 43 | Store X register to absolute address
	LDA #$04			 ; A9 04 | Read graphics status
	STA $420B			; 8D 0B 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_015
; Address: $C085B7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_015:
	STZ $2102			; 9C 02 21 | PPU graphics register access
	STZ $2103			; 9C 03 21 | PPU graphics register access
	LDA #$00			 ; A9 00 | Read graphics status
	STA $4300			; 8D 00 43 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $4301			; 8D 01 43 | Update graphics data
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	STX $4302			; 8E 02 43 | Store X register to absolute address
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $4304			; 8D 04 43 | Update graphics data
	LDX #$20			 ; A2 20 | Load immediate value into X register
	STX $4305			; 8E 05 43 | Store X register to absolute address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $420B			; 8D 0B 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_016
; Address: $C085E0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_016:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $004210		  ; AF 10 42 00 | Read graphics status
	LDA $7FE4			; AD E4 7F | Read graphics status
	BEQ $0D			  ; F0 0D | Branch if equal
	LDA $7FDE			; AD DE 7F | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	STZ $7FDE			; 9C DE 7F | Store zero to absolute
	LDA $7FE0			; AD E0 7F | Read graphics status
	BNE $16			  ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_018
; Address: $C0860A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_018:
	JSR $06A1			; 20 A1 06 | Jump to subroutine
	LDA $7FF6			; AD F6 7F | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_019
; Address: $C08612
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_019:
	JSR $0704			; 20 04 07 | Jump to subroutine
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002100		  ; 8F 00 21 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $00420C		  ; 8F 0C 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_027
; Address: $C08650
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_027:
	JSR $0F2A			; 20 2A 0F | Jump to subroutine
	LDA $7F82			; AD 82 7F | Read graphics status
	AND $7F84			; 2D 84 7F | Logical AND with accumulator (absolute)
	STA $00420C		  ; 8F 0C 42 00 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $7FDE			; 8E DE 7F | Store X register to absolute address
	STX $7FE0			; 8E E0 7F | Store X register to absolute address
	STX $7FE2			; 8E E2 7F | Store X register to absolute address
	STX $7FE8			; 8E E8 7F | Store X register to absolute address
	STX $7FEE			; 8E EE 7F | Store X register to absolute address
	STX $7FF4			; 8E F4 7F | Store X register to absolute address
	STX $7C40			; 8E 40 7C | Store X register to absolute address
	LDA $7F88			; AD 88 7F | Read graphics status
	STA $002100		  ; 8F 00 21 00 | Update graphics data
	INC $7FFC			; EE FC 7F | Increment (absolute)
	INC $2A6C			; EE 6C 2A | Increment (absolute)
	LDA $7F74			; AD 74 7F | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	DEC $7F74			; CE 74 7F | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_029
; Address: $C0868D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_029:
	JSR $06A1			; 20 A1 06 | Jump to subroutine
	LDA $7FF6			; AD F6 7F | Read graphics status
	BEQ $00			  ; F0 00 | Branch if equal
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_02A
; Address: $C08697
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_02A:
	JSL $C0C7F7		  ; 22 F7 C7 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt
	LDA $7F7E			; AD 7E 7F | Read graphics status
	BNE $37			  ; D0 37 | Branch if not equal
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $7F7A			; AD 7A 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $7F7C			; 4D 7C 7F | Exclusive OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_02B
; Address: $C086B4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_02B:
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F7C			; AD 7C 7F | Read graphics status
	STA $7F7D			; 8D 7D 7F | Update graphics data
	LDA $7F7B			; AD 7B 7F | Read graphics status
	STA $7F7C			; 8D 7C 7F | Update graphics data
	LDA $7F7A			; AD 7A 7F | Read graphics status
	STA $7F7B			; 8D 7B 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F7A			; 8D 7A 7F | Update graphics data
	LDA $7F7A			; AD 7A 7F | Read graphics status
	ORA $7F7B			; 0D 7B 7F | Logical OR with accumulator (absolute)
	ORA $7F7C			; 0D 7C 7F | Logical OR with accumulator (absolute)
	ORA $7F7D			; 0D 7D 7F | Logical OR with accumulator (absolute)
	BEQ $03			  ; F0 03 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_02E
; Address: $C086E1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_02E:
	LDA $004212		  ; AF 12 42 00 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $F9			  ; B0 F9 | Branch if carry set
	LDA $004218		  ; AF 18 42 00 | Read graphics status
	STA $7FF8			; 8D F8 7F | Update graphics data
	LDA $004219		  ; AF 19 42 00 | Read graphics status
	STA $7FF9			; 8D F9 7F | Update graphics data
	LDA $004016		  ; AF 16 40 00 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $06			  ; B0 06 | Branch if carry set
	STZ $7FF8			; 9C F8 7F | Store zero to absolute
	STZ $7FF9			; 9C F9 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_02F
; Address: $C08704
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_02F:
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	STA $002121		  ; 8F 21 21 00 | Update graphics data
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$22			 ; A9 22 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_030
; Address: $C08733
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_030:
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$1F			 ; A9 1F | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$20			 ; A9 20 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $002102		  ; 8F 02 21 00 | Update graphics data
	STA $002103		  ; 8F 03 21 00 | Update graphics data
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_031
; Address: $C08766
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_031:
	LDA $7FF4			; AD F4 7F | Read graphics status
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_032
; Address: $C0876C
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_032:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $EA97			; AD 97 EA | Read graphics status
	BMI $24			  ; 30 24 | Branch if negative
	LDA $EABF			; AD BF EA | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $EAA1			; AD A1 EA | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $EAB5			; AD B5 EA | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $EA99			; AD 99 EA | Read graphics status
	BMI $24			  ; 30 24 | Branch if negative
	LDA $EAC1			; AD C1 EA | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $EAA3			; AD A3 EA | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_033
; Address: $C087C7
; Size: 142 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_033:
	LDA $EAB7			; AD B7 EA | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $EA9B			; AD 9B EA | Read graphics status
	BMI $24			  ; 30 24 | Branch if negative
	LDA $EAC3			; AD C3 EA | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $EAA5			; AD A5 EA | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $EAB9			; AD B9 EA | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $EA9D			; AD 9D EA | Read graphics status
	BMI $24			  ; 30 24 | Branch if negative
	LDA $EAC5			; AD C5 EA | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $EAA7			; AD A7 EA | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $EABB			; AD BB EA | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $EA9F			; AD 9F EA | Read graphics status
	BMI $24			  ; 30 24 | Branch if negative
	LDA $EAC7			; AD C7 EA | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $EAA9			; AD A9 EA | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $EABD			; AD BD EA | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_036
; Address: $C0885E
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_036:
	LDA $99D9			; AD D9 99 | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0A83			; 4C 83 0A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$30			 ; E2 30 | Set processor status bits
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $4304			; 8D 04 43 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $4301			; 8D 01 43 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $4300			; 8D 00 43 | Update graphics data
	LDA #$80			 ; A9 80 | Read graphics status
	STA $2115			; 8D 15 21 | PPU graphics register access
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDA $7FE55C		  ; AF 5C E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE554		  ; AF 54 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	STZ $E5			  ; 64 E5 | Store zero to zero page
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE55E		  ; AF 5E E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE556		  ; AF 56 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	ROR $E5			  ; 66 E5 | Rotate right (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE560		  ; AF 60 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE558		  ; AF 58 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC #$99			 ; E9 99 | Subtract with carry (immediate)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_037
; Address: $C088DD
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_037:
	PLA				  ; 68 | Pull accumulator from stack
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE562		  ; AF 62 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE55A		  ; AF 5A E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE574		  ; AF 74 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE56C		  ; AF 6C E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE576		  ; AF 76 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE56E		  ; AF 6E E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	ROR $7FE5,X		  ; 7E E5 7F | Rotate right (absolute,X)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE578		  ; AF 78 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE570		  ; AF 70 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC #$99			 ; E9 99 | Subtract with carry (immediate)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	BRA $E5			  ; 80 E5 | Branch always
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE57A		  ; AF 7A E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_038
; Address: $C08968
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_038:
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE572		  ; AF 72 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDX #$81			 ; A2 81 | Load immediate value into X register
	STX $2115			; 8E 15 21 | PPU graphics register access
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDA $7FE58C		  ; AF 8C E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE584		  ; AF 84 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE58E		  ; AF 8E E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE586		  ; AF 86 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE590		  ; AF 90 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE588		  ; AF 88 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC #$99			 ; E9 99 | Subtract with carry (immediate)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE592		  ; AF 92 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE58A		  ; AF 8A E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_039
; Address: $C089F4
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_039:
	XBA				  ; EB | Exchange accumulator bytes
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE5A4		  ; AF A4 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE59C		  ; AF 9C E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	LDY $7FE5			; AC E5 7F | Load from absolute address into Y register
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE5A6		  ; AF A6 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE59E		  ; AF 9E E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	LDX $7FE5			; AE E5 7F | Load from absolute address into X register
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE5A8		  ; AF A8 E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE5A0		  ; AF A0 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SBC #$99			 ; E9 99 | Subtract with carry (immediate)
	ROR $168D,X		  ; 7E 8D 16 | Rotate right (absolute,X)
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	BCS $E5			  ; B0 E5 | Branch if carry set
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE5AA		  ; AF AA E5 7F | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE5A2		  ; AF A2 E5 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	AND ($AF,X)		  ; 21 AF | Logical AND with accumulator ((zero page,X))
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03A
; Address: $C08A80
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03A:
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03B
; Address: $C08A83
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03B:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$30			 ; E2 30 | Set processor status bits
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $4304			; 8D 04 43 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $4301			; 8D 01 43 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $4300			; 8D 00 43 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $2115			; 8D 15 21 | PPU graphics register access
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDA $7FE55C		  ; AF 5C E5 7F | Read graphics status
	BEQ $14			  ; F0 14 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE554		  ; AF 54 E5 7F | Read graphics status
	STA $2116			; 8D 16 21 | PPU graphics register access
	LDA $7FE564		  ; AF 64 E5 7F | Read graphics status
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE574		  ; AF 74 E5 7F | Read graphics status
	BEQ $14			  ; F0 14 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE56C		  ; AF 6C E5 7F | Read graphics status
	STA $2116			; 8D 16 21 | PPU graphics register access
	LDA $7FE57C		  ; AF 7C E5 7F | Read graphics status
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDX #$02			 ; A2 02 | Load immediate value into X register
	STX $2115			; 8E 15 21 | PPU graphics register access
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDA $7FE58C		  ; AF 8C E5 7F | Read graphics status
	BEQ $14			  ; F0 14 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE584		  ; AF 84 E5 7F | Read graphics status
	STA $2116			; 8D 16 21 | PPU graphics register access
	LDA $7FE594		  ; AF 94 E5 7F | Read graphics status
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	LDA $7FE5A4		  ; AF A4 E5 7F | Read graphics status
	BEQ $14			  ; F0 14 | Branch if equal
	STA $4305			; 8D 05 43 | Update graphics data
	LDA $7FE59C		  ; AF 9C E5 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03C
; Address: $C08B06
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03C:
	STA $2116			; 8D 16 21 | PPU graphics register access
	LDA $7FE5AC		  ; AF AC E5 7F | Read graphics status
	STA $4302			; 8D 02 43 | Update graphics data
	STX $420B			; 8E 0B 42 | Hardware register operation
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03D
; Address: $C08B16
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03D:
	LDA $99D9			; AD D9 99 | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $55			  ; D0 55 | Branch if not equal
	SEP #$10			 ; E2 10 | Set processor status bits
	LDA $7FF0			; AD F0 7F | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $7FF0			; 8D F0 7F | Update graphics data
	LDX $7FF0			; AE F0 7F | Load from absolute address into X register
	BEQ $3D			  ; F0 3D | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA				  ; BF 34 0C C0 | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BPL $8F			  ; 10 8F | Branch if positive
	ORA $43			  ; 05 43 | Logical OR with accumulator (zero page)
	LDA				  ; BF 3C 0C C0 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	DEC $7FF0			; CE F0 7F | Decrement (absolute)
	DEC $7FF0			; CE F0 7F | Decrement (absolute)
	STZ $7FF1			; 9C F1 7F | Store zero to absolute
	STZ $7FF2			; 9C F2 7F | Store zero to absolute
	REP #$10			 ; C2 10 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03E
; Address: $C08B72
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03E:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA $7FF0			; AD F0 7F | Read graphics status
	BEQ $34			  ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_03F
; Address: $C08B8F
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_03F:
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BCC $0E			  ; 90 0E | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $028F			; EC 8F 02 | Compare X register (absolute)
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BRA $0C			  ; 80 0C | Branch always
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	SBC $8F			  ; E5 8F | Subtract with carry (zero page)
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $99E5			; AD E5 99 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	STZ $7FF0			; 9C F0 7F | Store zero to absolute
	LDA $7FF1			; AD F1 7F | Read graphics status
	BEQ $34			  ; F0 34 | Branch if equal
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BCC $0E			  ; 90 0E | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $028F			; EC 8F 02 | Compare X register (absolute)
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BRA $0C			  ; 80 0C | Branch always
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $028F			; EC 8F 02 | Compare X register (absolute)
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $99E7			; AD E7 99 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	STZ $7FF1			; 9C F1 7F | Store zero to absolute
	LDA $7FF2			; AD F2 7F | Read graphics status
	BEQ $34			  ; F0 34 | Branch if equal
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BCC $0E			  ; 90 0E | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $028F			; EC 8F 02 | Compare X register (absolute)
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BRA $0C			  ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_040
; Address: $C08C13
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_040:
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$C6			 ; A9 C6 | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	LDA $99E9			; AD E9 99 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	STZ $7FF2			; 9C F2 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_041
; Address: $C08C37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_041:
	ADC $7DD2			; 6D D2 7D | Add with carry (absolute)
	STA $9DD2			; 8D D2 9D | Update graphics data
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_042
; Address: $C08C43
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_042:
	JSR $3000			; 20 00 30 | Jump to subroutine
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	BEQ $48			  ; F0 48 | Branch if equal
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $8BAE,Y		  ; B9 AE 8B | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $8FAE,Y		  ; B9 AE 8F | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA $91AE,Y		  ; B9 AE 91 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $8DAE,Y		  ; B9 AE 8D | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $93AE			; CC AE 93 | Compare Y register (absolute)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $93AE			; 8C AE 93 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_043
; Address: $C08C94
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_043:
	LDY $95B2			; AC B2 95 | Load from absolute address into Y register
	BEQ $46			  ; F0 46 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_044
; Address: $C08CA5
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_044:
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $94B2,Y		  ; B9 B2 94 | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $9532,Y		  ; B9 32 95 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA $9572,Y		  ; B9 72 95 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $94F2,Y		  ; B9 F2 94 | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $95B2			; CC B2 95 | Compare Y register (absolute)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $95B2			; 8C B2 95 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_045
; Address: $C08CE0
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_045:
	LDY $94B0			; AC B0 94 | Load from absolute address into Y register
	BEQ $48			  ; F0 48 | Branch if equal
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$19			 ; A9 19 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $93B0,Y		  ; B9 B0 93 | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $9430,Y		  ; B9 30 94 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA $9470,Y		  ; B9 70 94 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $93F0,Y		  ; B9 F0 93 | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $94B0			; CC B0 94 | Compare Y register (absolute)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $94B0			; 8C B0 94 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_047
; Address: $C08D31
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_047:
	BEQ $49			  ; F0 49 | Branch if equal
	LDA #$80			 ; A9 80 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA #$09			 ; A9 09 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$B4			 ; 69 B4 | Add with carry (immediate)
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $95BC,Y		  ; B9 BC 95 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA $95C4,Y		  ; B9 C4 95 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $95CC			; CC CC 95 | Compare Y register (absolute)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $95CC			; 8C CC 95 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_048
; Address: $C08D7D
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_048:
	LDY $966E			; AC 6E 96 | Load from absolute address into Y register
	BEQ $49			  ; F0 49 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $95CE,Y		  ; B9 CE 95 | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $960E,Y		  ; B9 0E 96 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA $962E,Y		  ; B9 2E 96 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $95EE,Y		  ; B9 EE 95 | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA $964E,Y		  ; B9 4E 96 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_049
; Address: $C08DBE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_049:
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $966E			; CC 6E 96 | Compare Y register (absolute)
	BCC $CC			  ; 90 CC | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $966E			; 8C 6E 96 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_04A
; Address: $C08DCC
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_04A:
	LDA $7FEA			; AD EA 7F | Read graphics status
	BEQ $3A			  ; F0 3A | Branch if equal
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$DF			 ; A9 DF | Read graphics status
	STA $004302		  ; 8F 02 43 00 | Update graphics data
	LDA $99EF			; AD EF 99 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	STZ $7FEA			; 9C EA 7F | Store zero to absolute
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_04B
; Address: $C08E0C
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_04B:
	LDA $7FEC			; AD EC 7F | Read graphics status
	BEQ $3A			  ; F0 3A | Branch if equal
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $004304		  ; 8F 04 43 00 | Update graphics data
	LDA #$19			 ; A9 19 | Read graphics status
	STA $004301		  ; 8F 01 43 00 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $004300		  ; 8F 00 43 00 | Update graphics data
	LDA #$84			 ; A9 84 | Read graphics status
	STA $002115		  ; 8F 15 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$35			 ; A9 35 | Read graphics status
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	LDA $99EF			; AD EF 99 | Read graphics status
	STA $002116		  ; 8F 16 21 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $004305		  ; 8F 05 43 00 | Update graphics data
	STZ $7FEC			; 9C EC 7F | Store zero to absolute
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $00420B		  ; 8F 0B 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_04D
; Address: $C08E4C
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_04D:
	LDA $7F8C			; AD 8C 7F | Read graphics status
	STA $002105		  ; 8F 05 21 00 | Update graphics data
	LDA $7F8E			; AD 8E 7F | Read graphics status
	STA $002106		  ; 8F 06 21 00 | Update graphics data
	LDA $7FC8			; AD C8 7F | Read graphics status
	STA $00212C		  ; 8F 2C 21 00 | Update graphics data
	LDA $7FCA			; AD CA 7F | Read graphics status
	STA $00212D		  ; 8F 2D 21 00 | Update graphics data
	LDA $7FCC			; AD CC 7F | Read graphics status
	STA $00212E		  ; 8F 2E 21 00 | Update graphics data
	LDA $7FCE			; AD CE 7F | Read graphics status
	STA $00212F		  ; 8F 2F 21 00 | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $002130		  ; 8F 30 21 00 | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $002131		  ; 8F 31 21 00 | Update graphics data
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $002123		  ; 8F 23 21 00 | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $002124		  ; 8F 24 21 00 | Update graphics data
	LDA $7FC0			; AD C0 7F | Read graphics status
	STA $002126		  ; 8F 26 21 00 | Update graphics data
	LDA $7FC1			; AD C1 7F | Read graphics status
	STA $002127		  ; 8F 27 21 00 | Update graphics data
	LDA $7FC2			; AD C2 7F | Read graphics status
	STA $002128		  ; 8F 28 21 00 | Update graphics data
	LDA $7FC3			; AD C3 7F | Read graphics status
	STA $002129		  ; 8F 29 21 00 | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $002125		  ; 8F 25 21 00 | Update graphics data
	LDA $7FC4			; AD C4 7F | Read graphics status
	STA $00212A		  ; 8F 2A 21 00 | Update graphics data
	LDA $7FC6			; AD C6 7F | Read graphics status
	STA $00212B		  ; 8F 2B 21 00 | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $002132		  ; 8F 32 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $7FD4			; AD D4 7F | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $002132		  ; 8F 32 21 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_04E
; Address: $C08EE4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_04E:
	LDA $7FD5			; AD D5 7F | Read graphics status
	AND #$7C			 ; 29 7C | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	STA $002132		  ; 8F 32 21 00 | Update graphics data
	LDA $7F8A			; AD 8A 7F | Read graphics status
	STA $002101		  ; 8F 01 21 00 | Update graphics data
	LDA $7F90			; AD 90 7F | Read graphics status
	STA $002107		  ; 8F 07 21 00 | Update graphics data
	LDA $7F92			; AD 92 7F | Read graphics status
	STA $002108		  ; 8F 08 21 00 | Update graphics data
	LDA $7F94			; AD 94 7F | Read graphics status
	STA $002109		  ; 8F 09 21 00 | Update graphics data
	LDA $7F96			; AD 96 7F | Read graphics status
	STA $00210A		  ; 8F 0A 21 00 | Update graphics data
	LDA $7F98			; AD 98 7F | Read graphics status
	STA $00210B		  ; 8F 0B 21 00 | Update graphics data
	LDA $7F9A			; AD 9A 7F | Read graphics status
	STA $00210C		  ; 8F 0C 21 00 | Update graphics data
	LDA $7FDA			; AD DA 7F | Read graphics status
	STA $002133		  ; 8F 33 21 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_04F
; Address: $C08F2A
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_04F:
	LDA $7F9C			; AD 9C 7F | Read graphics status
	STA $00210D		  ; 8F 0D 21 00 | Update graphics data
	LDA $7F9D			; AD 9D 7F | Read graphics status
	STA $00210D		  ; 8F 0D 21 00 | Update graphics data
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $00210E		  ; 8F 0E 21 00 | Update graphics data
	LDA $7FA5			; AD A5 7F | Read graphics status
	STA $00210E		  ; 8F 0E 21 00 | Update graphics data
	LDA $7F9E			; AD 9E 7F | Read graphics status
	STA $00210F		  ; 8F 0F 21 00 | Update graphics data
	LDA $7F9F			; AD 9F 7F | Read graphics status
	STA $00210F		  ; 8F 0F 21 00 | Update graphics data
	LDA $7FA6			; AD A6 7F | Read graphics status
	STA $002110		  ; 8F 10 21 00 | Update graphics data
	LDA $7FA7			; AD A7 7F | Read graphics status
	STA $002110		  ; 8F 10 21 00 | Update graphics data
	LDA $7FA0			; AD A0 7F | Read graphics status
	STA $002111		  ; 8F 11 21 00 | Update graphics data
	LDA $7FA1			; AD A1 7F | Read graphics status
	STA $002111		  ; 8F 11 21 00 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $002112		  ; 8F 12 21 00 | Update graphics data
	LDA $7FA9			; AD A9 7F | Read graphics status
	STA $002112		  ; 8F 12 21 00 | Update graphics data
	LDA $7F8C			; AD 8C 7F | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_050
; Address: $C08F85
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_050:
	BNE $5B			  ; D0 5B | Branch if not equal
	LDA $7FAE			; AD AE 7F | Read graphics status
	STA $00211B		  ; 8F 1B 21 00 | Update graphics data
	LDA $7FAF			; AD AF 7F | Read graphics status
	STA $00211B		  ; 8F 1B 21 00 | Update graphics data
	LDA $7FB0			; AD B0 7F | Read graphics status
	STA $00211C		  ; 8F 1C 21 00 | Update graphics data
	LDA $7FB1			; AD B1 7F | Read graphics status
	STA $00211C		  ; 8F 1C 21 00 | Update graphics data
	LDA $7FB2			; AD B2 7F | Read graphics status
	STA $00211D		  ; 8F 1D 21 00 | Update graphics data
	LDA $7FB3			; AD B3 7F | Read graphics status
	STA $00211D		  ; 8F 1D 21 00 | Update graphics data
	LDA $7FB4			; AD B4 7F | Read graphics status
	STA $00211E		  ; 8F 1E 21 00 | Update graphics data
	LDA $7FB5			; AD B5 7F | Read graphics status
	STA $00211E		  ; 8F 1E 21 00 | Update graphics data
	LDA $7FB6			; AD B6 7F | Read graphics status
	STA $00211F		  ; 8F 1F 21 00 | Update graphics data
	LDA $7FB7			; AD B7 7F | Read graphics status
	STA $00211F		  ; 8F 1F 21 00 | Update graphics data
	LDA $7FB8			; AD B8 7F | Read graphics status
	STA $002120		  ; 8F 20 21 00 | Update graphics data
	LDA $7FB9			; AD B9 7F | Read graphics status
	STA $002120		  ; 8F 20 21 00 | Update graphics data
	LDA $7FAC			; AD AC 7F | Read graphics status
	STA $00211A		  ; 8F 1A 21 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_051
; Address: $C08FE3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_051:
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
	LDX #$FC			 ; A2 FC | Load immediate value into X register
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	BRA $E0			  ; 80 E0 | Game work RAM access
	STA $DB1F,X		  ; 9D 1F DB | Update graphics data
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDA #$55			 ; A9 55 | Read graphics status
	STA $DD1F,X		  ; 9D 1F DD | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_052
; Address: $C09008
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_052:
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_053
; Address: $C09014
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_053:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F80			; 8D 80 7F | Update graphics data
	STA $7F81			; 8D 81 7F | Update graphics data
	DEC $7F81			; CE 81 7F | Decrement (absolute)
	BNE $1A			  ; D0 1A | Branch if not equal
	LDA $7F80			; AD 80 7F | Read graphics status
	STA $7F81			; 8D 81 7F | Update graphics data
	LDA $7F88			; AD 88 7F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_054
; Address: $C09048
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_054:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	BRA $DB			  ; 80 DB | Branch always
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_055
; Address: $C09056
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_055:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_056
; Address: $C0905B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_056:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F80			; 8D 80 7F | Update graphics data
	STA $7F81			; 8D 81 7F | Update graphics data
	DEC $7F81			; CE 81 7F | Decrement (absolute)
	BNE $1A			  ; D0 1A | Branch if not equal
	LDA $7F80			; AD 80 7F | Read graphics status
	STA $7F81			; 8D 81 7F | Update graphics data
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_057
; Address: $C0908A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_057:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	BRA $DB			  ; 80 DB | Branch always
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_058
; Address: $C09098
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_058:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_059
; Address: $C090B4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_059:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05A
; Address: $C090B8
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05A:
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05B
; Address: $C090BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05B:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05C
; Address: $C090C2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05C:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05D
; Address: $C090CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05D:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05E
; Address: $C090D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05E:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_05F
; Address: $C090DF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_05F:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	PHA				  ; 48 | Push accumulator to stack
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_060
; Address: $C090EC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_060:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ORA ($74,X)		  ; 01 74 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ORA ($95,X)		  ; 01 95 | Logical OR with accumulator ((zero page,X))
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_063
; Address: $C09107
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_063:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$20			 ; C2 20 | Reset processor status bits
	STZ $32			  ; 64 32 | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_064
; Address: $C09113
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_064:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $30			  ; 85 30 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_065
; Address: $C09123
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_065:
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $C0			  ; 10 C0 | Branch if positive
	REP #$20			 ; C2 20 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ADC $31			  ; 65 31 | Add with carry (zero page)
	STA $31			  ; 85 31 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_066
; Address: $C09134
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_066:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ADC $32			  ; 65 32 | Add with carry (zero page)
	LDA $30			  ; A5 30 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_067
; Address: $C09146
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_067:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	XBA				  ; EB | Exchange accumulator bytes
	PHA				  ; 48 | Push accumulator to stack
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	PHA				  ; 48 | Push accumulator to stack
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($95,X)		  ; 01 95 | Logical OR with accumulator ((zero page,X))
	ORA ($AF,X)		  ; 01 AF | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	STA $004202		  ; 8F 02 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_068
; Address: $C09199
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_068:
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($95,X)		  ; 01 95 | Logical OR with accumulator ((zero page,X))
	ORA ($AF,X)		  ; 01 AF | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	LDA #$00			 ; A9 00 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_069
; Address: $C091E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_069:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_06A
; Address: $C091F8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_06A:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	BRA $F0			  ; 80 F0 | Branch always
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_06C
; Address: $C0921C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_06C:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	STA $004204		  ; 8F 04 42 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004206		  ; 8F 06 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004214		  ; AF 14 42 00 | Read graphics status
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_06D
; Address: $C09243
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_06D:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	STA $004205		  ; 8F 05 42 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $004206		  ; 8F 06 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004214		  ; AF 14 42 00 | Read graphics status
	ORA ($AF,X)		  ; 01 AF | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	STA $004205		  ; 8F 05 42 00 | Update graphics data
	STA $004204		  ; 8F 04 42 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $004206		  ; 8F 06 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_06E
; Address: $C09283
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_06E:
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004214		  ; AF 14 42 00 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_06F
; Address: $C09295
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_06F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	STA $34			  ; 85 34 | Update graphics data
	STA $31			  ; 85 31 | Update graphics data
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDY #$18			 ; A0 18 | Load immediate value into Y register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP $34			  ; C5 34 | Compare accumulator (zero page)
	BCC $02			  ; 90 02 | Branch if carry clear
	SBC $34			  ; E5 34 | Subtract with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	BNE $EE			  ; D0 EE | Branch if not equal
	STA $30			  ; 85 30 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $30			  ; A5 30 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_070
; Address: $C092D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_070:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_071
; Address: $C092DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_071:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_072
; Address: $C092E0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_072:
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_073
; Address: $C092E3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_073:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7F7E			; 8D 7E 7F | Update graphics data
	LDA $7F7A			; AD 7A 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $7F7C			; 4D 7C 7F | Exclusive OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F7C			; AD 7C 7F | Read graphics status
	STA $7F7D			; 8D 7D 7F | Update graphics data
	LDA $7F7B			; AD 7B 7F | Read graphics status
	STA $7F7C			; 8D 7C 7F | Update graphics data
	LDA $7F7A			; AD 7A 7F | Read graphics status
	STA $7F7B			; 8D 7B 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F7A			; 8D 7A 7F | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	STZ $7F7E			; 9C 7E 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_074
; Address: $C09315
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_074:
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F7A			; AD 7A 7F | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $7F7E			; EE 7E 7F | Increment (absolute)
	LDA $7F7B			; AD 7B 7F | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $7F7E			; EE 7E 7F | Increment (absolute)
	LDA $7F7C			; AD 7C 7F | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $7F7E			; EE 7E 7F | Increment (absolute)
	LDA $7F7D			; AD 7D 7F | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $7F7E			; EE 7E 7F | Increment (absolute)
	LDA $7F7E			; AD 7E 7F | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_075
; Address: $C0933E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_075:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits
	INC				  ; 1A | Increment accumulator
	BNE $08			  ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_077
; Address: $C0934A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_077:
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_079
; Address: $C0934E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_079:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_07A
; Address: $C09354
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_07A:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_07B
; Address: $C0935F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_07B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	INC				  ; 1A | Increment accumulator
	BNE $09			  ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_07C
; Address: $C09366
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_07C:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_07F
; Address: $C09378
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_07F:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDA $32			  ; A5 32 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_080
; Address: $C09383
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_080:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_082
; Address: $C0938C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_082:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_083
; Address: $C09396
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_083:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_084
; Address: $C0939A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_084:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	STA $30			  ; 85 30 | Update graphics data
	STA $32			  ; 85 32 | Update graphics data
	STA $34			  ; 85 34 | Update graphics data
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	ROL $34			  ; 26 34 | Rotate left (zero page)
	ROL $36			  ; 26 36 | Rotate left (zero page)
	BCC $01			  ; 90 01 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	LDA $30			  ; A5 30 | Read graphics status
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	ORA $34			  ; 05 34 | Logical OR with accumulator (zero page)
	ORA $36			  ; 05 36 | Logical OR with accumulator (zero page)
	BNE $EB			  ; D0 EB | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_085
; Address: $C093D1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_085:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $32			  ; 85 32 | Update graphics data
	STA $34			  ; 85 34 | Update graphics data
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	LSR $36			  ; 46 36 | Logical shift right (zero page)
	ROR $34			  ; 66 34 | Rotate right (zero page)
	ROR $32			  ; 66 32 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $30			  ; E6 30 | Increment (zero page)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BPL $F2			  ; 10 F2 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $30			  ; A5 30 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_086
; Address: $C093FE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_086:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_087
; Address: $C09404
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_087:
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_088
; Address: $C09407
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_088:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	STA $30			  ; 85 30 | Update graphics data
	BEQ $37			  ; F0 37 | Branch if equal
	STA $32			  ; 85 32 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	BCC $01			  ; 90 01 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	LDA $30			  ; A5 30 | Read graphics status
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	BNE $F3			  ; D0 F3 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_089
; Address: $C0942D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_089:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $32			  ; 85 32 | Update graphics data
	LSR $32			  ; 46 32 | Logical shift right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $30			  ; E6 30 | Increment (zero page)
	BCC $F9			  ; 90 F9 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BPL $F6			  ; 10 F6 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $30			  ; A5 30 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08A
; Address: $C0944E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08A:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08B
; Address: $C09457
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$88			 ; A9 88 | Read graphics status
	LDX #$1F			 ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08C
; Address: $C09468
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08C:
	JSR $14D4			; 20 D4 14 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08D
; Address: $C09472
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$08			 ; A9 08 | Read graphics status
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08E
; Address: $C09483
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08E:
	JSR $14D4			; 20 D4 14 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	CMP #$63			 ; C9 63 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	CMP #$9A			 ; C9 9A | Compare accumulator (immediate)
	BCC $08			  ; 90 08 | Branch if carry clear
	LDA #$99			 ; A9 99 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$63			 ; A9 63 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_08F
; Address: $C094A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_08F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_090
; Address: $C094AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_090:
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$08			 ; A9 08 | Read graphics status
	LDX #$0F			 ; A2 0F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_091
; Address: $C094B4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_091:
	JSR $14D4			; 20 D4 14 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC #$11			 ; E9 11 | Subtract with carry (immediate)
	CMP #$5A			 ; C9 5A | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	CMP #$84			 ; C9 84 | Compare accumulator (immediate)
	BCC $08			  ; 90 08 | Branch if carry clear
	LDA #$83			 ; A9 83 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$5A			 ; A9 5A | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_092
; Address: $C094D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_092:
	STA $30			  ; 85 30 | Update graphics data
	STX $32			  ; 86 32 | Store X register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_093
; Address: $C094DB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_093:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	AND $32			  ; 25 32 | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $30			  ; 65 30 | Add with carry (zero page)
	STA $30			  ; 85 30 | Update graphics data
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	LDA $30			  ; A5 30 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_094
; Address: $C094F2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_094:
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	LDA #$00			 ; A9 00 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register
	BPL $FC			  ; 10 FC | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_096
; Address: $C09506
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_096:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$30			 ; E2 30 | Set processor status bits
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($89,X)		  ; 01 89 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_097
; Address: $C0951D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_097:
	JSR $07F0			; 20 F0 07 | Jump to subroutine
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	EOR #$1F			 ; 49 1F | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	BRA $02			  ; 80 02 | Branch always
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 55 15 C0 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	BIT #$40			 ; 89 40 | Test bits in accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_098
; Address: $C09538
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_098:
	JSR $FF49			; 20 49 FF | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_099
; Address: $C09549
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_099:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09A
; Address: $C0954F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09A:
	JSL $C01505		  ; 22 05 15 C0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09B
; Address: $C09557
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09B:
	ORA $3125,Y		  ; 19 25 31 | Logical OR with accumulator (absolute,Y)
	ROL $564A,X		  ; 3E 4A 56 | Rotate left (absolute,X)
	ADC ($6D,X)		  ; 61 6D | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STX $A298			; 8E 98 A2 | Store X register to absolute address
	PLB				  ; AB | Pull data bank register from stack
	LDA $CDC5,X		  ; BD C5 CD | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09C
; Address: $C0956B
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09C:
	SBC ($E7,X)		  ; E1 E7 | Subtract with carry ((zero page,X))
	CPX $F4F1			; EC F1 F4 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $C208,X		  ; 1D 08 C2 | Logical OR with accumulator (absolute,X)
	BMI $48			  ; 30 48 | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PLB				  ; AB | Pull data bank register from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $1608,Y		  ; B9 08 16 | Read graphics status
	STA $30			  ; 85 30 | Update graphics data
	STZ $32			  ; 64 32 | Store zero to zero page
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $1808,Y		  ; B9 08 18 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $30			  ; 65 30 | Add with carry (zero page)
	STA $30			  ; 85 30 | Update graphics data
	LDA $180A,Y		  ; B9 0A 18 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $32			  ; 65 32 | Add with carry (zero page)
	STA $32			  ; 85 32 | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $1B08,Y		  ; B9 08 1B | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $30			  ; 65 30 | Add with carry (zero page)
	STA $30			  ; 85 30 | Update graphics data
	LDA $1B0A,Y		  ; B9 0A 1B | Read graphics status
	ADC $32			  ; 65 32 | Add with carry (zero page)
	STA $32			  ; 85 32 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $33			  ; A5 33 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA ($A5,X)		  ; 01 A5 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09D
; Address: $C095D3
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09D:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $32			  ; A5 32 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	LDA $32			  ; A5 32 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $31			  ; A5 31 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA $A5			  ; 05 A5 | Logical OR with accumulator (zero page)
	AND ($4A),Y		  ; 31 4A | Logical AND with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $30			  ; A5 30 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	LDA $30			  ; A5 30 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	BMI $AB			  ; 30 AB | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09E
; Address: $C0960A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $2000,Y		  ; 19 00 20 | Logical OR with accumulator (absolute,Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_09F
; Address: $C09634
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_09F:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $4000,Y		  ; 39 00 40 | Logical AND with accumulator (absolute,Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A0
; Address: $C0965C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A0:
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $6000,Y		  ; 59 00 60 | Exclusive OR with accumulator (absolute,Y)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $8000,Y		  ; 79 00 80 | Add with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	STY $00			  ; 84 00 | Store Y register to zero page
	STA $00			  ; 85 00 | Update graphics data
	STX $00			  ; 86 00 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($00),Y		  ; 91 00 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A1
; Address: $C096FB
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A1:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	ORA ($24,X)		  ; 01 24 | Logical OR with accumulator ((zero page,X))
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA ($45,X)		  ; 01 45 | Logical OR with accumulator ((zero page,X))
	ORA ($46,X)		  ; 01 46 | Logical OR with accumulator ((zero page,X))
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	ORA ($50,X)		  ; 01 50 | Logical OR with accumulator ((zero page,X))
	ORA ($51,X)		  ; 01 51 | Logical OR with accumulator ((zero page,X))
	ORA ($52,X)		  ; 01 52 | Logical OR with accumulator ((zero page,X))
	ORA ($53,X)		  ; 01 53 | Logical OR with accumulator ((zero page,X))
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))
	ORA ($55,X)		  ; 01 55 | Logical OR with accumulator ((zero page,X))
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))
	ORA ($57,X)		  ; 01 57 | Logical OR with accumulator ((zero page,X))
	ORA ($58,X)		  ; 01 58 | Logical OR with accumulator ((zero page,X))
	ORA ($59,X)		  ; 01 59 | Logical OR with accumulator ((zero page,X))
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	ORA ($62,X)		  ; 01 62 | Logical OR with accumulator ((zero page,X))
	ORA ($63,X)		  ; 01 63 | Logical OR with accumulator ((zero page,X))
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))
	ORA ($65,X)		  ; 01 65 | Logical OR with accumulator ((zero page,X))
	ORA ($66,X)		  ; 01 66 | Logical OR with accumulator ((zero page,X))
	ORA ($67,X)		  ; 01 67 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	ORA ($69,X)		  ; 01 69 | Logical OR with accumulator ((zero page,X))
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A2
; Address: $C0975F
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A2:
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	ORA ($74,X)		  ; 01 74 | Logical OR with accumulator ((zero page,X))
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	ORA ($88,X)		  ; 01 88 | Logical OR with accumulator ((zero page,X))
	ORA ($89,X)		  ; 01 89 | Logical OR with accumulator ((zero page,X))
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA ($91,X)		  ; 01 91 | Logical OR with accumulator ((zero page,X))
	ORA ($92,X)		  ; 01 92 | Logical OR with accumulator ((zero page,X))
	ORA ($93,X)		  ; 01 93 | Logical OR with accumulator ((zero page,X))
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	ORA ($95,X)		  ; 01 95 | Logical OR with accumulator ((zero page,X))
	ORA ($96,X)		  ; 01 96 | Logical OR with accumulator ((zero page,X))
	ORA ($97,X)		  ; 01 97 | Logical OR with accumulator ((zero page,X))
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	BPL $02			  ; 10 02 | Branch if positive
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $2002,Y		  ; 19 02 20 | Logical OR with accumulator (absolute,Y)
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A3
; Address: $C097C4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A3:
	JSL $022302		  ; 22 02 23 02 | Jump to subroutine long
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BMI $02			  ; 30 02 | Branch if negative
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $4002,Y		  ; 39 02 40 | Logical AND with accumulator (absolute,Y)
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A4
; Address: $C097EC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A4:
	WDM #$02			 ; 42 02 | Reserved instruction
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$02			 ; 49 02 | Exclusive OR with accumulator (immediate)
	BVC $02			  ; 50 02 | Branch if overflow clear
	EOR ($02),Y		  ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BRA $12			  ; 80 12 | Branch always
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A6
; Address: $C09827
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A6:
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	STY $35			  ; 84 35 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $48			  ; 64 48 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A7
; Address: $C09844
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A7:
	JSR $0051			; 20 51 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BIT $74			  ; 24 74 | Test bits in accumulator (zero page)
	BRA $76			  ; 80 76 | Branch always
	ADC $9200,Y		  ; 79 00 92 | Add with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	STY $00			  ; 84 00 | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A8
; Address: $C09872
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A8:
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	STY $99			  ; 84 99 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	ORA ($96,X)		  ; 01 96 | Logical OR with accumulator ((zero page,X))
	ORA ($52,X)		  ; 01 52 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BPL $01			  ; 10 01 | Branch if positive
	STZ $12			  ; 64 12 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0A9
; Address: $C0988E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0A9:
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0AB
; Address: $C09899
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0AB:
	JSL $254401		  ; 22 01 44 25 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	ORA ($24,X)		  ; 01 24 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	ORA ($92,X)		  ; 01 92 | Logical OR with accumulator ((zero page,X))
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0AC
; Address: $C098BE
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0AC:
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	STY $63			  ; 84 63 | Store Y register to zero page
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ROR $01			  ; 66 01 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($52,X)		  ; 01 52 | Logical OR with accumulator ((zero page,X))
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ADC $7601,Y		  ; 79 01 76 | Add with carry (absolute,Y)
	STA ($01,X)		  ; 81 01 | Update graphics data
	STY $01			  ; 84 01 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STX $01			  ; 86 01 | Store X register to zero page
	BIT #$01			 ; 89 01 | Test bits in accumulator (immediate)
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	STA $2401,Y		  ; 99 01 24 | Update graphics data
	BRA $04			  ; 80 04 | Branch always
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0AE
; Address: $C0990E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0AE:
	JSL $252802		  ; 22 02 28 25 | Jump to subroutine long
	STY $27			  ; 84 27 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	BMI $02			  ; 30 02 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	STZ $40			  ; 64 40 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0AF
; Address: $C09925
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0AF:
	JSR $0243			; 20 43 02 | Jump to subroutine
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	BVC $02			  ; 50 02 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BIT $66			  ; 24 66 | Test bits in accumulator (zero page)
	BRA $68			  ; 80 68 | Branch always
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	ADC $6002,Y		  ; 79 02 60 | Add with carry (absolute,Y)
	STA ($02,X)		  ; 81 02 | Update graphics data
	STY $02			  ; 84 02 | Store Y register to zero page
	STX $02			  ; 86 02 | Store X register to zero page
	PLP				  ; 28 | Pull processor status from stack
	BIT #$02			 ; 89 02 | Test bits in accumulator (immediate)
	STY $91			  ; 84 91 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	STA $0802,Y		  ; 99 02 08 | Update graphics data
	STZ $04			  ; 64 04 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B0
; Address: $C09970
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B0:
	JSR $0307			; 20 07 03 | Jump to subroutine
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B2
; Address: $C09983
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B2:
	JSL $251203		  ; 22 03 12 25 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	BRA $32			  ; 80 32 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B3
; Address: $C0999E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B3:
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVC $03			  ; 50 03 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	STY $55			  ; 84 55 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B6
; Address: $C099BB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B6:
	JSR $0371			; 20 71 03 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA ($03,X)		  ; 81 03 | Update graphics data
	STY $03			  ; 84 03 | Store Y register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	BIT #$03			 ; 89 03 | Test bits in accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($03),Y		  ; 91 03 | Update graphics data
	BIT $94			  ; 24 94 | Test bits in accumulator (zero page)
	BRA $96			  ; 80 96 | Branch always
	STA $9203,Y		  ; 99 03 92 | Update graphics data
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B7
; Address: $C099E9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B7:
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	STY $19			  ; 84 19 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B8
; Address: $C099F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B8:
	JSL $249604		  ; 22 04 96 24 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BMI $04			  ; 30 04 | Branch if negative
	STZ $32			  ; 64 32 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0B9
; Address: $C09A06
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0B9:
	JSR $0435			; 20 35 04 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	WDM #$04			 ; 42 04 | Reserved instruction
	EOR $04			  ; 45 04 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVC $04			  ; 50 04 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	BRA $60			  ; 80 60 | Branch always
	ADC $04			  ; 65 04 | Add with carry (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($04),Y		  ; 71 04 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BA
; Address: $C09A3A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BA:
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	STA ($04,X)		  ; 81 04 | Update graphics data
	STY $83			  ; 84 83 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	STX $04			  ; 86 04 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	STA ($04),Y		  ; 91 04 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	STZ $96			  ; 64 96 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BB
; Address: $C09A51
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BB:
	JSR $0499			; 20 99 04 | Jump to subroutine
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $56			  ; 05 56 | Logical OR with accumulator (zero page)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ORA $68			  ; 05 68 | Logical OR with accumulator (zero page)
	ORA $2405,Y		  ; 19 05 24 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BC
; Address: $C09A6D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BC:
	JSL $248005		  ; 22 05 80 24 | Jump to subroutine long
	ORA $36			  ; 05 36 | Logical OR with accumulator (zero page)
	ORA $92			  ; 05 92 | Logical OR with accumulator (zero page)
	AND #$05			 ; 29 05 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $60			  ; 05 60 | Logical OR with accumulator (zero page)
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA $72			  ; 05 72 | Logical OR with accumulator (zero page)
	WDM #$05			 ; 42 05 | Reserved instruction
	PLP				  ; 28 | Pull processor status from stack
	EOR $05			  ; 45 05 | Exclusive OR with accumulator (zero page)
	STY $47			  ; 84 47 | Store Y register to zero page
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	BVC $05			  ; 50 05 | Branch if overflow clear
	ORA $52			  ; 05 52 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $64			  ; 05 64 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BD
; Address: $C09A9B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BD:
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	ORA $76			  ; 05 76 | Logical OR with accumulator (zero page)
	ADC $05			  ; 65 05 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	BVS $05			  ; 70 05 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $56			  ; 05 56 | Logical OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	STA ($05,X)		  ; 81 05 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	STX $05			  ; 86 05 | Store X register to zero page
	BRA $88			  ; 80 88 | Branch always
	ORA $36			  ; 05 36 | Logical OR with accumulator (zero page)
	STA ($05),Y		  ; 91 05 | Update graphics data
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	STA $6005,Y		  ; 99 05 60 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BE
; Address: $C09ACA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BE:
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $72			  ; 06 72 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	STY $11			  ; 84 11 | Store Y register to zero page
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	ASL $96			  ; 06 96 | Arithmetic shift left (zero page)
	ASL $52			  ; 06 52 | Arithmetic shift left (zero page)
	ORA $0806,Y		  ; 19 06 08 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0BF
; Address: $C09AE2
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0BF:
	JSL $246406		  ; 22 06 64 24 | Jump to subroutine long
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $76			  ; 06 76 | Arithmetic shift left (zero page)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	ASL $88			  ; 06 88 | Arithmetic shift left (zero page)
	ASL $44			  ; 06 44 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ASL $56			  ; 06 56 | Arithmetic shift left (zero page)
	WDM #$06			 ; 42 06 | Reserved instruction
	EOR $06			  ; 45 06 | Exclusive OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	BVC $06			  ; 50 06 | Branch if overflow clear
	BRA $52			  ; 80 52 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $13			  ; 10 13 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROR $19			  ; 66 19 | Rotate right (zero page)
	AND ($26,X)		  ; 21 26 | Logical AND with accumulator ((zero page,X))
	BRA $76			  ; 80 76 | Branch always
	AND $5200,Y		  ; 39 00 52 | Logical AND with accumulator (absolute,Y)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	WDM #$52			 ; 42 52 | Reserved instruction
	BIT $98			  ; 24 98 | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C0
; Address: $C09B32
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C0:
	ADC $00			  ; 65 00 | Add with carry (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $78			  ; 64 78 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ORA $0085,Y		  ; 19 85 00 | Logical OR with accumulator (absolute,Y)
	STA ($00),Y		  ; 91 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BMI $98			  ; 30 98 | Branch if negative
	STA $04			  ; 85 04 | Update graphics data
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	EOR ($11,X)		  ; 41 11 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C1
; Address: $C09B4F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C1:
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	EOR ($24),Y		  ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ORA ($92,X)		  ; 01 92 | Logical OR with accumulator ((zero page,X))
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	BVC $01			  ; 50 01 | Branch if overflow clear
	STZ $28			  ; 64 28 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $63			  ; 84 63 | Store Y register to zero page
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	AND $0170,Y		  ; 39 70 01 | Logical AND with accumulator (absolute,Y)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BVC $83			  ; 50 83 | Branch if overflow clear
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C2
; Address: $C09B83
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C2:
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ADC ($09),Y		  ; 71 09 | Add with carry ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	ROL $16			  ; 26 16 | Rotate left (zero page)
	BIT $82			  ; 24 82 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C3
; Address: $C09B92
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C3:
	JSL $376002		  ; 22 02 60 37 | Jump to subroutine long
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	WDM #$02			 ; 42 02 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	EOR #$02			 ; 49 02 | Exclusive OR with accumulator (immediate)
	EOR $0255,Y		  ; 59 55 02 | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	AND $75			  ; 25 75 | Logical AND with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BRA $81			  ; 80 81 | Branch always
	STY $35			  ; 84 35 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C4
; Address: $C09BBC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C4:
	JSR $9491			; 20 91 94 | Jump to subroutine
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STZ $12			  ; 64 12 | Store zero to zero page
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BIT #$53			 ; 89 53 | Test bits in accumulator (immediate)
	BRA $44			  ; 80 44 | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C6
; Address: $C09BF0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C6:
	DEY				  ; 88 | Decrement Y register
	BPL $80			  ; 10 80 | Branch if positive
	BIT $66			  ; 24 66 | Test bits in accumulator (zero page)
	STX $03			  ; 86 03 | Store X register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C7
; Address: $C09BF9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C7:
	AND ($93,X)		  ; 21 93 | Logical AND with accumulator ((zero page,X))
	STA $3203,Y		  ; 99 03 32 | Update graphics data
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $4004,Y		  ; 19 04 40 | Logical OR with accumulator (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ORA #$39			 ; 09 39 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	STZ $45			  ; 64 45 | Store zero to zero page
	STY $19			  ; 84 19 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C8
; Address: $C09C20
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C8:
	JSR $5875			; 20 75 58 | Jump to subroutine
	BMI $65			  ; 30 65 | Branch if negative
	STA $71			  ; 85 71 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	EOR ($78,X)		  ; 41 78 | Exclusive OR with accumulator ((zero page,X))
	STZ $96			  ; 64 96 | Store zero to zero page
	STY $04			  ; 84 04 | Store Y register to zero page
	STA ($04),Y		  ; 91 04 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $05			  ; 24 05 | Test bits in accumulator (zero page)
	STY $30			  ; 84 30 | Store Y register to zero page
	ORA $52			  ; 05 52 | Logical OR with accumulator (zero page)
	AND $0537,Y		  ; 39 37 05 | Logical AND with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	BVC $50			  ; 50 50 | Branch if overflow clear
	ORA $60			  ; 05 60 | Logical OR with accumulator (zero page)
	ORA $57			  ; 05 57 | Logical OR with accumulator (zero page)
	ORA $96			  ; 05 96 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0C9
; Address: $C09C63
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0C9:
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	BVS $05			  ; 70 05 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	BIT #$05			 ; 89 05 | Test bits in accumulator (immediate)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0CA
; Address: $C09C7B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0CA:
	ASL $48			  ; 06 48 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	STY $03			  ; 84 03 | Store Y register to zero page
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	EOR $0622,Y		  ; 59 22 06 | Exclusive OR with accumulator (absolute,Y)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	ADC #$35			 ; 69 35 | Add with carry (immediate)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	AND $42			  ; 25 42 | Hardware register operation
	ASL $64			  ; 06 64 | Arithmetic shift left (zero page)
	BRA $48			  ; 80 48 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $36			  ; 06 36 | Arithmetic shift left (zero page)
	STA ($61),Y		  ; 91 61 | Update graphics data
	ASL $72			  ; 06 72 | Arithmetic shift left (zero page)
	LSR $68			  ; 46 68 | Logical shift right (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $44			  ; 06 44 | Arithmetic shift left (zero page)
	STA ($06,X)		  ; 81 06 | Update graphics data
	BRA $12			  ; 80 12 | Branch always
	DEY				  ; 88 | Decrement Y register
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $52			  ; 06 52 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0CB
; Address: $C09CC1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0CB:
	BIT #$20			 ; 89 20 | Test bits in accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	ORA ($47),Y		  ; 11 47 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	ROR $53			  ; 66 53 | Rotate right (zero page)
	AND ($60,X)		  ; 21 60 | Logical AND with accumulator ((zero page,X))
	ROR $07			  ; 66 07 | Rotate right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STY $87			  ; 84 87 | Store Y register to zero page
	ADC $2007,Y		  ; 79 07 20 | Add with carry (absolute,Y)
	STX $07			  ; 86 07 | Store X register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2807,Y		  ; 99 07 28 | Update graphics data
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STZ $64			  ; 64 64 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0CD
; Address: $C09D05
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0CD:
	BMI $32			  ; 30 32 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STX $38			  ; 86 38 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	EOR ($45,X)		  ; 41 45 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $96			  ; 80 96 | Branch always
	EOR ($08),Y		  ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ADC $08			  ; 65 08 | Add with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	ADC ($08),Y		  ; 71 08 | Add with carry ((zero page),Y)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0CE
; Address: $C09D26
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0CE:
	STY $08			  ; 84 08 | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	STA ($08),Y		  ; 91 08 | Update graphics data
	STY $97			  ; 84 97 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	AND $0904,Y		  ; 39 04 09 | Logical AND with accumulator (absolute,Y)
	BPL $09			  ; 10 09 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BVC $17			  ; 50 17 | Branch if overflow clear
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ADC ($30,X)		  ; 61 30 | Add with carry ((zero page,X))
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	ORA #$84			 ; 09 84 | Logical OR with accumulator (immediate)
	ADC ($43),Y		  ; 71 43 | Add with carry ((zero page),Y)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	BVC $09			  ; 50 09 | Branch if overflow clear
	ORA #$92			 ; 09 92 | Logical OR with accumulator (immediate)
	ORA #$28			 ; 09 28 | Logical OR with accumulator (immediate)
	ADC #$09			 ; 69 09 | Add with carry (immediate)
	STZ $48			  ; 64 48 | Store zero to zero page
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	EOR $0989,Y		  ; 59 89 09 | Exclusive OR with accumulator (absolute,Y)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	BVS $02			  ; 70 02 | Branch if overflow set
	BPL $44			  ; 10 44 | Branch if positive
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)
	BPL $80			  ; 10 80 | Branch if positive
	BRA $15			  ; 80 15 | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D0
; Address: $C09D7A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D0:
	JSL $915210		  ; 22 10 52 91 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BPL $88			  ; 10 88 | Branch if positive
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	BPL $24			  ; 10 24 | Branch if positive
	WDM #$10			 ; 42 10 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D1
; Address: $C09D8A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D1:
	PHA				  ; 48 | Push accumulator to stack
	BPL $96			  ; 10 96 | Branch if positive
	BPL $32			  ; 10 32 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($10,X)		  ; 61 10 | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BPL $04			  ; 10 04 | Branch if positive
	ADC $1074,Y		  ; 79 74 10 | Add with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STA ($10,X)		  ; 81 10 | Update graphics data
	BIT #$87			 ; 89 87 | Test bits in accumulator (immediate)
	BPL $12			  ; 10 12 | Branch if positive
	EOR $94			  ; 45 94 | Exclusive OR with accumulator (zero page)
	BPL $48			  ; 10 48 | Branch if positive
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	STY $55			  ; 84 55 | Store Y register to zero page
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)
	ORA ($14),Y		  ; 11 14 | Logical OR with accumulator ((zero page),Y)
	ORA ($56),Y		  ; 11 56 | Logical OR with accumulator ((zero page),Y)
	ROR $20			  ; 66 20 | Rotate right (zero page)
	ORA ($92),Y		  ; 11 92 | Logical OR with accumulator ((zero page),Y)
	AND ($27,X)		  ; 21 27 | Logical AND with accumulator ((zero page,X))
	ORA ($28),Y		  ; 11 28 | Logical OR with accumulator ((zero page),Y)
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	LSR $11			  ; 46 11 | Logical shift right (zero page)
	ORA ($72),Y		  ; 11 72 | Logical OR with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $0811,Y		  ; 59 11 08 | Exclusive OR with accumulator (absolute,Y)
	ROR $11			  ; 66 11 | Rotate right (zero page)
	ORA #$73			 ; 09 73 | Logical OR with accumulator (immediate)
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	STZ $79			  ; 64 79 | Store zero to zero page
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D2
; Address: $C09DDD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D2:
	JSR $1186			; 20 86 11 | Jump to subroutine
	ORA ($88),Y		  ; 11 88 | Logical OR with accumulator ((zero page),Y)
	BMI $99			  ; 30 99 | Branch if negative
	ORA ($24),Y		  ; 11 24 | Logical OR with accumulator ((zero page),Y)
	STX $05			  ; 86 05 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D4
; Address: $C09DED
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D4:
	EOR ($12,X)		  ; 41 12 | Exclusive OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	AND $12			  ; 25 12 | Logical AND with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	EOR $12			  ; 45 12 | Exclusive OR with accumulator (zero page)
	EOR ($12),Y		  ; 51 12 | Exclusive OR with accumulator ((zero page),Y)
	AND #$58			 ; 29 58 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	STY $64			  ; 84 64 | Store Y register to zero page
	STY $39			  ; 84 39 | Store Y register to zero page
	ADC ($12),Y		  ; 71 12 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D5
; Address: $C09E14
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D5:
	JSR $7795			; 20 95 77 | Jump to subroutine
	BVC $84			  ; 50 84 | Branch if overflow clear
	ORA $91			  ; 05 91 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ADC ($97,X)		  ; 61 97 | Add with carry ((zero page,X))
	STZ $16			  ; 64 16 | Store zero to zero page
	BPL $13			  ; 10 13 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BMI $13			  ; 30 13 | Branch if negative
	BRA $48			  ; 80 48 | Branch always
	BVC $13			  ; 50 13 | Branch if overflow clear
	EOR $1356,Y		  ; 59 56 13 | Exclusive OR with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	BIT $70			  ; 24 70 | Test bits in accumulator (zero page)
	ADC #$13			 ; 69 13 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D6
; Address: $C09E51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D6:
	AND $76			  ; 25 76 | Logical AND with accumulator (zero page)
	BRA $82			  ; 80 82 | Branch always
	BIT #$13			 ; 89 13 | Test bits in accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($95),Y		  ; 91 95 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	ORA #$14			 ; 09 14 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D7
; Address: $C09E6E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D7:
	JSL $684814		  ; 22 14 48 68 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	STY $23			  ; 84 23 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0D8
; Address: $C09E78
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0D8:
	JSR $4179			; 20 79 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BIT #$54			 ; 89 54 | Test bits in accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	EOR $61			  ; 45 61 | Exclusive OR with accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0DA
; Address: $C09E99
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0DA:
	JSL $441494		  ; 22 94 14 44 | Jump to subroutine long
	BRA $32			  ; 80 32 | Branch always
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0DB
; Address: $C09EAA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0DB:
	JSR $8815			; 20 15 88 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL $15			  ; 26 15 | Rotate left (zero page)
	BIT $54			  ; 24 54 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0DD
; Address: $C09EBD
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0DD:
	JSR $1553			; 20 53 15 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	EOR $0415,Y		  ; 59 15 04 | Exclusive OR with accumulator (absolute,Y)
	AND ($66),Y		  ; 31 66 | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	STX $72			  ; 86 72 | Store X register to zero page
	EOR ($79,X)		  ; 41 79 | Exclusive OR with accumulator ((zero page,X))
	STA $15			  ; 85 15 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	STY $07			  ; 84 07 | Store Y register to zero page
	STA $2015,Y		  ; 99 15 20 | Update graphics data
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	AND #$25			 ; 29 25 | Logical AND with accumulator (immediate)
	STZ $84			  ; 64 84 | Store zero to zero page
	AND ($16),Y		  ; 31 16 | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	BVC $51			  ; 50 51 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	ASL $58			  ; 06 58 | Arithmetic shift left (zero page)
	ADC ($64,X)		  ; 61 64 | Add with carry ((zero page,X))
	BRA $16			  ; 80 16 | Branch always
	ADC ($16),Y		  ; 71 16 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0DE
; Address: $C09F1B
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0DE:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $A8			  ; 05 A8 | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA $A2			  ; 05 A2 | Logical OR with accumulator (zero page)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA				  ; BF E2 1F C0 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0DF
; Address: $C09F66
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0DF:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA $A2			  ; 05 A2 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E0
; Address: $C09F7C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E0:
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA				  ; BF D6 1F C0 | Read graphics status
	STA $30			  ; 85 30 | Update graphics data
	LDA				  ; BF E2 1F C0 | Read graphics status
	STA $32			  ; 85 32 | Update graphics data
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $30			  ; 65 30 | Add with carry (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $30			  ; 65 30 | Add with carry (zero page)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $32			  ; 65 32 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E1
; Address: $C09FCA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E1:
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	STA $0A			  ; 85 0A | Update graphics data
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	STA $FE			  ; 85 FE | Update graphics data
	INC $FE83,X		  ; FE 83 FE | Increment (absolute,X)
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	STA $FE			  ; 85 FE | Update graphics data
	STA ($FE,X)		  ; 81 FE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E2
; Address: $C09FEC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E2:
	INC $0883,X		  ; FE 83 08 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	PEA #$F2F0		   ; F4 F0 F2 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E3
; Address: $C0A025
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E3:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E4
; Address: $C0A046
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E4:
	ORA ($BD,X)		  ; 01 BD | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	AND #$E0			 ; 29 E0 | Game work RAM access
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$E0			 ; 29 E0 | Game work RAM access
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	BEQ $B8			  ; F0 B8 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E5
; Address: $C0A096
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E5:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E6
; Address: $C0A0A3
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E6:
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$E0			 ; 29 E0 | Game work RAM access
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$1F			 ; A9 1F | Read graphics status
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$E0			 ; 29 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$E0			 ; A9 E0 | Game work RAM access
	AND #$E0			 ; 29 E0 | Game work RAM access
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E7
; Address: $C0A121
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E7:
	LDA #$00			 ; A9 00 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BCC $96			  ; 90 96 | Branch if carry clear
	BEQ $94			  ; F0 94 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E8
; Address: $C0A140
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E8:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$E0			 ; 29 E0 | Game work RAM access
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0E9
; Address: $C0A17F
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0E9:
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ORA $B0			  ; 05 B0 | Logical OR with accumulator (zero page)
	LDA #$00			 ; A9 00 | Read graphics status
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$E0			 ; 29 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	LDA #$00			 ; A9 00 | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BCC $9F			  ; 90 9F | Branch if carry clear
	BEQ $9D			  ; F0 9D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0EA
; Address: $C0A1E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0EA:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0EB
; Address: $C0A1E9
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0EB:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA ($BD,X)		  ; 01 BD | Logical OR with accumulator ((zero page,X))
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	BMI $DA			  ; 30 DA | Branch if negative
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0EC
; Address: $C0A233
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0EC:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $30			  ; A5 30 | Read graphics status
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$1F			 ; A9 1F | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0ED
; Address: $C0A249
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0ED:
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	BEQ $99			  ; F0 99 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0EE
; Address: $C0A271
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0EE:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))
	ORA $EB			  ; 05 EB | Logical OR with accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	BIT #$9C			 ; 89 9C | Test bits in accumulator (immediate)
	BIT #$B9			 ; 89 B9 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F0
; Address: $C0A29F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F0:
	LDA $8916			; AD 16 89 | Read graphics status
	BIT #$C8			 ; 89 C8 | Test bits in accumulator (immediate)
	INY				  ; C8 | Increment Y register
	CPY $891A			; CC 1A 89 | Compare Y register (absolute)
	BCC $EA			  ; 90 EA | Branch if carry clear
	BEQ $E8			  ; F0 E8 | Branch if equal
	LDA $890C			; AD 0C 89 | Read graphics status
	BNE $07			  ; D0 07 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F1
; Address: $C0A2BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F1:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F2
; Address: $C0A2C1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F2:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $891A			; 9C 1A 89 | Store zero to absolute
	STZ $890C			; 9C 0C 89 | Store zero to absolute
	STZ $8916			; 9C 16 89 | Store zero to absolute
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $8912			; 8D 12 89 | Update graphics data
	STA $8914			; 8D 14 89 | Update graphics data
	LDA $7FD6			; AD D6 7F | Read graphics status
	CMP $8912			; CD 12 89 | Compare accumulator (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	STA $8910			; 8D 10 89 | Update graphics data
	STZ $890E			; 9C 0E 89 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F3
; Address: $C0A2EE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F3:
	JSR $2324			; 20 24 23 | Jump to subroutine
	STA $7FD4			; 8D D4 7F | Update graphics data
	LDA $8916			; AD 16 89 | Read graphics status
	BIT #$AD			 ; 89 AD | Test bits in accumulator (immediate)
	BIT #$D0			 ; 89 D0 | Test bits in accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F4
; Address: $C0A301
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F4:
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F5
; Address: $C0A306
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F5:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F6
; Address: $C0A30D
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F6:
	STZ $8916			; 9C 16 89 | Store zero to absolute
	STA $8912			; 8D 12 89 | Update graphics data
	STA $8914			; 8D 14 89 | Update graphics data
	LDA $0400,Y		  ; B9 00 04 | Read graphics status
	CMP $8912			; CD 12 89 | Compare accumulator (absolute)
	BEQ $6B			  ; F0 6B | Branch if equal
	STA $8910			; 8D 10 89 | Update graphics data
	STZ $890E			; 9C 0E 89 | Store zero to absolute
	LDA $8910			; AD 10 89 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $8914			; 8D 14 89 | Update graphics data
	LDA $8912			; AD 12 89 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CMP $8914			; CD 14 89 | Compare accumulator (absolute)
	BEQ $09			  ; F0 09 | Branch if equal
	INC $890E			; EE 0E 89 | Increment (absolute)
	ROL $890E			; 2E 0E 89 | Rotate left (absolute)
	ASL $890E			; 0E 0E 89 | Arithmetic shift left (absolute)
	LDA $8910			; AD 10 89 | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	STA $8914			; 8D 14 89 | Update graphics data
	LDA $8912			; AD 12 89 | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	CMP $8914			; CD 14 89 | Compare accumulator (absolute)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $890E			; EE 0E 89 | Increment (absolute)
	ROL $890E			; 2E 0E 89 | Rotate left (absolute)
	ASL $890E			; 0E 0E 89 | Arithmetic shift left (absolute)
	LDA $8910			; AD 10 89 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $8914			; 8D 14 89 | Update graphics data
	LDA $8912			; AD 12 89 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	CMP $8914			; CD 14 89 | Compare accumulator (absolute)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $890E			; EE 0E 89 | Increment (absolute)
	ROL $890E			; 2E 0E 89 | Rotate left (absolute)
	ASL $890E			; 0E 0E 89 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F7
; Address: $C0A37B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F7:
	LDX $890E			; AE 0E 89 | Load from absolute address into X register
	LDA				  ; BF 8A 23 C0 | Read graphics status
	STA $8916			; 8D 16 89 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $8912			; 6D 12 89 | Add with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0F9
; Address: $C0A39A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0F9:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0FA
; Address: $C0A3BA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0FA:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0FB
; Address: $C0A3DA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0FB:
	JSR $2004			; 20 04 20 | Jump to subroutine
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0FC
; Address: $C0A3FA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0FC:
	JSR $20FC			; 20 FC 20 | Jump to subroutine
	AND ($FC,X)		  ; 21 FC | Logical AND with accumulator ((zero page,X))
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	SBC ($FB,X)		  ; E1 FB | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0FD
; Address: $C0A416
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0FD:
	JSL $C02423		  ; 22 23 24 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_0FF
; Address: $C0A423
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_0FF:
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	LDA $7FF8			; AD F8 7F | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $30			  ; 85 30 | Update graphics data
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BPL $0C			  ; 10 0C | Branch if positive
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_100
; Address: $C0A43E
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_100:
	JSR $700C			; 20 0C 70 | Jump to subroutine
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $0C			  ; 80 0C | Branch always
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$80			 ; A9 80 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$04			 ; A9 04 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$08			 ; A9 08 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$10			 ; A9 10 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$20			 ; A9 20 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_101
; Address: $C0A494
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_101:
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$40			 ; A9 40 | Read graphics status
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_102
; Address: $C0A4A7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_102:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_103
; Address: $C0A4B2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_103:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F72			; AD 72 7F | Read graphics status
	AND $7F70			; 2D 70 7F | Logical AND with accumulator (absolute)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	BVS $7F			  ; 70 7F | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_104
; Address: $C0A4D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_104:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_105
; Address: $C0A4DB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_105:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	BNE $08			  ; D0 08 | Branch if not equal
	STZ $7F74			; 9C 74 7F | Store zero to absolute
	STZ $7F72			; 9C 72 7F | Store zero to absolute
	BRA $26			  ; 80 26 | Branch always
	LDA $7F74			; AD 74 7F | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	STZ $7F70			; 9C 70 7F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_106
; Address: $C0A4FA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_106:
	BRA $16			  ; 80 16 | Branch always
	LDA $7F72			; AD 72 7F | Read graphics status
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$06			 ; A9 06 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$14			 ; A9 14 | Read graphics status
	STA $7F74			; 8D 74 7F | Update graphics data
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_107
; Address: $C0A516
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_107:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_108
; Address: $C0A521
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_108:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	BNE $08			  ; D0 08 | Branch if not equal
	STZ $7F74			; 9C 74 7F | Store zero to absolute
	STZ $7F72			; 9C 72 7F | Store zero to absolute
	BRA $26			  ; 80 26 | Branch always
	LDA $7F74			; AD 74 7F | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	BRA $16			  ; 80 16 | Branch always
	LDA $7F72			; AD 72 7F | Read graphics status
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$10			 ; A9 10 | Read graphics status
	STA $7F74			; 8D 74 7F | Update graphics data
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_109
; Address: $C0A55C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_109:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_10C
; Address: $C0A567
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_10C:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7E7F70		  ; AF 70 7F 7E | Read graphics status
	BNE $F2			  ; D0 F2 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_10E
; Address: $C0A575
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_10E:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7E7F70		  ; AF 70 7F 7E | Read graphics status
	BEQ $F2			  ; F0 F2 | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_10F
; Address: $C0A587
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_10F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_110
; Address: $C0A58E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_110:
	JSL $C025A6		  ; 22 A6 25 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_111
; Address: $C0A597
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_111:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_112
; Address: $C0A59D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_112:
	JSL $C025A6		  ; 22 A6 25 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_113
; Address: $C0A5A6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_113:
	LDA $7E93AE		  ; AF AE 93 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Read graphics status
	STA				  ; 9F AE 8B 7E | Update graphics data
	LDA $0002,Y		  ; B9 02 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA				  ; 9F AE 8D 7E | Update graphics data
	LDA $0004,Y		  ; B9 04 00 | Read graphics status
	STA				  ; 9F AE 8F 7E | Update graphics data
	LDA $0006,Y		  ; B9 06 00 | Read graphics status
	STA				  ; 9F AE 91 7E | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_114
; Address: $C0A5CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_114:
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $7E93AE		  ; 8F AE 93 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_115
; Address: $C0A5D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_115:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_116
; Address: $C0A5D9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_116:
	JSL $C025F1		  ; 22 F1 25 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_117
; Address: $C0A5E2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_117:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_118
; Address: $C0A5E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_118:
	JSL $C025F1		  ; 22 F1 25 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_119
; Address: $C0A5F1
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_119:
	LDA $7E966E		  ; AF 6E 96 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Read graphics status
	STA				  ; 9F CE 95 7E | Update graphics data
	LDA $0002,Y		  ; B9 02 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA				  ; 9F EE 95 7E | Update graphics data
	LDA $0004,Y		  ; B9 04 00 | Read graphics status
	STA				  ; 9F 0E 96 7E | Update graphics data
	LDA $0006,Y		  ; B9 06 00 | Read graphics status
	STA				  ; 9F 2E 96 7E | Update graphics data
	LDA $0008,Y		  ; B9 08 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA				  ; 9F 4E 96 7E | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $7E966E		  ; 8F 6E 96 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11A
; Address: $C0A627
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11A:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11B
; Address: $C0A62E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11B:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	LDX $A98B			; AE 8B A9 | Load from absolute address into X register
	ROR $9900,X		  ; 7E 00 99 | Rotate right (absolute,X)
	LDX $A38D			; AE 8D A3 | Load from absolute address into X register
	STA $8FAE,Y		  ; 99 AE 8F | Update graphics data
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDX $C891			; AE 91 C8 | Load from absolute address into X register
	INY				  ; C8 | Increment Y register
	STY $93AE			; 8C AE 93 | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11C
; Address: $C0A656
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11C:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $95CC			; AC CC 95 | Load from absolute address into Y register
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	STA $95BC,Y		  ; 99 BC 95 | Update graphics data
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	CPY $95			  ; C4 95 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STY $95CC			; 8C CC 95 | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11D
; Address: $C0A67F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11D:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F86		  ; 8F 86 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7F82		  ; 8F 82 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11E
; Address: $C0A68F
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11E:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_11F
; Address: $C0A692
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_11F:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	LDA $7E7F86		  ; AF 86 7F 7E | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $0A			  ; 90 0A | Branch if carry clear
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_120
; Address: $C0A6AB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_120:
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_121
; Address: $C0A6B4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_121:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ROR $FF29,X		  ; 7E 29 FF | Rotate right (absolute,X)
	STA $7E7F82		  ; 8F 82 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STX $7F			  ; 86 7F | Store X register to zero page
	ROR $868F,X		  ; 7E 8F 86 | Rotate right (absolute,X)
	ROR $00B9,X		  ; 7E B9 00 | Rotate right (absolute,X)
	STA				  ; 9F 02 43 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $0004,Y		  ; B9 04 00 | Read graphics status
	STA				  ; 9F 00 43 00 | Update graphics data
	LDA $0002,Y		  ; B9 02 00 | Read graphics status
	STA				  ; 9F 04 43 00 | Update graphics data
	LDA $0003,Y		  ; B9 03 00 | Read graphics status
	STA				  ; 9F 01 43 00 | Update graphics data
	LDA $0005,Y		  ; B9 05 00 | Read graphics status
	STA				  ; 9F 07 43 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_123
; Address: $C0A6FC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_123:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA				  ; 9F 07 43 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_124
; Address: $C0A714
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_124:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_125
; Address: $C0A719
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_125:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ROR $828F,X		  ; 7E 8F 82 | Rotate right (absolute,X)
	ROR $2F68,X		  ; 7E 68 2F | Rotate right (absolute,X)
	STX $7F			  ; 86 7F | Store X register to zero page
	ROR $868F,X		  ; 7E 8F 86 | Rotate right (absolute,X)
	ROR $2868,X		  ; 7E 68 28 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_126
; Address: $C0A735
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_126:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F D0 7D 7E | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_127
; Address: $C0A752
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_127:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7DE0		  ; 8F E0 7D 7E | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_128
; Address: $C0A75D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_128:
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D0 7D 7E | Read graphics status
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA				  ; BF D8 7D 7E | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_129
; Address: $C0A774
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_129:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $7E7DE0		  ; 8F E0 7D 7E | Update graphics data
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDA $7E7FE4		  ; AF E4 7F 7E | Read graphics status
	BEQ $C7			  ; F0 C7 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FDE		  ; 8F DE 7F 7E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $09			  ; 10 09 | Branch if positive
	LDA $7E7FF8		  ; AF F8 7F 7E | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	LDA $7E7FDE		  ; AF DE 7F 7E | Read graphics status
	BEQ $A8			  ; F0 A8 | Branch if equal
	BRA $E9			  ; 80 E9 | Branch always
	LDA $7E7FDE		  ; AF DE 7F 7E | Read graphics status
	BEQ $E3			  ; F0 E3 | Branch if equal
	BRA $F8			  ; 80 F8 | Branch always
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7DD0,X		  ; BD D0 7D | Read graphics status
	BNE $09			  ; D0 09 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_12A
; Address: $C0A7CB
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_12A:
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $FE			  ; 80 FE | Branch always
	STZ $7DE6			; 9C E6 7D | Store zero to absolute
	JMP $27FC			; 4C FC 27 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$06			 ; A2 06 | Load immediate value into X register
	LDA $7DD0,X		  ; BD D0 7D | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F7			  ; 10 F7 | Branch if positive
	BRA $FE			  ; 80 FE | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7DE6			; 8D E6 7D | Update graphics data
	JMP $27FC			; 4C FC 27 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7E7DE2		  ; 8F E2 7D 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $7E7DE3		  ; 8F E3 7D 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STZ $7DD0,X		  ; 9E D0 7D | Store zero to absolute,X
	LDA				  ; BF 70 28 C0 | Read graphics status
	LDA				  ; BF 78 28 C0 | Read graphics status
	STA $7DD8,X		  ; 9D D8 7D | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	STA $0001,X		  ; 9D 01 00 | Update graphics data
	STA $0003,X		  ; 9D 03 00 | Update graphics data
	STA $0004,X		  ; 9D 04 00 | Update graphics data
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_12B
; Address: $C0A84A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_12B:
	STA $000A,X		  ; 9D 0A 00 | Update graphics data
	LDA $7DE2			; AD E2 7D | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $000B,X		  ; 9D 0B 00 | Update graphics data
	LDA $7DE4			; AD E4 7D | Read graphics status
	STA $000D,X		  ; 9D 0D 00 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	STA $000E,X		  ; 9D 0E 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_12C
; Address: $C0A872
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_12C:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	RTI				  ; 40 | Return from interrupt
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F D0 7D 7E | Update graphics data
	JMP $C02774		  ; 5C 74 27 C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FE0		  ; 8F E0 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F D8 7D 7E | Update graphics data
	JMP $C02774		  ; 5C 74 27 C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_12D
; Address: $C0A8BA
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_12D:
	PHB				  ; 8B | Push data bank register to stack
	LDA $7E7F6E		  ; AF 6E 7F 7E | Read graphics status
	BNE $17			  ; D0 17 | Branch if not equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	ORA ($C9),Y		  ; 11 C9 | Logical OR with accumulator ((zero page),Y)
	PHY				  ; 5A | Push Y register to stack
	BCC $21			  ; 90 21 | PPU graphics register access
	CMP #$DA			 ; C9 DA | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BCC $31			  ; 90 31 | Branch if carry clear
	CMP #$DA			 ; C9 DA | Compare accumulator (immediate)
	BCC $3A			  ; 90 3A | Branch if carry clear
	BRA $FE			  ; 80 FE | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FE0		  ; 8F E0 7F 7E | Update graphics data
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F D8 7D 7E | Update graphics data
	JMP $C02774		  ; 5C 74 27 C0 | Jump to address long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F2E		  ; 8F 2E 7F 7E | Update graphics data
	LDA $7E7F2A		  ; AF 2A 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 28 7E 7E | Update graphics data
	JMP $C0297C		  ; 5C 7C 29 C0 | Jump to address long
	LDA $7E7F48		  ; AF 48 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 3E 7F 7E | Update graphics data
	JMP $C02AA3		  ; 5C A3 2A C0 | Jump to address long
	LDA $7E7F64		  ; AF 64 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 5A 7F 7E | Update graphics data
	JMP $C02C16		  ; 5C 16 2C C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F E8 7D 7E | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA				  ; 9F A8 7E 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA				  ; 9F E8 7E 7E | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	STA				  ; 9F 68 7E 7E | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_12F
; Address: $C0A946
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_12F:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F2C			; 8D 2C 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7F28			; 8D 28 7F | Update graphics data
	STA $7F2E			; 8D 2E 7F | Update graphics data
	LDX $7F28			; AE 28 7F | Load from absolute address into X register
	LDA $7E68,X		  ; BD 68 7E | Read graphics status
	STA $7F2A			; 8D 2A 7F | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7DE8,X		  ; BD E8 7D | Read graphics status
	BNE $13			  ; D0 13 | Branch if not equal
	LDA $7EA8,X		  ; BD A8 7E | Read graphics status
	ORA $7EE8,X		  ; 1D E8 7E | Logical OR with accumulator (absolute,X)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $7E28,X		  ; BD 28 7E | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_130
; Address: $C0A97C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_130:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7F28			; AD 28 7F | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $7F28			; 8D 28 7F | Update graphics data
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $CF			  ; 90 CF | Branch if carry clear
	LDA $7F2C			; AD 2C 7F | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_131
; Address: $C0A990
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_131:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F30			; 8D 30 7F | Update graphics data
	STY $7F32			; 8C 32 7F | Store Y register to absolute address
	LDA				  ; BF FA 29 C0 | Read graphics status
	STA $7E28,Y		  ; 99 28 7E | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_132
; Address: $C0A9B0
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_132:
	STA $7DE8,Y		  ; 99 E8 7D | Update graphics data
	STA $7EA8,Y		  ; 99 A8 7E | Update graphics data
	STA $0001,X		  ; 9D 01 00 | Update graphics data
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $0003,X		  ; 9D 03 00 | Update graphics data
	STA $0004,X		  ; 9D 04 00 | Update graphics data
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$E7			 ; 29 E7 | Logical AND with accumulator (immediate)
	STA $000A,X		  ; 9D 0A 00 | Update graphics data
	LDA $7F30			; AD 30 7F | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $000B,X		  ; 9D 0B 00 | Update graphics data
	LDA $7F32			; AD 32 7F | Read graphics status
	STA $000D,X		  ; 9D 0D 00 | Update graphics data
	LDA #$39			 ; A9 39 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	STA $000E,X		  ; 9D 0E 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_133
; Address: $C0A9FA
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_133:
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	EOR #$07			 ; 49 07 | Exclusive OR with accumulator (immediate)
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	EOR #$0A			 ; 49 0A | Exclusive OR with accumulator (immediate)
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	EOR #$0B			 ; 49 0B | Exclusive OR with accumulator (immediate)
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	EOR #$0C			 ; 49 0C | Exclusive OR with accumulator (immediate)
	CMP #$0C			 ; C9 0C | Compare accumulator (immediate)
	EOR #$0D			 ; 49 0D | Exclusive OR with accumulator (immediate)
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	EOR #$0E			 ; 49 0E | Exclusive OR with accumulator (immediate)
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_134
; Address: $C0AA20
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_134:
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	EOR #$11			 ; 49 11 | Exclusive OR with accumulator (immediate)
	CMP #$11			 ; C9 11 | Compare accumulator (immediate)
	EOR #$12			 ; 49 12 | Exclusive OR with accumulator (immediate)
	CMP #$12			 ; C9 12 | Compare accumulator (immediate)
	EOR #$13			 ; 49 13 | Exclusive OR with accumulator (immediate)
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	EOR #$14			 ; 49 14 | Exclusive OR with accumulator (immediate)
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	EOR #$15			 ; 49 15 | Exclusive OR with accumulator (immediate)
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	EOR #$16			 ; 49 16 | Exclusive OR with accumulator (immediate)
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F2A		  ; AF 2A 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7DE8,X		  ; 9D E8 7D | Update graphics data
	JMP $C0297C		  ; 5C 7C 29 C0 | Jump to address long
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	LDA $7E7F2A		  ; AF 2A 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 28 7E 7E | Update graphics data
	JMP $C0297C		  ; 5C 7C 29 C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F 34 7F 7E | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_135
; Address: $C0AA7C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_135:
	REP #$30			 ; C2 30 | Reset processor status bits
	STA $7E7F4A		  ; 8F 4A 7F 7E | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F48		  ; 8F 48 7F 7E | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F48		  ; AF 48 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 34 7F 7E | Read graphics status
	BNE $0C			  ; D0 0C | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_136
; Address: $C0AA97
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_136:
	LDA				  ; BF 3E 7F 7E | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_137
; Address: $C0AAA3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_137:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F48		  ; AF 48 7F 7E | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $7E7F48		  ; 8F 48 7F 7E | Update graphics data
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDA $7E7F4A		  ; AF 4A 7F 7E | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_138
; Address: $C0AABA
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_138:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7E7F4C		  ; 8F 4C 7F 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $7E7F4D		  ; 8F 4D 7F 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	JMP $2B10			; 4C 10 2B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F4C			; 8D 4C 7F | Update graphics data
	STY $7F4E			; 8C 4E 7F | Store Y register to absolute address
	JMP $2B10			; 4C 10 2B | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_139
; Address: $C0AB00
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_139:
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F4C			; 8D 4C 7F | Update graphics data
	STX $7F4E			; 8E 4E 7F | Store X register to absolute address
	JMP $2B10			; 4C 10 2B | Jump to address
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7F34,X		  ; BD 34 7F | Read graphics status
	BNE $09			  ; D0 09 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $FE			  ; 80 FE | Branch always
	STZ $7F34,X		  ; 9E 34 7F | Store zero to absolute,X
	LDA				  ; BF 76 2B C0 | Read graphics status
	LDA				  ; BF 80 2B C0 | Read graphics status
	STA $7F3E,X		  ; 9D 3E 7F | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	STA $0001,X		  ; 9D 01 00 | Update graphics data
	STA $0003,X		  ; 9D 03 00 | Update graphics data
	STA $0004,X		  ; 9D 04 00 | Update graphics data
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000A,X		  ; 9D 0A 00 | Update graphics data
	LDA $7F4C			; AD 4C 7F | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $000B,X		  ; 9D 0B 00 | Update graphics data
	LDA $7F4E			; AD 4E 7F | Read graphics status
	STA $000D,X		  ; 9D 0D 00 | Update graphics data
	LDA #$89			 ; A9 89 | Read graphics status
	STA $000E,X		  ; 9D 0E 00 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_13B
; Address: $C0AB77
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_13B:
	ORA $199A,Y		  ; 19 9A 19 | Logical OR with accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $199A,Y		  ; 19 9A 19 | Logical OR with accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $16C9,Y		  ; 19 C9 16 | Logical OR with accumulator (absolute,Y)
	EOR #$17			 ; 49 17 | Exclusive OR with accumulator (immediate)
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	EOR #$18			 ; 49 18 | Exclusive OR with accumulator (immediate)
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F48		  ; AF 48 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F 34 7F 7E | Update graphics data
	JMP $C02AA3		  ; 5C A3 2A C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA $7E7F48		  ; AF 48 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 3E 7F 7E | Update graphics data
	JMP $C02AA3		  ; 5C A3 2A C0 | Jump to address long
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 34 7F 7E | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_13C
; Address: $C0ABD5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_13C:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_13E
; Address: $C0ABDA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_13E:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F 50 7F 7E | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_13F
; Address: $C0ABEF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_13F:
	REP #$30			 ; C2 30 | Reset processor status bits
	STA $7E7F66		  ; 8F 66 7F 7E | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F64		  ; 8F 64 7F 7E | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F64		  ; AF 64 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 50 7F 7E | Read graphics status
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA				  ; BF 5A 7F 7E | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_140
; Address: $C0AC16
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_140:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F64		  ; AF 64 7F 7E | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $7E7F64		  ; 8F 64 7F 7E | Update graphics data
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDA $7E7F66		  ; AF 66 7F 7E | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_141
; Address: $C0AC2D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_141:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7E7F68		  ; 8F 68 7F 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $7E7F69		  ; 8F 69 7F 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_142
; Address: $C0AC51
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_142:
	INC				  ; 1A | Increment accumulator
	JMP $2C83			; 4C 83 2C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F68			; 8D 68 7F | Update graphics data
	STY $7F6A			; 8C 6A 7F | Store Y register to absolute address
	JMP $2C83			; 4C 83 2C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7F68			; 8D 68 7F | Update graphics data
	STX $7F6A			; 8E 6A 7F | Store X register to absolute address
	JMP $2C83			; 4C 83 2C | Jump to address
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $7F50,X		  ; BD 50 7F | Read graphics status
	BNE $09			  ; D0 09 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $FE			  ; 80 FE | Branch always
	STZ $7F50,X		  ; 9E 50 7F | Store zero to absolute,X
	LDA				  ; BF E4 2C C0 | Read graphics status
	STA $7F5A,X		  ; 9D 5A 7F | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	STA $0001,X		  ; 9D 01 00 | Update graphics data
	STA $0003,X		  ; 9D 03 00 | Update graphics data
	STA $0004,X		  ; 9D 04 00 | Update graphics data
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $000A,X		  ; 9D 0A 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_143
; Address: $C0ACC1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_143:
	LDA $7F68			; AD 68 7F | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $000B,X		  ; 9D 0B 00 | Update graphics data
	LDA $7F6A			; AD 6A 7F | Read graphics status
	STA $000D,X		  ; 9D 0D 00 | Update graphics data
	LDA #$ED			 ; A9 ED | Read graphics status
	BIT $0E9D			; 2C 9D 0E | Test bits in accumulator (absolute)
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$C0			 ; A9 C0 | Read graphics status
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_144
; Address: $C0ACE4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_144:
	CMP #$1A			 ; C9 1A | Compare accumulator (immediate)
	EOR #$1B			 ; 49 1B | Exclusive OR with accumulator (immediate)
	CMP #$1B			 ; C9 1B | Compare accumulator (immediate)
	EOR #$1C			 ; 49 1C | Exclusive OR with accumulator (immediate)
	CMP #$1C			 ; C9 1C | Compare accumulator (immediate)
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $7E7F64		  ; AF 64 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F 50 7F 7E | Update graphics data
	JMP $C02C16		  ; 5C 16 2C C0 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA $7E7F64		  ; AF 64 7F 7E | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STA				  ; 9F 5A 7F 7E | Update graphics data
	JMP $C02C16		  ; 5C 16 2C C0 | Jump to address long
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 50 7F 7E | Read graphics status
	BNE $01			  ; D0 01 | Branch if not equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_145
; Address: $C0AD2D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_145:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_146
; Address: $C0AD31
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_146:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_147
; Address: $C0AD35
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_147:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7E7DE0		  ; AF E0 7D 7E | Read graphics status
	STA $984C			; 8D 4C 98 | Update graphics data
	STA $984E			; 8D 4E 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_14B
; Address: $C0AD53
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_14B:
	JSL $C027B4		  ; 22 B4 27 C0 | Jump to subroutine long
	AND ($2E),Y		  ; 31 2E | Logical AND with accumulator ((zero page),Y)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$4D			 ; C0 4D | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_14D
; Address: $C0AD65
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_14D:
	JSL $C4656F		  ; 22 6F 65 C4 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	JMP $C7315E		  ; 5C 5E 31 C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_150
; Address: $C0AD79
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_150:
	JSL $C466EA		  ; 22 EA 66 C4 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_151
; Address: $C0AD86
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_151:
	JSL $C1D9B8		  ; 22 B8 D9 C1 | Jump to subroutine long
	BRA $07			  ; 80 07 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_153
; Address: $C0AD93
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_153:
	JSL $C42B9F		  ; 22 9F 2B C4 | Jump to subroutine long
	INC $7222,X		  ; FE 22 72 | Increment (absolute,X)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	LDA $02C8A3		  ; AF A3 C8 02 | Read graphics status
	BEQ $1F			  ; F0 1F | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7E3500		  ; AF 00 35 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $11			  ; 10 11 | Branch if positive

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_155
; Address: $C0ADBD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_155:
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	LDA #$01			 ; A9 01 | Read graphics status
	JMP $C7315E		  ; 5C 5E 31 C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_156
; Address: $C0ADC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_156:
	JSL $C42B9F		  ; 22 9F 2B C4 | Jump to subroutine long
	CMP #$55			 ; C9 55 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$56			 ; C9 56 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_157
; Address: $C0ADD7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_157:
	JSL $C791C5		  ; 22 C5 91 C7 | Jump to subroutine long
	LDA $7E3501		  ; AF 01 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_158
; Address: $C0ADE4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_158:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $0A			  ; 80 0A | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_159
; Address: $C0ADF0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_159:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	AND $7E35,X		  ; 3D 35 7E | Logical AND with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $C7315E		  ; 5C 5E 31 C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_15E
; Address: $C0AE0F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_15E:
	JSL $C02946		  ; 22 46 29 C0 | Jump to subroutine long
	LDA $7E7F2E		  ; AF 2E 7F 7E | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_16B
; Address: $C0AE4D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_16B:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	BRA $E2			  ; 80 E2 | Branch always
	STZ $DD47			; 9C 47 DD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_170
; Address: $C0AE69
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_170:
	JSL $C0C72A		  ; 22 2A C7 C0 | Jump to subroutine long
	STZ $99F9			; 9C F9 99 | Store zero to absolute
	STZ $9A03			; 9C 03 9A | Store zero to absolute
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $3500,X		  ; 9E 00 35 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $3600,X		  ; 9E 00 36 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_17C
; Address: $C0AEBB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_17C:
	JSL $C63907		  ; 22 07 39 C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F88		  ; 8F 88 7F 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_17D
; Address: $C0AEC7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_17D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	STA $7E891E		  ; 8F 1E 89 7E | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $7E8924		  ; 8F 24 89 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7E8922		  ; 8F 22 89 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $7E8920		  ; 8F 20 89 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_17E
; Address: $C0AEFA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_17E:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $891E			; AD 1E 89 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $8924			; 6D 24 89 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $891E			; AD 1E 89 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $8924			; 6D 24 89 | Add with carry (absolute)
	STA $891E			; 8D 1E 89 | Update graphics data
	PHX				  ; DA | Push X register to stack
	LDA $8922			; AD 22 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $8920			; AD 20 89 | Read graphics status
	AND #$70			 ; 29 70 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_17F
; Address: $C0AF2C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_17F:
	JSR $2F42			; 20 42 2F | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $8920			; EE 20 89 | Increment (absolute)
	CPX $891E			; EC 1E 89 | Compare X register (absolute)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	BEQ $D6			  ; F0 D6 | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_180
; Address: $C0AF42
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_180:
	LDA				  ; BF 45 EB F5 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_181
; Address: $C0AF51
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_181:
	LDA $8920			; AD 20 89 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 2C 60 F6 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_182
; Address: $C0AF61
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_182:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $8920			; AD 20 89 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 2C 60 F7 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_183
; Address: $C0AF7A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_183:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E88FE		  ; 8F FE 88 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_184
; Address: $C0AF88
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_184:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E88FE		  ; 8F FE 88 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_185
; Address: $C0AF96
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_185:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $8926,X		  ; 9E 26 89 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_186
; Address: $C0AFAD
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_186:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $883E,X		  ; 9E 3E 88 | Store zero to absolute,X
	STZ $87FE,X		  ; 9E FE 87 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $7FFE,X		  ; 9E FE 7F | Store zero to absolute,X
	STZ $83FE,X		  ; 9E FE 83 | Store zero to absolute,X
	STZ $81FE,X		  ; 9E FE 81 | Store zero to absolute,X
	STZ $85FE,X		  ; 9E FE 85 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_187
; Address: $C0AFD7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_187:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8926,X		  ; BD 26 89 | Read graphics status
	BEQ $45			  ; F0 45 | Branch if equal
	LDA $8966,X		  ; BD 66 89 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal
	STZ $8926,X		  ; 9E 26 89 | Store zero to absolute,X
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_18F
; Address: $C0B02A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_18F:
	JSR $34BE			; 20 BE 34 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $AF			  ; 90 AF | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_190
; Address: $C0B039
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_190:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_191
; Address: $C0B04D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_191:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_192
; Address: $C0B059
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_192:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_193
; Address: $C0B05F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_193:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_194
; Address: $C0B06A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_194:
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_195
; Address: $C0B074
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_195:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_196
; Address: $C0B080
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_196:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_197
; Address: $C0B086
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_197:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_198
; Address: $C0B09A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_198:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_199
; Address: $C0B0A6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_199:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19A
; Address: $C0B0AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19B
; Address: $C0B0B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19B:
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$03			 ; A9 03 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19C
; Address: $C0B0C0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19C:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19D
; Address: $C0B0CC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19D:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19E
; Address: $C0B0D2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_19F
; Address: $C0B0E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_19F:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A0
; Address: $C0B0F2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A0:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A1
; Address: $C0B0F8
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A1:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A2
; Address: $C0B0FC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A2:
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$09			 ; A9 09 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A3
; Address: $C0B10D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A3:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A4
; Address: $C0B119
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A4:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A5
; Address: $C0B11F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$0A			 ; A9 0A | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A6
; Address: $C0B133
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A6:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A7
; Address: $C0B13F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A7:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A8
; Address: $C0B145
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA #$0B			 ; A9 0B | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1A9
; Address: $C0B159
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1A9:
	JSR $323B			; 20 3B 32 | Jump to subroutine
	BCC $07			  ; 90 07 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AA
; Address: $C0B165
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AA:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AB
; Address: $C0B16B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8926,Y		  ; B9 26 89 | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	STA $8946,Y		  ; 99 46 89 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AC
; Address: $C0B187
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AD
; Address: $C0B18E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AD:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8926,Y		  ; B9 26 89 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3236			; 4C 36 32 | Jump to address
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,Y		  ; B9 86 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 45 EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $8988,Y		  ; B9 88 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 47 EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $898A,Y		  ; B9 8A 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 49 EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $898C,Y		  ; B9 8C 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 4B EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AE
; Address: $C0B1ED
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AE:
	PLY				  ; 7A | Pull Y register from stack
	LDA $898E,Y		  ; B9 8E 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 4D EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $8990,Y		  ; B9 90 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 4F EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $8992,Y		  ; B9 92 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 51 EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $8994,Y		  ; B9 94 89 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 53 EB F5 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1AF
; Address: $C0B23B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1AF:
	JSR $33E1			; 20 E1 33 | Jump to subroutine
	BCS $01			  ; B0 01 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B0
; Address: $C0B241
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B0:
	LDA $8A8A			; AD 8A 8A | Read graphics status
	STA $8966,Y		  ; 99 66 89 | Update graphics data
	STA $8908			; 8D 08 89 | Update graphics data
	LDA $8A86			; AD 86 8A | Read graphics status
	STA $8946,Y		  ; 99 46 89 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B1
; Address: $C0B254
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B1:
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $8A8E			; 9C 8E 8A | Store zero to absolute
	LDA				  ; BF 45 EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B3
; Address: $C0B267
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B3:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $8986,Y		  ; 99 86 89 | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 47 EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B5
; Address: $C0B27E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B5:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $8988,Y		  ; 99 88 89 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 49 EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B7
; Address: $C0B295
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B7:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $898A,Y		  ; 99 8A 89 | Update graphics data
	LDA #$06			 ; A9 06 | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 4B EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B8
; Address: $C0B2A6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B8:
	JSL $C03319		  ; 22 19 33 C0 | Jump to subroutine long
	BCS $01			  ; B0 01 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1B9
; Address: $C0B2AD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1B9:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $898C,Y		  ; 99 8C 89 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 4D EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1BB
; Address: $C0B2C4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1BB:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $898E,Y		  ; 99 8E 89 | Update graphics data
	LDA #$0A			 ; A9 0A | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 4F EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1BD
; Address: $C0B2DB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1BD:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $8990,Y		  ; 99 90 89 | Update graphics data
	LDA #$0C			 ; A9 0C | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C0
; Address: $C0B2F2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C0:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $8992,Y		  ; 99 92 89 | Update graphics data
	LDA #$0E			 ; A9 0E | Read graphics status
	STA $8A8E			; 8D 8E 8A | Update graphics data
	LDA				  ; BF 53 EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C2
; Address: $C0B309
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C2:
	JSL $C033B1		  ; 22 B1 33 C0 | Jump to subroutine long
	STA $8994,Y		  ; 99 94 89 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C4
; Address: $C0B319
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C4:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $8902			; 8D 02 89 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C5
; Address: $C0B32A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C5:
	LDA $8908			; AD 08 89 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	BEQ $4D			  ; F0 4D | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 91 33 C0 | Read graphics status
	STA $8904			; 8D 04 89 | Update graphics data
	LDA				  ; BF A1 33 C0 | Read graphics status
	STA $8906			; 8D 06 89 | Update graphics data
	LDA $8908			; AD 08 89 | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	LDY $8904			; AC 04 89 | Load from absolute address into Y register
	LDA $883E,Y		  ; B9 3E 88 | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $87FE,Y		  ; B9 FE 87 | Read graphics status
	CMP $8902			; CD 02 89 | Compare accumulator (absolute)
	BEQ $20			  ; F0 20 | Branch if equal
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C6
; Address: $C0B35B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C6:
	INY				  ; C8 | Increment Y register
	CPY $8906			; CC 06 89 | Compare Y register (absolute)
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDY $8904			; AC 04 89 | Load from absolute address into Y register
	LDA $883E,Y		  ; B9 3E 88 | Read graphics status
	BEQ $0C			  ; F0 0C | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $8906			; CC 06 89 | Compare Y register (absolute)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C7
; Address: $C0B375
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C7:
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $A8			  ; 80 A8 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1C8
; Address: $C0B37F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1C8:
	LDY $8A8E			; AC 8E 8A | Load from absolute address into Y register
	LDA $883E,Y		  ; B9 3E 88 | Read graphics status
	BEQ $EE			  ; F0 EE | Branch if equal
	LDA $87FE,Y		  ; B9 FE 87 | Read graphics status
	CMP $8902			; CD 02 89 | Compare accumulator (absolute)
	BEQ $EB			  ; F0 EB | Branch if equal
	BRA $DF			  ; 80 DF | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1CB
; Address: $C0B3A7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1CB:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $26			  ; F0 26 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $1C			  ; 10 1C | Branch if positive
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1CC
; Address: $C0B3C1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1CC:
	LDA $8902			; AD 02 89 | Read graphics status
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1CD
; Address: $C0B3D1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1CD:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	LDA $883E,Y		  ; B9 3E 88 | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $883E,Y		  ; 99 3E 88 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1CE
; Address: $C0B3E1
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1CE:
	LDA $8A8A			; AD 8A 8A | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $8926,Y		  ; B9 26 89 | Read graphics status
	BEQ $10			  ; F0 10 | Branch if equal
	LDA $8966,Y		  ; B9 66 89 | Read graphics status
	CMP $8A8A			; CD 8A 8A | Compare accumulator (absolute)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	CMP $8A86			; CD 86 8A | Compare accumulator (absolute)
	BEQ $18			  ; F0 18 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $E4			  ; 90 E4 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $8926,Y		  ; B9 26 89 | Read graphics status
	BEQ $09			  ; F0 09 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1CF
; Address: $C0B419
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1CF:
	LDA $8926,Y		  ; B9 26 89 | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8926,Y		  ; 99 26 89 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1D1
; Address: $C0B423
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1D1:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCS $46			  ; B0 46 | Branch if carry set
	LDA $8926,X		  ; BD 26 89 | Read graphics status
	BEQ $41			  ; F0 41 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $8926,X		  ; 9D 26 89 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1D9
; Address: $C0B476
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1D9:
	JSL $C034AC		  ; 22 AC 34 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DA
; Address: $C0B480
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $8926,Y		  ; B9 26 89 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DB
; Address: $C0B48F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DB:
	BEQ $11			  ; F0 11 | Branch if equal
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	STA $8A86			; 8D 86 8A | Update graphics data
	LDA $8966,Y		  ; B9 66 89 | Read graphics status
	STA $8A8A			; 8D 8A 8A | Update graphics data
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DC
; Address: $C0B49E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DC:
	JSR $3241			; 20 41 32 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DD
; Address: $C0B4AC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DD:
	PHY				  ; 5A | Push Y register to stack
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $883E,Y		  ; B9 3E 88 | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $883E,Y		  ; 99 3E 88 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DE
; Address: $C0B4BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DE:
	PHY				  ; 5A | Push Y register to stack
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Read graphics status
	STA $883E,Y		  ; 99 3E 88 | Update graphics data
	STA $87FE,Y		  ; 99 FE 87 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1DF
; Address: $C0B4D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1DF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 46 89 7E | Read graphics status
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E0
; Address: $C0B4DC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E0:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	BIT #$AA			 ; 89 AA | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E1
; Address: $C0B4E7
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E1:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E2
; Address: $C0B4EA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E2:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	BIT #$A8			 ; 89 A8 | Test bits in accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E3
; Address: $C0B4F8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E3:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3598			; 4C 98 35 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E5
; Address: $C0B51C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E5:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1E7
; Address: $C0B52D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1E7:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1EA
; Address: $C0B542
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1EA:
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1EC
; Address: $C0B54F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1EC:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1EE
; Address: $C0B560
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1EE:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F0
; Address: $C0B571
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F0:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F2
; Address: $C0B582
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F2:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F4
; Address: $C0B593
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F4:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F5
; Address: $C0B59E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F6
; Address: $C0B5A9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F6:
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $363E			; 4C 3E 36 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1F8
; Address: $C0B5C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1F8:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1FA
; Address: $C0B5D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1FA:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1FC
; Address: $C0B5E4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1FC:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_1FE
; Address: $C0B5F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_1FE:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_200
; Address: $C0B606
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_200:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_203
; Address: $C0B61C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_203:
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_205
; Address: $C0B628
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_205:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_207
; Address: $C0B639
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_207:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_208
; Address: $C0B644
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_208:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $36E7			; 4C E7 36 | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_20A
; Address: $C0B66B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_20A:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_20D
; Address: $C0B680
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_20D:
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_20F
; Address: $C0B68D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_20F:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_211
; Address: $C0B69E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_211:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_213
; Address: $C0B6AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_213:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_215
; Address: $C0B6C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_215:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_217
; Address: $C0B6D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_217:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_219
; Address: $C0B6E2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_219:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_21B
; Address: $C0B6EE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_21B:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3790			; 4C 90 37 | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_21D
; Address: $C0B714
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_21D:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_21F
; Address: $C0B725
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_21F:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_221
; Address: $C0B736
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_221:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_223
; Address: $C0B747
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_223:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_226
; Address: $C0B75C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_226:
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_228
; Address: $C0B769
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_228:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_22A
; Address: $C0B77A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_22A:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_22C
; Address: $C0B78B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_22C:
	JSL $C02096		  ; 22 96 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_22D
; Address: $C0B796
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_22D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3839			; 4C 39 38 | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_22F
; Address: $C0B7BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_22F:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_231
; Address: $C0B7CE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_231:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_233
; Address: $C0B7DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_233:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_235
; Address: $C0B7F0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_235:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_237
; Address: $C0B801
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_237:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_239
; Address: $C0B812
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_239:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_23B
; Address: $C0B823
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_23B:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_23E
; Address: $C0B838
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_23E:
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_23F
; Address: $C0B83F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_23F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $38E2			; 4C E2 38 | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_241
; Address: $C0B866
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_241:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_243
; Address: $C0B877
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_243:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_245
; Address: $C0B888
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_245:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_247
; Address: $C0B899
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_247:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_249
; Address: $C0B8AA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_249:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_24B
; Address: $C0B8BB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_24B:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_24D
; Address: $C0B8CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_24D:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_24F
; Address: $C0B8DD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_24F:
	JSL $C02140		  ; 22 40 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_250
; Address: $C0B8E8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_250:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3988			; 4C 88 39 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_251
; Address: $C0B8FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_251:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_253
; Address: $C0B90C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_253:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_255
; Address: $C0B91D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_255:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_257
; Address: $C0B92E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_257:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_259
; Address: $C0B93F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_259:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_25B
; Address: $C0B950
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_25B:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_25D
; Address: $C0B961
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_25D:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_260
; Address: $C0B976
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_260:
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_262
; Address: $C0B983
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_262:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_263
; Address: $C0B98E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_263:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3A2E			; 4C 2E 3A | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_265
; Address: $C0B9B2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_265:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_267
; Address: $C0B9C3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_267:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_26A
; Address: $C0B9D8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_26A:
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_26C
; Address: $C0B9E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_26C:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_26E
; Address: $C0B9F6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_26E:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_270
; Address: $C0BA07
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_270:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_272
; Address: $C0BA18
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_272:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_274
; Address: $C0BA29
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_274:
	JSL $C02025		  ; 22 25 20 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_275
; Address: $C0BA34
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_275:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_276
; Address: $C0BA3F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_276:
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3AD7			; 4C D7 3A | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_278
; Address: $C0BA5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_278:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_27A
; Address: $C0BA6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_27A:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_27C
; Address: $C0BA7D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_27C:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_27E
; Address: $C0BA8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_27E:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_280
; Address: $C0BA9F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_280:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_283
; Address: $C0BAB4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_283:
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_285
; Address: $C0BAC1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_285:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_287
; Address: $C0BAD2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_287:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_288
; Address: $C0BADD
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_288:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3B80			; 4C 80 3B | Jump to address
	STX $8A88			; 8E 88 8A | Store X register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_28A
; Address: $C0BB04
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_28A:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_28C
; Address: $C0BB15
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_28C:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_28E
; Address: $C0BB26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_28E:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_290
; Address: $C0BB37
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_290:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_292
; Address: $C0BB48
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_292:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_294
; Address: $C0BB59
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_294:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_296
; Address: $C0BB6A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_296:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_298
; Address: $C0BB7B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_298:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_299
; Address: $C0BB86
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_299:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3C26			; 4C 26 3C | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_29B
; Address: $C0BBAA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_29B:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_29D
; Address: $C0BBBB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_29D:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_29F
; Address: $C0BBCC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_29F:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2A1
; Address: $C0BBDD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2A1:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2A4
; Address: $C0BBF2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2A4:
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2A6
; Address: $C0BBFF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2A6:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2A8
; Address: $C0BC10
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2A8:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2AA
; Address: $C0BC21
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2AA:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2AB
; Address: $C0BC2C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2AB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3CCC			; 4C CC 3C | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2AE
; Address: $C0BC54
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2AE:
	PLX				  ; FA | Pull X register from stack
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2B0
; Address: $C0BC61
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2B0:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2B2
; Address: $C0BC72
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2B2:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2B4
; Address: $C0BC83
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2B4:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2B6
; Address: $C0BC94
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2B6:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2B8
; Address: $C0BCA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2B8:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2BA
; Address: $C0BCB6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2BA:
	JSL $C021E1		  ; 22 E1 21 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2BD
; Address: $C0BCCC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2BD:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2BE
; Address: $C0BCD2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2BE:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3DEB			; 4C EB 3D | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 45 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8986,Y		  ; B9 86 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C0
; Address: $C0BD06
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C0:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 47 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C1
; Address: $C0BD1C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C1:
	LDA $8988,Y		  ; B9 88 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C3
; Address: $C0BD26
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C3:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 49 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898A,Y		  ; B9 8A 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C5
; Address: $C0BD46
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C5:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4B EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898C,Y		  ; B9 8C 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C7
; Address: $C0BD66
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C7:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4D EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2C8
; Address: $C0BD7B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2C8:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898E,Y		  ; B9 8E 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2CA
; Address: $C0BD86
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2CA:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4F EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8990,Y		  ; B9 90 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2CC
; Address: $C0BDA6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2CC:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 51 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8992,Y		  ; B9 92 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2CE
; Address: $C0BDC6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2CE:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 53 EB F5 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2CF
; Address: $C0BDD8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2CF:
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8994,Y		  ; B9 94 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2D1
; Address: $C0BDE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2D1:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2D2
; Address: $C0BDF2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2D2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3F0B			; 4C 0B 3F | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 45 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8986,Y		  ; B9 86 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2D5
; Address: $C0BE2B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2D5:
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 47 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8988,Y		  ; B9 88 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2D7
; Address: $C0BE46
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2D7:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 49 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898A,Y		  ; B9 8A 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2D9
; Address: $C0BE66
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2D9:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4B EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898C,Y		  ; B9 8C 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2DC
; Address: $C0BE8A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2DC:
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4D EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $898E,Y		  ; B9 8E 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2DE
; Address: $C0BEA6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2DE:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4F EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8990,Y		  ; B9 90 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E0
; Address: $C0BEC6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E0:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 51 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8992,Y		  ; B9 92 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E2
; Address: $C0BEE6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E2:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	LDA $8946,Y		  ; B9 46 89 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 53 EB F5 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8994,Y		  ; B9 94 89 | Read graphics status
	BMI $09			  ; 30 09 | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E4
; Address: $C0BF06
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E4:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E5
; Address: $C0BF12
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $3FF2			; 4C F2 3F | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $8A90			; 9C 90 8A | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	LDA $8986,X		  ; BD 86 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E7
; Address: $C0BF3B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E7:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $8988,X		  ; BD 88 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2E9
; Address: $C0BF52
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2E9:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $898A,X		  ; BD 8A 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2EB
; Address: $C0BF69
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2EB:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $898C,X		  ; BD 8C 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2ED
; Address: $C0BF80
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2ED:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $898E,X		  ; BD 8E 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2EF
; Address: $C0BF97
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2EF:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $8990,X		  ; BD 90 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F1
; Address: $C0BFAE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F1:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $8992,X		  ; BD 92 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F3
; Address: $C0BFC5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F3:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	LDA $8994,X		  ; BD 94 89 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F5
; Address: $C0BFDC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F5:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	INC $8A90			; EE 90 8A | Increment (absolute)
	LDA $8A90			; AD 90 8A | Read graphics status
	BEQ $07			  ; F0 07 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F6
; Address: $C0BFF2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F6:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F7
; Address: $C0BFF9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F7:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F8
; Address: $C0C006
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F8:
	LDA				  ; BF BB 41 C0 | Read graphics status
	STA $890A			; 8D 0A 89 | Update graphics data
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $883E,X		  ; BD 3E 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $87FE,X		  ; BD FE 87 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2F9
; Address: $C0C022
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2F9:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8840,X		  ; BD 40 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8800,X		  ; BD 00 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$10			 ; A9 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FA
; Address: $C0C03C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FA:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8842,X		  ; BD 42 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8802,X		  ; BD 02 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$20			 ; A9 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FB
; Address: $C0C056
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FB:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8844,X		  ; BD 44 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8804,X		  ; BD 04 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$30			 ; A9 30 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FC
; Address: $C0C070
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FC:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8846,X		  ; BD 46 88 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FD
; Address: $C0C07E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FD:
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8806,X		  ; BD 06 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$40			 ; A9 40 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FE
; Address: $C0C08A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FE:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8848,X		  ; BD 48 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8808,X		  ; BD 08 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$50			 ; A9 50 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_2FF
; Address: $C0C0A4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_2FF:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $884A,X		  ; BD 4A 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $880A,X		  ; BD 0A 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$60			 ; A9 60 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_300
; Address: $C0C0BE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_300:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $884C,X		  ; BD 4C 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $880C,X		  ; BD 0C 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$70			 ; A9 70 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_301
; Address: $C0C0D8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_301:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $884E,X		  ; BD 4E 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $880E,X		  ; BD 0E 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$80			 ; A9 80 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_303
; Address: $C0C0F6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_303:
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8850,X		  ; BD 50 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8810,X		  ; BD 10 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$90			 ; A9 90 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_304
; Address: $C0C10C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_304:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8852,X		  ; BD 52 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8812,X		  ; BD 12 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$A0			 ; A9 A0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_305
; Address: $C0C126
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_305:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8854,X		  ; BD 54 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8814,X		  ; BD 14 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$B0			 ; A9 B0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_306
; Address: $C0C140
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_306:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8856,X		  ; BD 56 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $8816,X		  ; BD 16 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$C0			 ; A9 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_307
; Address: $C0C15A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_307:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8858,X		  ; BD 58 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_308
; Address: $C0C16A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_308:
	LDA $8818,X		  ; BD 18 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_309
; Address: $C0C174
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_309:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $885A,X		  ; BD 5A 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $881A,X		  ; BD 1A 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_30A
; Address: $C0C18E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_30A:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	LDA				  ; BF B3 41 C0 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $885C,X		  ; BD 5C 88 | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $881C,X		  ; BD 1C 88 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY $890A			; AC 0A 89 | Load from absolute address into Y register
	LDA #$F0			 ; A9 F0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_30B
; Address: $C0C1A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_30B:
	JSL $C041C3		  ; 22 C3 41 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_30D
; Address: $C0C1B9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_30D:
	JSR $FE00			; 20 00 FE | Jump to subroutine
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	INC $C085,X		  ; FE 85 C0 | Increment (absolute,X)
	INC $B083,X		  ; FE 83 B0 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $88FE			; 6D FE 88 | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_30F
; Address: $C0C1DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_30F:
	JSL $C041E0		  ; 22 E0 41 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_310
; Address: $C0C1E0
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_310:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCS $77			  ; B0 77 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 2C 60 F6 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	LDA				  ; BF 2E 60 F6 | Read graphics status
	STA $0002,Y		  ; 99 02 00 | Update graphics data
	LDA				  ; BF 30 60 F6 | Read graphics status
	STA $0004,Y		  ; 99 04 00 | Update graphics data
	LDA				  ; BF 32 60 F6 | Read graphics status
	STA $0006,Y		  ; 99 06 00 | Update graphics data
	LDA				  ; BF 34 60 F6 | Read graphics status
	STA $0008,Y		  ; 99 08 00 | Update graphics data
	LDA				  ; BF 36 60 F6 | Read graphics status
	STA $000A,Y		  ; 99 0A 00 | Update graphics data
	LDA				  ; BF 38 60 F6 | Read graphics status
	STA $000C,Y		  ; 99 0C 00 | Update graphics data
	LDA				  ; BF 3A 60 F6 | Read graphics status
	STA $000E,Y		  ; 99 0E 00 | Update graphics data
	LDA				  ; BF 3C 60 F6 | Read graphics status
	STA $0010,Y		  ; 99 10 00 | Update graphics data
	LDA				  ; BF 3E 60 F6 | Read graphics status
	STA $0012,Y		  ; 99 12 00 | Update graphics data
	LDA				  ; BF 40 60 F6 | Read graphics status
	STA $0014,Y		  ; 99 14 00 | Update graphics data
	LDA				  ; BF 42 60 F6 | Read graphics status
	STA $0016,Y		  ; 99 16 00 | Update graphics data
	LDA				  ; BF 44 60 F6 | Read graphics status
	STA $0018,Y		  ; 99 18 00 | Update graphics data
	LDA				  ; BF 46 60 F6 | Read graphics status
	STA $001A,Y		  ; 99 1A 00 | Update graphics data
	LDA				  ; BF 48 60 F6 | Read graphics status
	STA $001C,Y		  ; 99 1C 00 | Update graphics data
	LDA				  ; BF 4A 60 F6 | Read graphics status
	STA $001E,Y		  ; 99 1E 00 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_311
; Address: $C0C25C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_311:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_312
; Address: $C0C261
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_312:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 2C 60 F7 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	LDA				  ; BF 2E 60 F7 | Read graphics status
	STA $0002,Y		  ; 99 02 00 | Update graphics data
	LDA				  ; BF 30 60 F7 | Read graphics status
	STA $0004,Y		  ; 99 04 00 | Update graphics data
	LDA				  ; BF 32 60 F7 | Read graphics status
	STA $0006,Y		  ; 99 06 00 | Update graphics data
	LDA				  ; BF 34 60 F7 | Read graphics status
	STA $0008,Y		  ; 99 08 00 | Update graphics data
	LDA				  ; BF 36 60 F7 | Read graphics status
	STA $000A,Y		  ; 99 0A 00 | Update graphics data
	LDA				  ; BF 38 60 F7 | Read graphics status
	STA $000C,Y		  ; 99 0C 00 | Update graphics data
	LDA				  ; BF 3A 60 F7 | Read graphics status
	STA $000E,Y		  ; 99 0E 00 | Update graphics data
	LDA				  ; BF 3C 60 F7 | Read graphics status
	STA $0010,Y		  ; 99 10 00 | Update graphics data
	LDA				  ; BF 3E 60 F7 | Read graphics status
	STA $0012,Y		  ; 99 12 00 | Update graphics data
	LDA				  ; BF 40 60 F7 | Read graphics status
	STA $0014,Y		  ; 99 14 00 | Update graphics data
	LDA				  ; BF 42 60 F7 | Read graphics status
	STA $0016,Y		  ; 99 16 00 | Update graphics data
	LDA				  ; BF 44 60 F7 | Read graphics status
	STA $0018,Y		  ; 99 18 00 | Update graphics data
	LDA				  ; BF 46 60 F7 | Read graphics status
	STA $001A,Y		  ; 99 1A 00 | Update graphics data
	LDA				  ; BF 48 60 F7 | Read graphics status
	STA $001C,Y		  ; 99 1C 00 | Update graphics data
	LDA				  ; BF 4A 60 F7 | Read graphics status
	STA $001E,Y		  ; 99 1E 00 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_313
; Address: $C0C2D6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_313:
	STA $8A8C			; 8D 8C 8A | Update graphics data
	AND #$E0			 ; 29 E0 | Game work RAM access
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 10 43 C0 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $8A8C			; AD 8C 8A | Read graphics status
	AND #$1E			 ; 29 1E | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 18 43 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_315
; Address: $C0C2F3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_315:
	STA $8A8C			; 8D 8C 8A | Update graphics data
	AND #$E0			 ; 29 E0 | Game work RAM access
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 14 43 C0 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $8A8C			; AD 8C 8A | Read graphics status
	AND #$1E			 ; 29 1E | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 18 43 C0 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_316
; Address: $C0C310
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_316:
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	STA ($FE,X)		  ; 81 FE | Update graphics data
	INC $0185,X		  ; FE 85 01 | Increment (absolute,X)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	AND ($2F,X)		  ; 21 2F | Logical AND with accumulator ((zero page,X))
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	EOR ($4F,X)		  ; 41 4F | Exclusive OR with accumulator ((zero page,X))
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	ADC ($6F,X)		  ; 61 6F | Add with carry ((zero page,X))
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	STA ($8F,X)		  ; 81 8F | Update graphics data
	STA ($9F),Y		  ; 91 9F | Update graphics data
	LDA ($AF,X)		  ; A1 AF | Read graphics status
	LDA ($BF),Y		  ; B1 BF | Read graphics status
	CMP ($CF,X)		  ; C1 CF | Compare accumulator ((zero page,X))
	CMP ($DF),Y		  ; D1 DF | Compare accumulator ((zero page),Y)
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $8B42,X		  ; 9D 42 8B | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_317
; Address: $C0C352
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_317:
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $8B6E,X		  ; 9E 6E 8B | Store zero to absolute,X
	STA $8B8E,X		  ; 9D 8E 8B | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $885E,X		  ; 9E 5E 88 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_318
; Address: $C0C376
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_318:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8B42,X		  ; BD 42 8B | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_319
; Address: $C0C394
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_319:
	LDA $8AA2,X		  ; BD A2 8A | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	BRA $EB			  ; 80 EB | Branch always
	LDA $8AC2,X		  ; BD C2 8A | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	BEQ $15			  ; F0 15 | Branch if equal
	LDA $8AD2,X		  ; BD D2 8A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $8B12,X		  ; 7D 12 8B | Add with carry (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $8AD2,X		  ; 9D D2 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_31A
; Address: $C0C3B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_31A:
	LDA $8AB2,X		  ; BD B2 8A | Read graphics status
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	BRA $05			  ; 80 05 | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_31C
; Address: $C0C3C2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_31C:
	JSR $4570			; 20 70 45 | Jump to subroutine
	BRA $C3			  ; 80 C3 | Branch always
	LDA $8B32,X		  ; BD 32 8B | Read graphics status
	STA $30			  ; 85 30 | Update graphics data
	LDA $8B42,X		  ; BD 42 8B | Read graphics status
	STA $32			  ; 85 32 | Update graphics data
	LDA $8B52,X		  ; BD 52 8B | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	BCS $15			  ; B0 15 | Branch if carry set
	LDA $8B22,X		  ; BD 22 8B | Read graphics status
	BEQ $11			  ; F0 11 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $8B22,X		  ; 9D 22 8B | Update graphics data
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $8B42,X		  ; 9D 42 8B | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_31D
; Address: $C0C3EC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_31D:
	JSR $4533			; 20 33 45 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_31E
; Address: $C0C3F1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_31E:
	STZ $8A92,X		  ; 9E 92 8A | Store zero to absolute,X
	BRA $DB			  ; 80 DB | Branch always
	INC $4D43,X		  ; FE 43 4D | Increment (absolute,X)
	STA $E544,Y		  ; 99 44 E5 | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AF2,X		  ; 9D F2 8A | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_31F
; Address: $C0C41D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_31F:
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AD2,X		  ; 9D D2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8B12,X		  ; 9D 12 8B | Update graphics data
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_320
; Address: $C0C431
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_320:
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	STA $8AB2,X		  ; 9D B2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8A92,X		  ; 9D 92 8A | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_321
; Address: $C0C44E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_321:
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8B12,X		  ; 9D 12 8B | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AF2,X		  ; 9D F2 8A | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AD2,X		  ; 9D D2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	STA $8AB2,X		  ; 9D B2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8A92,X		  ; 9D 92 8A | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_323
; Address: $C0C49A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_323:
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_324
; Address: $C0C4B0
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_324:
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AF2,X		  ; 9D F2 8A | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AD2,X		  ; 9D D2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8B12,X		  ; 9D 12 8B | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	STA $8AB2,X		  ; 9D B2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8A92,X		  ; 9D 92 8A | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_326
; Address: $C0C4E6
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_326:
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	BMI $48			  ; 30 48 | Branch if negative
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $8B12,X		  ; 9D 12 8B | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $8A92,X		  ; 7D 92 8A | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AF2,X		  ; 9D F2 8A | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AD2,X		  ; 9D D2 8A | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $8AA2,X		  ; 9D A2 8A | Update graphics data
	STA $8AB2,X		  ; 9D B2 8A | Update graphics data
	LDA $8A92,X		  ; BD 92 8A | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8A92,X		  ; 9D 92 8A | Update graphics data
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_329
; Address: $C0C533
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_329:
	LDA $8AE2,X		  ; BD E2 8A | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $8B7E,X		  ; BD 7E 8B | Read graphics status
	STA $30			  ; 85 30 | Update graphics data
	LDA $8B8E,X		  ; BD 8E 8B | Read graphics status
	STA $32			  ; 85 32 | Update graphics data
	BMI $29			  ; 30 29 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	LDA $8B9E,X		  ; BD 9E 8B | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $883E,X		  ; BD 3E 88 | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $883E,X		  ; 9D 3E 88 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F2			  ; D0 F2 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	LDA $8B6E,X		  ; BD 6E 8B | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $8B6E,X		  ; 9D 6E 8B | Update graphics data
	BNE $09			  ; D0 09 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $8B8E,X		  ; 9D 8E 8B | Update graphics data
	STA $8B7E,X		  ; 9D 7E 8B | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32A
; Address: $C0C570
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32A:
	PHX				  ; DA | Push X register to stack
	LDA $8AF2,X		  ; BD F2 8A | Read graphics status
	CMP #$80			 ; C9 80 | Compare accumulator (immediate)
	BEQ $5B			  ; F0 5B | Branch if equal
	CMP #$81			 ; C9 81 | Compare accumulator (immediate)
	BEQ $5E			  ; F0 5E | Branch if equal
	LDA $8AD2,X		  ; BD D2 8A | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $18			  ; 85 18 | Update graphics data
	LDA $8AE2,X		  ; BD E2 8A | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8B9E,Y		  ; B9 9E 8B | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32B
; Address: $C0C593
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32B:
	LDA $8AF2,X		  ; BD F2 8A | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA $8B02,X		  ; BD 02 8B | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	LDA $8B12,X		  ; BD 12 8B | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDY $18			  ; A4 18 | Load from zero page into Y register
	LDA $1A			  ; A5 1A | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $20			  ; 85 20 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	BMI $0D			  ; 30 0D | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7FFE,Y		  ; B9 FE 7F | Read graphics status
	STA $7FFE,X		  ; 9D FE 7F | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $1C			  ; C6 1C | Decrement (zero page)
	BNE $D5			  ; D0 D5 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	DEC $8AA2,X		  ; DE A2 8A | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32C
; Address: $C0C5D4
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32C:
	LDA $7FD2			; AD D2 7F | Read graphics status
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	BRA $06			  ; 80 06 | Branch always
	LDA $7FD2			; AD D2 7F | Read graphics status
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $8AD2,X		  ; BD D2 8A | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $18			  ; 85 18 | Update graphics data
	LDA $8AE2,X		  ; BD E2 8A | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $8B9E,Y		  ; B9 9E 8B | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32D
; Address: $C0C5F4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32D:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $18			  ; 65 18 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7FFE,X		  ; BD FE 7F | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	PLX				  ; FA | Pull X register from stack
	DEC $8AA2,X		  ; DE A2 8A | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32E
; Address: $C0C604
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $7E8B62		  ; 8F 62 8B 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	STZ $8B			  ; 64 8B | Store zero to zero page
	ROR $B3C8,X		  ; 7E C8 B3 | Rotate right (absolute,X)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	ADC $8B			  ; 65 8B | Add with carry (zero page)
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	STA $7E8B68		  ; 8F 68 8B 7E | Update graphics data
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	BVC $46			  ; 50 46 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $7E8B62		  ; 8F 62 8B 7E | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $7E8B68		  ; 8F 68 8B 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_32F
; Address: $C0C64D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_32F:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $8B62			; AD 62 8B | Read graphics status
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_330
; Address: $C0C65B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_330:
	BCS $12			  ; B0 12 | Branch if carry set
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8B42,X		  ; BD 42 8B | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_331
; Address: $C0C676
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_331:
	LDA $8B64			; AD 64 8B | Read graphics status
	STA $8B32,X		  ; 9D 32 8B | Update graphics data
	STA $30			  ; 85 30 | Update graphics data
	LDA $8B66			; AD 66 8B | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $32			  ; 85 32 | Update graphics data
	LDA $8B68			; AD 68 8B | Read graphics status
	STA $8B22,X		  ; 9D 22 8B | Update graphics data
	STZ $8A92,X		  ; 9E 92 8A | Store zero to absolute,X
	STZ $8AA2,X		  ; 9E A2 8A | Store zero to absolute,X
	LDA #$01			 ; A9 01 | Read graphics status
	STA $8AC2,X		  ; 9D C2 8A | Update graphics data
	STZ $8B6A			; 9C 6A 8B | Store zero to absolute
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	BMI $29			  ; 30 29 | Branch if negative
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$02			 ; A9 02 | Read graphics status
	STA $8B6A			; 8D 6A 8B | Update graphics data
	INY				  ; C8 | Increment Y register
	BMI $29			  ; 30 29 | Branch if negative
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $8B6A			; AD 6A 8B | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $8B6A			; 8D 6A 8B | Update graphics data
	LDA $8B6A			; AD 6A 8B | Read graphics status
	STA $8B52,X		  ; 9D 52 8B | Update graphics data
	BMI $85			  ; 30 85 | Branch if negative
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	BMI $29			  ; 30 29 | Branch if negative
	STA $36			  ; 85 36 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $8B7E,Y		  ; B9 7E 8B | Read graphics status
	CMP $34			  ; C5 34 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_332
; Address: $C0C6D9
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_332:
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $8B8E,Y		  ; B9 8E 8B | Read graphics status
	CMP $36			  ; C5 36 | Compare accumulator (zero page)
	BEQ $1C			  ; F0 1C | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $8B8E,Y		  ; B9 8E 8B | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	JMP $466F			; 4C 6F 46 | Jump to address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $8AE2,X		  ; 9D E2 8A | Update graphics data
	LDA $8B9E,Y		  ; B9 9E 8B | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_333
; Address: $C0C705
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_333:
	JSR $4792			; 20 92 47 | Jump to subroutine
	BRA $1C			  ; 80 1C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $8AE2,X		  ; 9D E2 8A | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_334
; Address: $C0C70E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_334:
	JSR $4756			; 20 56 47 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $466F			; 4C 6F 46 | Jump to address
	STA $8B9E,Y		  ; 99 9E 8B | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $8B6E,Y		  ; 99 6E 8B | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_335
; Address: $C0C722
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_335:
	JSL $C03FF9		  ; 22 F9 3F C0 | Jump to subroutine long
	LDA $34			  ; A5 34 | Read graphics status
	STA $8B7E,Y		  ; 99 7E 8B | Update graphics data
	LDA $36			  ; A5 36 | Read graphics status
	STA $8B8E,Y		  ; 99 8E 8B | Update graphics data
	LDA $8B6E,Y		  ; B9 6E 8B | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $8B6E,Y		  ; 99 6E 8B | Update graphics data
	LDA $8B62			; AD 62 8B | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	BIT #$9D			 ; 89 9D | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	LDA $8B66			; AD 66 8B | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $8B42,X		  ; 9D 42 8B | Update graphics data
	STX $8B6C			; 8E 6C 8B | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_336
; Address: $C0C74F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_336:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_337
; Address: $C0C756
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_337:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $30			  ; 85 30 | Update graphics data
	STZ $32			  ; 64 32 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $885E,X		  ; BD 5E 88 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	LDA $32			  ; A5 32 | Read graphics status
	BNE $01			  ; D0 01 | Branch if not equal
	INC $32			  ; E6 32 | Increment (zero page)
	INC				  ; 1A | Increment accumulator
	CMP $30			  ; C5 30 | Compare accumulator (zero page)
	BCS $0F			  ; B0 0F | Branch if carry set
	BRA $02			  ; 80 02 | Branch always
	STZ $32			  ; 64 32 | Store zero to zero page
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E4			  ; 90 E4 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_338
; Address: $C0C784
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_338:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_339
; Address: $C0C78A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_339:
	JSR $4792			; 20 92 47 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_33A
; Address: $C0C792
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_33A:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $30			  ; 85 30 | Update graphics data
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $87FE,X		  ; 9D FE 87 | Update graphics data
	INC $883E,X		  ; FE 3E 88 | Increment (absolute,X)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_33B
; Address: $C0C7A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_33B:
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $30			  ; C6 30 | Decrement (zero page)
	BNE $F0			  ; D0 F0 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_33C
; Address: $C0C7B2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_33C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E8B66		  ; 8F 66 8B 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	STZ $8B			  ; 64 8B | Store zero to zero page
	ROR $B3C8,X		  ; 7E C8 B3 | Rotate right (absolute,X)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	ADC $8B			  ; 65 8B | Add with carry (zero page)
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_33D
; Address: $C0C7EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_33D:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	JMP $4808			; 4C 08 48 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_33F
; Address: $C0C7FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_33F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_340
; Address: $C0C805
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_340:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8B32,X		  ; BD 32 8B | Read graphics status
	CMP $8B64			; CD 64 8B | Compare accumulator (absolute)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA $8B42,X		  ; BD 42 8B | Read graphics status
	CMP $8B66			; CD 66 8B | Compare accumulator (absolute)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	BRA $06			  ; 80 06 | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	STA $8B22,X		  ; 9D 22 8B | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_341
; Address: $C0C835
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_341:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E8B66		  ; 8F 66 8B 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	STZ $8B			  ; 64 8B | Store zero to zero page
	ROR $B3C8,X		  ; 7E C8 B3 | Rotate right (absolute,X)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	ADC $8B			  ; 65 8B | Add with carry (zero page)
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_342
; Address: $C0C85E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_342:
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_343
; Address: $C0C86D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_343:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	JMP $488B			; 4C 8B 48 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_344
; Address: $C0C87A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_344:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	JMP $488B			; 4C 8B 48 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_345
; Address: $C0C888
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_345:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8B32,X		  ; BD 32 8B | Read graphics status
	CMP $8B64			; CD 64 8B | Compare accumulator (absolute)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA $8B42,X		  ; BD 42 8B | Read graphics status
	CMP $8B66			; CD 66 8B | Compare accumulator (absolute)
	BEQ $0E			  ; F0 0E | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_346
; Address: $C0C8B1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_346:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_347
; Address: $C0C8B8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_347:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BMI $A0			  ; 30 A0 | Branch if negative
	BMI $8F			  ; 30 8F | Branch if negative
	STZ $8B			  ; 64 8B | Store zero to zero page
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	BMI $29			  ; 30 29 | Branch if negative
	STA $7E8B66		  ; 8F 66 8B 7E | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_348
; Address: $C0C8D8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_348:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	AND $8B42,X		  ; 3D 42 8B | Logical AND with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_349
; Address: $C0C8F3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_349:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34A
; Address: $C0C8F7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34A:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7F8E			; AD 8E 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $7F8E			; AD 8E 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $7F8E			; 8D 8E 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34B
; Address: $C0C911
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34B:
	LDA $7F8E			; AD 8E 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34C
; Address: $C0C919
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34C:
	LDA $7F8E			; AD 8E 7F | Read graphics status
	ORA #$47			 ; 09 47 | Logical OR with accumulator (immediate)
	STA $7F8E			; 8D 8E 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34D
; Address: $C0C923
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $1C			  ; 85 1C | Update graphics data
	STX $20			  ; 86 20 | Store X register to zero page
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page
	LDA #$BE			 ; A9 BE | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STZ $22			  ; 64 22 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $F3C6,X		  ; 9E C6 F3 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LSR $19			  ; 46 19 | Logical shift right (zero page)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	LDA $19			  ; A5 19 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $07			  ; B0 07 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $18			  ; 85 18 | Update graphics data
	DEC $19			  ; C6 19 | Decrement (zero page)
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $54			  ; 90 54 | Branch if carry clear
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $19			  ; B0 19 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $24			  ; 85 24 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34E
; Address: $C0C97C
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34E:
	BRA $CD			  ; 80 CD | Branch always
	INY				  ; C8 | Increment Y register
	STA $25			  ; 85 25 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $24			  ; A5 24 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $20			  ; 86 20 | Store X register to zero page
	DEC $1C			  ; C6 1C | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	BRA $9E			  ; 80 9E | Branch always
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_34F
; Address: $C0C9B6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_34F:
	INY				  ; C8 | Increment Y register
	STA $1A			  ; 85 1A | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	BMI $6B			  ; 30 6B | Branch if negative
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $28			  ; B0 28 | Branch if carry set
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_350
; Address: $C0C9D9
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_350:
	STA $24			  ; 85 24 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	BRA $D0			  ; 80 D0 | Branch always
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status
	STA $25			  ; 85 25 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $25			  ; A5 25 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $24			  ; A5 24 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $20			  ; 86 20 | Store X register to zero page
	DEC $1C			  ; C6 1C | Decrement (zero page)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	BRA $92			  ; 80 92 | Branch always
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_351
; Address: $C0CA3B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_351:
	JMP $494B			; 4C 4B 49 | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_352
; Address: $C0CA44
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_352:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	STA $18			  ; 85 18 | Update graphics data
	LDA $00			  ; A5 00 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $F7			  ; D0 F7 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_353
; Address: $C0CA5B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_353:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $1C			  ; 85 1C | Update graphics data
	STX $20			  ; 86 20 | Store X register to zero page
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page
	LDA #$BE			 ; A9 BE | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STZ $22			  ; 64 22 | Store zero to zero page
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $28			  ; 85 28 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_354
; Address: $C0CA8E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_354:
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $A2			  ; 26 A2 | Rotate left (zero page)
	STZ $F3C6,X		  ; 9E C6 F3 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LSR $19			  ; 46 19 | Logical shift right (zero page)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	LDA $19			  ; A5 19 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $07			  ; B0 07 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $18			  ; 85 18 | Update graphics data
	DEC $19			  ; C6 19 | Decrement (zero page)
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4B4C			; 4C 4C 4B | Jump to address
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $19			  ; B0 19 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $24			  ; 85 24 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	BRA $CA			  ; 80 CA | Branch always
	INY				  ; C8 | Increment Y register
	STA $25			  ; 85 25 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_355
; Address: $C0CAF5
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_355:
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $26			  ; A5 26 | Read graphics status
	BMI $0A			  ; 30 0A | Branch if negative
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $24			  ; A5 24 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2E			  ; 65 2E | Add with carry (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	JMP $4AAA			; 4C AA 4A | Jump to address
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_356
; Address: $C0CB4E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_356:
	INY				  ; C8 | Increment Y register
	STA $1A			  ; 85 1A | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_357
; Address: $C0CB56
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_357:
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	BPL $03			  ; 10 03 | Branch if positive
	JMP $4C0B			; 4C 0B 4C | Jump to address
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $28			  ; B0 28 | Branch if carry set
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	BRA $CD			  ; 80 CD | Branch always
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status
	STA $25			  ; 85 25 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $25			  ; A5 25 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_358
; Address: $C0CBB7
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_358:
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $26			  ; A5 26 | Read graphics status
	BMI $0A			  ; 30 0A | Branch if negative
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $24			  ; A5 24 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2E			  ; 65 2E | Add with carry (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	JMP $4B64			; 4C 64 4B | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	JMP $4AAA			; 4C AA 4A | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35A
; Address: $C0CC16
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35A:
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $1C			  ; 85 1C | Update graphics data
	LDA $00			  ; A5 00 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	STX $20			  ; 86 20 | Store X register to zero page
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $28			  ; 85 28 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $A5			  ; 26 A5 | Rotate left (zero page)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $24			  ; A5 24 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2E			  ; 65 2E | Add with carry (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35B
; Address: $C0CC74
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35B:
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BNE $BC			  ; D0 BC | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35C
; Address: $C0CC94
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35C:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $1C			  ; 85 1C | Update graphics data
	LDA $00			  ; A5 00 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	STX $20			  ; 86 20 | Store X register to zero page
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $28			  ; 85 28 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $A5			  ; 26 A5 | Rotate left (zero page)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	LDX $20			  ; A6 20 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35D
; Address: $C0CCD0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35D:
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	AND #$C1			 ; 29 C1 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BNE $B1			  ; D0 B1 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35E
; Address: $C0CD1E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $1C			  ; 85 1C | Update graphics data
	STX $20			  ; 86 20 | Store X register to zero page
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page
	LDA #$BE			 ; A9 BE | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_35F
; Address: $C0CD31
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_35F:
	STZ $22			  ; 64 22 | Store zero to zero page
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $28			  ; 85 28 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $A2			  ; 26 A2 | Rotate left (zero page)
	STZ $F3C6,X		  ; 9E C6 F3 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEP #$20			 ; E2 20 | Set processor status bits
	LSR $19			  ; 46 19 | Logical shift right (zero page)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	LDA $19			  ; A5 19 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $07			  ; B0 07 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $18			  ; 85 18 | Update graphics data
	DEC $19			  ; C6 19 | Decrement (zero page)
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $4E1A			; 4C 1A 4E | Jump to address
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $19			  ; B0 19 | Branch if carry set
	INY				  ; C8 | Increment Y register
	STA $24			  ; 85 24 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_360
; Address: $C0CD98
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_360:
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	BRA $CA			  ; 80 CA | Branch always
	INY				  ; C8 | Increment Y register
	STA $25			  ; 85 25 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $26			  ; A5 26 | Read graphics status
	BMI $15			  ; 30 15 | Branch if negative
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	AND #$C1			 ; 29 C1 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_361
; Address: $C0CE00
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_361:
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	JMP $4D6D			; 4C 6D 4D | Jump to address
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_362
; Address: $C0CE1C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_362:
	INY				  ; C8 | Increment Y register
	STA $1A			  ; 85 1A | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	BPL $03			  ; 10 03 | Branch if positive
	JMP $4EE4			; 4C E4 4E | Jump to address
	LDA $22			  ; A5 22 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $28			  ; B0 28 | Branch if carry set
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_363
; Address: $C0CE5F
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_363:
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	BRA $CD			  ; 80 CD | Branch always
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA $F3C6,X		  ; BD C6 F3 | Read graphics status
	STA $25			  ; 85 25 | Update graphics data
	INC $1A			  ; E6 1A | Increment (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $1B			  ; A5 1B | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1B			  ; 85 1B | Update graphics data
	LDA $25			  ; A5 25 | Read graphics status
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $F3C6,X		  ; 9D C6 F3 | Update graphics data
	INC $1E			  ; E6 1E | Increment (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA $1F			  ; A5 1F | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $1F			  ; 85 1F | Update graphics data
	INC $22			  ; E6 22 | Increment (zero page)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $26			  ; A5 26 | Read graphics status
	BMI $15			  ; 30 15 | Branch if negative
	LDX $20			  ; A6 20 | Load from zero page into X register
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	AND #$C1			 ; 29 C1 | Logical AND with accumulator (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INC $20			  ; E6 20 | Increment (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	INC $26			  ; E6 26 | Increment (zero page)
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA $2C			  ; A5 2C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	INC $28			  ; E6 28 | Increment (zero page)
	LDA $0C			  ; A5 0C | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_364
; Address: $C0CEC7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_364:
	STA $26			  ; 85 26 | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	BMI $06			  ; 30 06 | Branch if negative
	LDA $28			  ; A5 28 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $85			  ; 80 85 | Branch always
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	JMP $4E32			; 4C 32 4E | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	JMP $4D6D			; 4C 6D 4D | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_365
; Address: $C0CEEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_365:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_366
; Address: $C0CEF8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_366:
	JSL $C055D7		  ; 22 D7 55 C0 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7E96A0		  ; 8F A0 96 7E | Update graphics data
	STZ $E326			; 9C 26 E3 | Store zero to absolute
	STZ $E330			; 9C 30 E3 | Store zero to absolute
	STZ $E33A			; 9C 3A E3 | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $E2D2			; 8D D2 E2 | Update graphics data
	STA $E2DA			; 8D DA E2 | Update graphics data
	STA $E2D4			; 8D D4 E2 | Update graphics data
	STA $E2D6			; 8D D6 E2 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E2D8			; 8D D8 E2 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_36C
; Address: $C0CF38
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_36C:
	JSL $C04F40		  ; 22 40 4F C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_36E
; Address: $C0CF40
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_36E:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 7A 4F C0 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 82 4F C0 | Read graphics status
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	BCS $FB			  ; B0 FB | Branch if carry set
	STA $18			  ; 85 18 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	SEP #$20			 ; E2 20 | Set processor status bits
	PLB				  ; AB | Pull data bank register from stack
	LDA $0000,Y		  ; B9 00 00 | Read graphics status
	STA				  ; 9F A2 FD 7F | Update graphics data
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	DEC $18			  ; C6 18 | Decrement (zero page)
	BNE $F3			  ; D0 F3 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_36F
; Address: $C0CF7A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_36F:
	TXA				  ; 8A | Transfer X register to accumulator
	STX $AF4F			; 8E 4F AF | Store X register to absolute address
	SBC #$4F			 ; E9 4F | Subtract with carry (immediate)
	STX $AF4F			; 8E 4F AF | Store X register to absolute address
	SBC #$4F			 ; E9 4F | Subtract with carry (immediate)
	BMI $50			  ; 30 50 | Branch if negative
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_370
; Address: $C0CF8E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_370:
	PHA				  ; 48 | Push accumulator to stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal
	AND $FC5A			; 2D 5A FC | Logical AND with accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_371
; Address: $C0CF9E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_371:
	PLA				  ; 68 | Pull accumulator from stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_372
; Address: $C0CFA3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_372:
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $FD22,Y		  ; B9 22 FD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($08),Y		  ; B1 08 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_373
; Address: $C0CFAF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_373:
	PHA				  ; 48 | Push accumulator to stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $FC5A			; CD 5A FC | Compare accumulator (absolute)
	BNE $05			  ; D0 05 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_374
; Address: $C0CFBF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_374:
	LDA $FC5A			; AD 5A FC | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $11			  ; D0 11 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $FD22,Y		  ; B9 22 FD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($08),Y		  ; B1 08 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_375
; Address: $C0CFD8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_375:
	PLA				  ; 68 | Pull accumulator from stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $FD62,Y		  ; B9 62 FD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($08),Y		  ; B1 08 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_376
; Address: $C0CFE9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_376:
	PHA				  ; 48 | Push accumulator to stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	CMP $FC5A			; CD 5A FC | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP $FC5C			; CD 5C FC | Compare accumulator (absolute)
	BNE $05			  ; D0 05 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_378
; Address: $C0D004
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_378:
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $FC5C			; AD 5C FC | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $11			  ; D0 11 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $FD22,Y		  ; B9 22 FD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($08),Y		  ; B1 08 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_379
; Address: $C0D01F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_379:
	PLA				  ; 68 | Pull accumulator from stack
	AND $FC5E			; 2D 5E FC | Logical AND with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $FD62,Y		  ; B9 62 FD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($08),Y		  ; B1 08 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37A
; Address: $C0D030
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37A:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STZ $E39E			; 9C 9E E3 | Store zero to absolute
	STZ $E3A0			; 9C A0 E3 | Store zero to absolute
	STZ $E3A2			; 9C A2 E3 | Store zero to absolute
	STZ $E3A4			; 9C A4 E3 | Store zero to absolute
	STZ $E3A6			; 9C A6 E3 | Store zero to absolute
	STZ $E3A8			; 9C A8 E3 | Store zero to absolute
	STZ $E3AA			; 9C AA E3 | Store zero to absolute
	STZ $E3AC			; 9C AC E3 | Store zero to absolute
	STZ $E3AE			; 9C AE E3 | Store zero to absolute
	STZ $E3B0			; 9C B0 E3 | Store zero to absolute
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37B
; Address: $C0D05A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37C
; Address: $C0D064
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37C:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E314			; AD 14 E3 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $32			  ; B0 32 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A8 50 C0 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $E2F6,Y		  ; B9 F6 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37D
; Address: $C0D07D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37D:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E39E,Y		  ; 99 9E E3 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $F2			  ; 10 F2 | Branch if positive
	LDA				  ; BF B8 50 C0 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $E300,Y		  ; B9 00 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37E
; Address: $C0D095
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37E:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A8,Y		  ; 99 A8 E3 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $F2			  ; 10 F2 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_37F
; Address: $C0D0AB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_37F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $E2DC			; AD DC E2 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_381
; Address: $C0D0E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_381:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E2F6,Y		  ; 99 F6 E2 | Update graphics data
	LDA $E2EA,Y		  ; B9 EA E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_382
; Address: $C0D0EA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_382:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E300,Y		  ; 99 00 E3 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $E8			  ; 10 E8 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_383
; Address: $C0D0FB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_383:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_388
; Address: $C0D118
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_388:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FA0		  ; AF A0 7F 7E | Read graphics status
	STA $7EEE5D		  ; 8F 5D EE 7E | Update graphics data
	LDA $7E7FA8		  ; AF A8 7F 7E | Read graphics status
	STA $7EEE5F		  ; 8F 5F EE 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_389
; Address: $C0D12F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_389:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_38F
; Address: $C0D150
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_38F:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FA0		  ; AF A0 7F 7E | Read graphics status
	STA $7EEE5D		  ; 8F 5D EE 7E | Update graphics data
	LDA $7E7FA8		  ; AF A8 7F 7E | Read graphics status
	STA $7EEE5F		  ; 8F 5F EE 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_391
; Address: $C0D167
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_391:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_394
; Address: $C0D17D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_394:
	JSL $C05281		  ; 22 81 52 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_395
; Address: $C0D184
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_395:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $3D			  ; 90 3D | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_396
; Address: $C0D194
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_396:
	JSL $C05201		  ; 22 01 52 C0 | Jump to subroutine long
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $3D			  ; 90 3D | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_397
; Address: $C0D1A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_397:
	JSL $C05201		  ; 22 01 52 C0 | Jump to subroutine long
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $51			  ; 90 51 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_39A
; Address: $C0D1B7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_39A:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FA0		  ; AF A0 7F 7E | Read graphics status
	STA $7EEE5D		  ; 8F 5D EE 7E | Update graphics data
	LDA $7E7FA8		  ; AF A8 7F 7E | Read graphics status
	STA $7EEE5F		  ; 8F 5F EE 7E | Update graphics data
	JMP $51FD			; 4C FD 51 | Jump to address
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $07			  ; 90 07 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_39C
; Address: $C0D1DE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_39C:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $1B			  ; 90 1B | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_39E
; Address: $C0D1E9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_39E:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FA0		  ; AF A0 7F 7E | Read graphics status
	STA $7EEE5D		  ; 8F 5D EE 7E | Update graphics data
	LDA $7E7FA8		  ; AF A8 7F 7E | Read graphics status
	STA $7EEE5F		  ; 8F 5F EE 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_39F
; Address: $C0D201
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_39F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A2 52 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A1
; Address: $C0D21B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A1:
	JSL $C0557B		  ; 22 7B 55 C0 | Jump to subroutine long
	LDA $7E99D9		  ; AF D9 99 7E | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A2
; Address: $C0D22B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A2:
	JSL $C055A4		  ; 22 A4 55 C0 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$08			 ; A9 08 | Read graphics status
	STA				  ; 9F F0 7F 7E | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A4
; Address: $C0D243
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A4:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $8722			; EC 22 87 | Compare X register (absolute)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	CMP $7E99,Y		  ; D9 99 7E | Compare accumulator (absolute,Y)
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A5
; Address: $C0D26A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A5:
	JSL $C055A4		  ; 22 A4 55 C0 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$18			 ; A9 18 | Read graphics status
	STA				  ; 9F F0 7F 7E | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A6
; Address: $C0D281
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A2 52 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A7
; Address: $C0D296
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A7:
	JSL $C0533E		  ; 22 3E 53 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A8
; Address: $C0D29D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A8:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3A9
; Address: $C0D2A2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3A9:
	DEC $E5			  ; C6 E5 | Decrement (zero page)
	DEC $EC			  ; C6 EC | Decrement (zero page)
	DEC $F3			  ; C6 F3 | Decrement (zero page)
	DEC $E5			  ; C6 E5 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3AB
; Address: $C0D2C0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3AB:
	JSL $C05281		  ; 22 81 52 C0 | Jump to subroutine long
	LDA $E31E			; AD 1E E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E31E			; 8D 1E E3 | Update graphics data
	LDA $E328			; AD 28 E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E328			; 8D 28 E3 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$08			 ; A9 08 | Read graphics status
	STA $7E7FF0		  ; 8F F0 7F 7E | Update graphics data
	STA $7E7FF1		  ; 8F F1 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3AC
; Address: $C0D2E2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3AC:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FF0		  ; AF F0 7F 7E | Read graphics status
	BNE $F6			  ; D0 F6 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3AD
; Address: $C0D2F4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3AD:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3AE
; Address: $C0D2FF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3AE:
	PLB				  ; AB | Pull data bank register from stack
	STZ $18			  ; 64 18 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3AF
; Address: $C0D305
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3AF:
	JSR $53D0			; 20 D0 53 | Jump to subroutine
	LDA #$80			 ; A9 80 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ASL $18E3,X		  ; 1E E3 18 | Arithmetic shift left (absolute,X)
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $7E7FB6		  ; 8F B6 7F 7E | Update graphics data
	LDA #$80			 ; A9 80 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ADC #$7F			 ; 69 7F | Add with carry (immediate)
	STA $7E7FB8		  ; 8F B8 7F 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$08			 ; A9 08 | Read graphics status
	STA $7E7FF0		  ; 8F F0 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B0
; Address: $C0D32C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B0:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA $7E7FF0		  ; AF F0 7F 7E | Read graphics status
	BNE $F6			  ; D0 F6 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B1
; Address: $C0D33E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B1:
	PHX				  ; DA | Push X register to stack
	STA $E3C8			; 8D C8 E3 | Update graphics data
	STX $18			  ; 86 18 | Store X register to zero page
	LDA $7E99D9		  ; AF D9 99 7E | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B2
; Address: $C0D34D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B2:
	JSR $53D0			; 20 D0 53 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B3
; Address: $C0D352
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B3:
	LDA $E36C,X		  ; BD 6C E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C4			; 8D C4 E3 | Update graphics data
	LDA $E376,X		  ; BD 76 E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C6			; 8D C6 E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B4
; Address: $C0D364
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B4:
	JSR $54AF			; 20 AF 54 | Jump to subroutine
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA #$20			 ; A9 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B5
; Address: $C0D36D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B5:
	JSL $C1697B		  ; 22 7B 69 C1 | Jump to subroutine long
	INC $E3C6			; EE C6 E3 | Increment (absolute)
	LDA $E3C8			; AD C8 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $E3C8			; 8D C8 E3 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $E9			  ; D0 E9 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B6
; Address: $C0D381
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B6:
	JSL $C0578B		  ; 22 8B 57 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B7
; Address: $C0D387
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B7:
	PHX				  ; DA | Push X register to stack
	STA $E3C8			; 8D C8 E3 | Update graphics data
	STX $18			  ; 86 18 | Store X register to zero page
	LDA $7E99D9		  ; AF D9 99 7E | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B8
; Address: $C0D396
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B8:
	JSR $53D0			; 20 D0 53 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3B9
; Address: $C0D39B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3B9:
	LDA $E36C,X		  ; BD 6C E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C4			; 8D C4 E3 | Update graphics data
	LDA $E376,X		  ; BD 76 E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C6			; 8D C6 E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BA
; Address: $C0D3AD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BA:
	JSR $550F			; 20 0F 55 | Jump to subroutine
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA #$20			 ; A9 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BB
; Address: $C0D3B6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BB:
	JSL $C1697B		  ; 22 7B 69 C1 | Jump to subroutine long
	INC $E3C6			; EE C6 E3 | Increment (absolute)
	LDA $E3C8			; AD C8 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $E3C8			; 8D C8 E3 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $E9			  ; D0 E9 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BC
; Address: $C0D3CA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BC:
	JSL $C0578B		  ; 22 8B 57 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BD
; Address: $C0D3D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BD:
	LDA $18			  ; A5 18 | Read graphics status
	BNE $3E			  ; D0 3E | Branch if not equal
	LDA $E36C			; AD 6C E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$80			 ; E9 80 | Subtract with carry (immediate)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BE
; Address: $C0D3DC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BE:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C4			; 8D C4 E3 | Update graphics data
	LDA $E376			; AD 76 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$80			 ; E9 80 | Subtract with carry (immediate)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C6			; 8D C6 E3 | Update graphics data
	LDA #$D2			 ; A9 D2 | Read graphics status
	ADC $C88D			; 6D 8D C8 | Add with carry (absolute)
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDA #$80			 ; A9 80 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3BF
; Address: $C0D3FA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3BF:
	JSL $C23CDF		  ; 22 DF 3C C2 | Jump to subroutine long
	INC $E3C6			; EE C6 E3 | Increment (absolute)
	LDA $E3C8			; AD C8 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $E3C8			; 8D C8 E3 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $E9			  ; D0 E9 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C1
; Address: $C0D413
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C1:
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$C6			 ; A9 C6 | Read graphics status
	CPX $C88D			; EC 8D C8 | Compare X register (absolute)
	LDA #$02			 ; A9 02 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C2
; Address: $C0D427
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C2:
	JSR $54AF			; 20 AF 54 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CPY $E3			  ; C4 E3 | Compare Y register (zero page)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEC $E3			  ; C6 E3 | Decrement (zero page)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDA #$0D			 ; A9 0D | Read graphics status
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C3
; Address: $C0D446
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C3:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $E3C8			; 6D C8 E3 | Add with carry (absolute)
	STA $E3C8			; 8D C8 E3 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA $18			  ; A5 18 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $E3C4			; AD C4 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $E3C6			; AD C6 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $E3C8			; AD C8 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA #$20			 ; A9 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C4
; Address: $C0D465
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C4:
	JSL $C1697B		  ; 22 7B 69 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $E3C8			; 8D C8 E3 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	STA $E3C6			; 8D C6 E3 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $E3C4			; 8D C4 E3 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $18			  ; 85 18 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $D2			  ; D0 D2 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C5
; Address: $C0D481
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C5:
	JSL $C0578B		  ; 22 8B 57 C0 | Jump to subroutine long
	LDA $E320			; AD 20 E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E320			; 8D 20 E3 | Update graphics data
	STA $7E7F9E		  ; 8F 9E 7F 7E | Update graphics data
	LDA $E32A			; AD 2A E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E32A			; 8D 2A E3 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FA6		  ; 8F A6 7F 7E | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$08			 ; A9 08 | Read graphics status
	STA $7E7FF1		  ; 8F F1 7F 7E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C7
; Address: $C0D4B2
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C7:
	LDA #$20			 ; A9 20 | Read graphics status
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	STZ $0040,X		  ; 9E 40 00 | Store zero to absolute,X
	STZ $0080,X		  ; 9E 80 00 | Store zero to absolute,X
	STZ $00C0,X		  ; 9E C0 00 | Store zero to absolute,X
	STZ $0100,X		  ; 9E 00 01 | Store zero to absolute,X
	STZ $0140,X		  ; 9E 40 01 | Store zero to absolute,X
	STZ $0180,X		  ; 9E 80 01 | Store zero to absolute,X
	STZ $01C0,X		  ; 9E C0 01 | Store zero to absolute,X
	STZ $0200,X		  ; 9E 00 02 | Store zero to absolute,X
	STZ $0240,X		  ; 9E 40 02 | Store zero to absolute,X
	STZ $0280,X		  ; 9E 80 02 | Store zero to absolute,X
	STZ $02C0,X		  ; 9E C0 02 | Store zero to absolute,X
	STZ $0300,X		  ; 9E 00 03 | Store zero to absolute,X
	STZ $0340,X		  ; 9E 40 03 | Store zero to absolute,X
	STZ $0380,X		  ; 9E 80 03 | Store zero to absolute,X
	STZ $03C0,X		  ; 9E C0 03 | Store zero to absolute,X
	STZ $0400,X		  ; 9E 00 04 | Store zero to absolute,X
	STZ $0440,X		  ; 9E 40 04 | Store zero to absolute,X
	STZ $0480,X		  ; 9E 80 04 | Store zero to absolute,X
	STZ $04C0,X		  ; 9E C0 04 | Store zero to absolute,X
	STZ $0500,X		  ; 9E 00 05 | Store zero to absolute,X
	STZ $0540,X		  ; 9E 40 05 | Store zero to absolute,X
	STZ $0580,X		  ; 9E 80 05 | Store zero to absolute,X
	STZ $05C0,X		  ; 9E C0 05 | Store zero to absolute,X
	STZ $0600,X		  ; 9E 00 06 | Store zero to absolute,X
	STZ $0640,X		  ; 9E 40 06 | Store zero to absolute,X
	STZ $0680,X		  ; 9E 80 06 | Store zero to absolute,X
	STZ $06C0,X		  ; 9E C0 06 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	BNE $A7			  ; D0 A7 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C8
; Address: $C0D50F
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C8:
	LDX $E3C8			; AE C8 E3 | Load from absolute address into X register
	LDA #$20			 ; A9 20 | Read graphics status
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	STZ $0040,X		  ; 9E 40 00 | Store zero to absolute,X
	STZ $0080,X		  ; 9E 80 00 | Store zero to absolute,X
	STZ $00C0,X		  ; 9E C0 00 | Store zero to absolute,X
	STZ $0100,X		  ; 9E 00 01 | Store zero to absolute,X
	STZ $0140,X		  ; 9E 40 01 | Store zero to absolute,X
	STZ $0180,X		  ; 9E 80 01 | Store zero to absolute,X
	STZ $01C0,X		  ; 9E C0 01 | Store zero to absolute,X
	STZ $0200,X		  ; 9E 00 02 | Store zero to absolute,X
	STZ $0240,X		  ; 9E 40 02 | Store zero to absolute,X
	STZ $0280,X		  ; 9E 80 02 | Store zero to absolute,X
	STZ $02C0,X		  ; 9E C0 02 | Store zero to absolute,X
	STZ $0300,X		  ; 9E 00 03 | Store zero to absolute,X
	STZ $0340,X		  ; 9E 40 03 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3C9
; Address: $C0D53F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3C9:
	STZ $0380,X		  ; 9E 80 03 | Store zero to absolute,X
	STZ $03C0,X		  ; 9E C0 03 | Store zero to absolute,X
	STZ $0400,X		  ; 9E 00 04 | Store zero to absolute,X
	STZ $0440,X		  ; 9E 40 04 | Store zero to absolute,X
	STZ $0480,X		  ; 9E 80 04 | Store zero to absolute,X
	STZ $04C0,X		  ; 9E C0 04 | Store zero to absolute,X
	STZ $0500,X		  ; 9E 00 05 | Store zero to absolute,X
	STZ $0540,X		  ; 9E 40 05 | Store zero to absolute,X
	STZ $0580,X		  ; 9E 80 05 | Store zero to absolute,X
	STZ $05C0,X		  ; 9E C0 05 | Store zero to absolute,X
	STZ $0600,X		  ; 9E 00 06 | Store zero to absolute,X
	STZ $0640,X		  ; 9E 40 06 | Store zero to absolute,X
	STZ $0680,X		  ; 9E 80 06 | Store zero to absolute,X
	STZ $06C0,X		  ; 9E C0 06 | Store zero to absolute,X
	STZ $0700,X		  ; 9E 00 07 | Store zero to absolute,X
	STZ $0740,X		  ; 9E 40 07 | Store zero to absolute,X
	STZ $0780,X		  ; 9E 80 07 | Store zero to absolute,X
	STZ $07C0,X		  ; 9E C0 07 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	BNE $9B			  ; D0 9B | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3CA
; Address: $C0D57B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3CA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E31E,X		  ; BD 1E E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E31E,X		  ; 9D 1E E3 | Update graphics data
	STA				  ; 9F 9C 7F 7E | Update graphics data
	LDA $E328,X		  ; BD 28 E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $E328,X		  ; 9D 28 E3 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA				  ; 9F A4 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3CB
; Address: $C0D5A4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3CB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3CC
; Address: $C0D5AE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3CC:
	LDA #$80			 ; A9 80 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ASL $8FE3,X		  ; 1E E3 8F | Arithmetic shift left (absolute,X)
	STZ $7E7F			; 9C 7F 7E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $7E7FB6		  ; 8F B6 7F 7E | Update graphics data
	LDA #$80			 ; A9 80 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FA4		  ; 8F A4 7F 7E | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $7E7FB8		  ; 8F B8 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D1
; Address: $C0D5E8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D1:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE31E		  ; 8F 1E E3 7F | Update graphics data
	STA $7FE328		  ; 8F 28 E3 7F | Update graphics data
	STA $7FE332		  ; 8F 32 E3 7F | Update graphics data
	STA $7E7F9C		  ; 8F 9C 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FA4		  ; 8F A4 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D2
; Address: $C0D604
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D2:
	JSL $C0578B		  ; 22 8B 57 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D3
; Address: $C0D60B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D3:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE320		  ; 8F 20 E3 7F | Update graphics data
	STA $7FE32A		  ; 8F 2A E3 7F | Update graphics data
	STA $7FE334		  ; 8F 34 E3 7F | Update graphics data
	STA $7E7F9E		  ; 8F 9E 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FA6		  ; 8F A6 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D5
; Address: $C0D62A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D5:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE322		  ; 8F 22 E3 7F | Update graphics data
	STA $7FE32C		  ; 8F 2C E3 7F | Update graphics data
	STA $7FE336		  ; 8F 36 E3 7F | Update graphics data
	STA $7E7FA0		  ; 8F A0 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FA8		  ; 8F A8 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D6
; Address: $C0D649
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D6:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE324		  ; 8F 24 E3 7F | Update graphics data
	STA $7FE32E		  ; 8F 2E E3 7F | Update graphics data
	STA $7FE338		  ; 8F 38 E3 7F | Update graphics data
	STA $7E7FA2		  ; 8F A2 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA $7E7FAA		  ; 8F AA 7F 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D7
; Address: $C0D668
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D7:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $7EB471		  ; AF 71 B4 7E | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status
	STA				  ; 9F 1E E3 7F | Update graphics data
	STA				  ; 9F 28 E3 7F | Update graphics data
	STA				  ; 9F 32 E3 7F | Update graphics data
	STA				  ; 9F 9C 7F 7E | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	STA				  ; 9F A4 7F 7E | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D8
; Address: $C0D68F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D8:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE33C		  ; 8F 3C E3 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3D9
; Address: $C0D69A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3D9:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DA
; Address: $C0D69D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DA:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE33E		  ; 8F 3E E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DB
; Address: $C0D6AB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DB:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE340		  ; 8F 40 E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DC
; Address: $C0D6B9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DC:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE342		  ; 8F 42 E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DD
; Address: $C0D6C7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DD:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE33C		  ; 8F 3C E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DE
; Address: $C0D6D5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DE:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE33E		  ; 8F 3E E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3DF
; Address: $C0D6E3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3DF:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE340		  ; 8F 40 E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E1
; Address: $C0D6F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E1:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE342		  ; 8F 42 E3 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E2
; Address: $C0D6FF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E2:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE2D2		  ; 8F D2 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E3
; Address: $C0D70D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E3:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE2D4		  ; 8F D4 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E4
; Address: $C0D71B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E4:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE2D6		  ; 8F D6 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E5
; Address: $C0D729
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E5:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE2D8		  ; 8F D8 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E6
; Address: $C0D737
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E6:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FE2DA		  ; 8F DA E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E8
; Address: $C0D746
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E8:
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE2D2		  ; 8F D2 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3E9
; Address: $C0D753
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3E9:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE2D4		  ; 8F D4 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3EA
; Address: $C0D761
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3EA:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE2D6		  ; 8F D6 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3EB
; Address: $C0D76F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3EB:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE2D8		  ; 8F D8 E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3EC
; Address: $C0D77D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3EC:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FE2DA		  ; 8F DA E2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3ED
; Address: $C0D78B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3ED:
	PHP				  ; 08 | Push processor status to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7EB491		  ; 8F 91 B4 7E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3EE
; Address: $C0D799
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3EE:
	PHX				  ; DA | Push X register to stack
	LDX #$01			 ; A2 01 | Load immediate value into X register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3EF
; Address: $C0D79E
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3EF:
	PLA				  ; 68 | Pull accumulator from stack
	BPL $07			  ; 10 07 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX #$09			 ; A2 09 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $1B			  ; B0 1B | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $17			  ; B0 17 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $13			  ; B0 13 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $0F			  ; B0 0F | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $0B			  ; B0 0B | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $07			  ; B0 07 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC56			; AD 56 FC | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 2F 58 C0 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F0
; Address: $C0D7E3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F0:
	PHX				  ; DA | Push X register to stack
	LDX #$01			 ; A2 01 | Load immediate value into X register
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F1
; Address: $C0D7EB
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F1:
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX #$09			 ; A2 09 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $1B			  ; B0 1B | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $17			  ; B0 17 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $13			  ; B0 13 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $0F			  ; B0 0F | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $0B			  ; B0 0B | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $07			  ; B0 07 | Branch if carry set
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC56			; AD 56 FC | Read graphics status
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 2F 58 C0 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F2
; Address: $C0D831
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F2:
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F4
; Address: $C0D853
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F4:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INC $FC80,X		  ; FE 80 FC | Increment (absolute,X)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BRA $03			  ; 80 03 | Branch always
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F5
; Address: $C0D883
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F5:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BCS $FF			  ; B0 FF | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F6
; Address: $C0D895
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F6:
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BRA $FD			  ; 80 FD | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BNE $FF			  ; D0 FF | Branch if not equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F7
; Address: $C0D8E5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F7:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3F9
; Address: $C0D908
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3F9:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FA
; Address: $C0D923
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FA:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FB
; Address: $C0D953
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FB:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FC
; Address: $C0D971
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FC:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FD
; Address: $C0D995
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FD:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BNE $FF			  ; D0 FF | Branch if not equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FE
; Address: $C0D9D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FE:
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BCS $FF			  ; B0 FF | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_3FF
; Address: $C0D9E5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_3FF:
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BRA $FD			  ; 80 FD | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_400
; Address: $C0D9F3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_400:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $FE			  ; 80 FE | Branch always
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BRA $03			  ; 80 03 | Branch always
	BCC $FF			  ; 90 FF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_401
; Address: $C0DA23
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_401:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INC $FC80,X		  ; FE 80 FC | Increment (absolute,X)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $E3E2,X		  ; 9E E2 E3 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_403
; Address: $C0DA71
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_403:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $0C			  ; 10 0C | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_404
; Address: $C0DA8F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_404:
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_405
; Address: $C0DA94
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_405:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $16			  ; 10 16 | Branch if positive
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E3E2,Y		  ; 99 E2 E3 | Update graphics data
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BMI $05			  ; 30 05 | Branch if negative
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_406
; Address: $C0DAB1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_406:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	LDX $E3F2,Y		  ; BE F2 E3 | Load from absolute,Y into X register
	PHY				  ; 5A | Push Y register to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_408
; Address: $C0DAC4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_408:
	PHY				  ; 5A | Push Y register to stack
	CMP $E55A,X		  ; DD 5A E5 | Compare accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	SBC $F75A			; ED 5A F7 | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	ORA ($5B,X)		  ; 01 5B | Logical OR with accumulator ((zero page,X))
	SBC $F75A			; ED 5A F7 | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	ORA ($5B,X)		  ; 01 5B | Logical OR with accumulator ((zero page,X))
	LDX $E492,Y		  ; BE 92 E4 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_40F
; Address: $C0DAF0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_40F:
	JSL $C06AE7		  ; 22 E7 6A C0 | Jump to subroutine long
	JMP $5AD5			; 4C D5 5A | Jump to address
	LDX $E482,Y		  ; BE 82 E4 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_410
; Address: $C0DAFA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_410:
	JSL $C06AE7		  ; 22 E7 6A C0 | Jump to subroutine long
	JMP $5ADD			; 4C DD 5A | Jump to address
	LDX $E482,Y		  ; BE 82 E4 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_411
; Address: $C0DB04
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_411:
	JSL $C06AE7		  ; 22 E7 6A C0 | Jump to subroutine long
	JMP $5AE5			; 4C E5 5A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 72 E4 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_412
; Address: $C0DB15
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_412:
	JSL $C05201		  ; 22 01 52 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_413
; Address: $C0DB1D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_413:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 72 E4 7F | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $FE			  ; D0 FE | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_414
; Address: $C0DB2C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_414:
	JSL $C05242		  ; 22 42 52 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_416
; Address: $C0DB34
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_416:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E472,X		  ; BD 72 E4 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E36C,X		  ; BD 6C E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $6C9D,X		  ; 7E 9D 6C | Rotate right (absolute,X)
	LDA $E31E,X		  ; BD 1E E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $BA2D,X		  ; 7E 2D BA | Rotate right (absolute,X)
	STA $E31E,X		  ; 9D 1E E3 | Update graphics data
	STA				  ; 9F 9C 7F 7E | Update graphics data
	LDA $E376,X		  ; BD 76 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	STY $7E96			; 8C 96 7E | Store Y register to absolute address
	STA $E376,X		  ; 9D 76 E3 | Update graphics data
	LDA $E328,X		  ; BD 28 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	STY $7E96			; 8C 96 7E | Store Y register to absolute address
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $E328,X		  ; 9D 28 E3 | Update graphics data
	STA				  ; 9F A4 7F 7E | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_417
; Address: $C0DB84
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_417:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E472,X		  ; BD 72 E4 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_418
; Address: $C0DB94
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_418:
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $E36C,X		  ; 9D 6C E3 | Update graphics data
	STA $E376,X		  ; 9D 76 E3 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E31E,X		  ; 9D 1E E3 | Update graphics data
	STA				  ; 9F 9C 7F 7E | Update graphics data
	STA $E328,X		  ; 9D 28 E3 | Update graphics data
	STA				  ; 9F A4 7F 7E | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_419
; Address: $C0DBB4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_419:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 02 E4 7F | Read graphics status
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STA				  ; 9F 02 E4 7F | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41A
; Address: $C0DBC9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	STA				  ; 9F 02 E4 7F | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41B
; Address: $C0DBE1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41C
; Address: $C0DBF0
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41C:
	STZ $AEAC,X		  ; 9E AC AE | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $AECC,X		  ; 9E CC AE | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	STZ $AED6			; 9C D6 AE | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	STA $AEE0			; 8D E0 AE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $8D			  ; 80 8D | Branch always
	CPY $22AE			; CC AE 22 | Compare Y register (absolute)
	ROR $C062,X		  ; 7E 62 C0 | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41D
; Address: $C0DC24
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $B0F2,X		  ; 9E F2 B0 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $B122,X		  ; 9E 22 B1 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	STZ $B130			; 9C 30 B1 | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41E
; Address: $C0DC4F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41E:
	ASL $4A			  ; 06 4A | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator
	STA $B13E			; 8D 3E B1 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $8D			  ; 80 8D | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_41F
; Address: $C0DC59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_41F:
	JSL $7E22B1		  ; 22 B1 22 7E | Jump to subroutine long
	CPY #$AB			 ; C0 AB | Compare Y register (immediate)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_420
; Address: $C0DC67
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_420:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $AEAC,X		  ; 9E AC AE | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $AECC,X		  ; 9E CC AE | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	STZ $AED6			; 9C D6 AE | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	STA $AEE0			; 8D E0 AE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $8D			  ; 80 8D | Branch always
	CPY $22AE			; CC AE 22 | Compare Y register (absolute)
	ROR $C062,X		  ; 7E 62 C0 | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_421
; Address: $C0DCAA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_421:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99D9			; AD D9 99 | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $1B			  ; F0 1B | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	LDX $99DB			; AE DB 99 | Load from absolute address into X register
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_422
; Address: $C0DCC7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_422:
	JSL $C02656		  ; 22 56 26 C0 | Jump to subroutine long
	LDX $99DF			; AE DF 99 | Load from absolute address into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_424
; Address: $C0DCD5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_424:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_425
; Address: $C0DCE1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_425:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $AEAA			; 8E AA AE | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_426
; Address: $C0DCF0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_426:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	STA $AEA4			; 8D A4 AE | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $AEC4,Y		  ; B9 C4 AE | Read graphics status
	CMP $AEAA			; CD AA AE | Compare accumulator (absolute)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5D76			; 4C 76 5D | Jump to address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_427
; Address: $C0DD1A
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_427:
	BCC $E9			  ; 90 E9 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $AED6,X		  ; FD D6 AE | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $AEA4			; CD A4 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $5D98			; 4C 98 5D | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $5D98			; 4C 98 5D | Jump to address
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AEB4,Y		  ; 99 B4 AE | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $AEA4			; 6D A4 AE | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $AEBC,Y		  ; 99 BC AE | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $AED6,X		  ; 9D D6 AE | Update graphics data
	CMP $AEE0,X		  ; DD E0 AE | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_428
; Address: $C0DD64
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_428:
	JSR $6140			; 20 40 61 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_429
; Address: $C0DD73
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_429:
	JSR $619A			; 20 9A 61 | Jump to subroutine
	LDA $AEAA			; AD AA AE | Read graphics status
	STA $AEC4,Y		  ; 99 C4 AE | Update graphics data
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	STY $AEA2			; 8C A2 AE | Store Y register to absolute address
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42A
; Address: $C0DD90
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42A:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42B
; Address: $C0DD98
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42B:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42C
; Address: $C0DDA1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $AEAA			; 8E AA AE | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42D
; Address: $C0DDB0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	LDX $10			  ; A6 10 | Load from zero page into X register
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	STA $AEA4			; 8D A4 AE | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B0F2,Y		  ; B9 F2 B0 | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $B116,Y		  ; B9 16 B1 | Read graphics status
	CMP $AEAA			; CD AA AE | Compare accumulator (absolute)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5E36			; 4C 36 5E | Jump to address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B122,X		  ; BD 22 B1 | Read graphics status
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $B13E,X		  ; BD 3E B1 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $B130,X		  ; FD 30 B1 | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $AEA4			; CD A4 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42E
; Address: $C0DDF2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42E:
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $5E58			; 4C 58 5E | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B0F2,Y		  ; B9 F2 B0 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $5E58			; 4C 58 5E | Jump to address
	LDA $B130,X		  ; BD 30 B1 | Read graphics status
	STA $B0FE,Y		  ; 99 FE B0 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $AEA4			; 6D A4 AE | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $B10A,Y		  ; 99 0A B1 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $B130,X		  ; 9D 30 B1 | Update graphics data
	CMP $B13E,X		  ; DD 3E B1 | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_42F
; Address: $C0DE24
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_42F:
	JSR $615E			; 20 5E 61 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B0F2,Y		  ; 99 F2 B0 | Update graphics data
	LDA $B0FE,Y		  ; B9 FE B0 | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_430
; Address: $C0DE33
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_430:
	JSR $61E6			; 20 E6 61 | Jump to subroutine
	LDA $AEAA			; AD AA AE | Read graphics status
	STA $B116,Y		  ; 99 16 B1 | Update graphics data
	LDA $B0F2,Y		  ; B9 F2 B0 | Read graphics status
	INC				  ; 1A | Increment accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	STA $B0F2,Y		  ; 99 F2 B0 | Update graphics data
	STY $AEA2			; 8C A2 AE | Store Y register to absolute address
	LDA $B0FE,Y		  ; B9 FE B0 | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_431
; Address: $C0DE58
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_431:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_432
; Address: $C0DE5D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_432:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_433
; Address: $C0DE61
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_433:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $AEAA			; 8E AA AE | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_434
; Address: $C0DE70
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_434:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $AEA4			; 8D A4 AE | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $AEC4,Y		  ; B9 C4 AE | Read graphics status
	CMP $AEAA			; CD AA AE | Compare accumulator (absolute)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5EF6			; 4C F6 5E | Jump to address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $E9			  ; 90 E9 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $AED6,X		  ; FD D6 AE | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $AEA4			; CD A4 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $5F18			; 4C 18 5F | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_435
; Address: $C0DECA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_435:
	JMP $5F18			; 4C 18 5F | Jump to address
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AEB4,Y		  ; 99 B4 AE | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $AEA4			; 6D A4 AE | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $AEBC,Y		  ; 99 BC AE | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $AED6,X		  ; 9D D6 AE | Update graphics data
	CMP $AEE0,X		  ; DD E0 AE | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_436
; Address: $C0DEE4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_436:
	JSR $617C			; 20 7C 61 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_437
; Address: $C0DEF3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_437:
	JSR $6232			; 20 32 62 | Jump to subroutine
	LDA $AEAA			; AD AA AE | Read graphics status
	STA $AEC4,Y		  ; 99 C4 AE | Update graphics data
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	STY $AEA2			; 8C A2 AE | Store Y register to absolute address
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_438
; Address: $C0DF18
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_438:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_439
; Address: $C0DF21
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_439:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_43A
; Address: $C0DF2B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_43A:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	BNE $61			  ; D0 61 | Branch if not equal
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	LDA $AEBC,Y		  ; B9 BC AE | Read graphics status
	STA $AEA8			; 8D A8 AE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	JMP $5F98			; 4C 98 5F | Jump to address
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $AEE0,Y		  ; B9 E0 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_43B
; Address: $C0DF71
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_43B:
	JSR $609E			; 20 9E 60 | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	LDA $AEA8			; AD A8 AE | Read graphics status
	STA $AEE0,Y		  ; 99 E0 AE | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	LDA $AEA8			; AD A8 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $AED6,Y		  ; D9 D6 AE | Compare accumulator (absolute,Y)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $AEE0,Y		  ; B9 E0 AE | Read graphics status
	STA $AEE0,X		  ; 9D E0 AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_43C
; Address: $C0DF95
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_43C:
	JSR $6140			; 20 40 61 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_43E
; Address: $C0DFA0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_43E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $B0F2,Y		  ; B9 F2 B0 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $B0F2,Y		  ; 99 F2 B0 | Update graphics data
	BNE $61			  ; D0 61 | Branch if not equal
	LDA $B0FE,Y		  ; B9 FE B0 | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	LDA $B10A,Y		  ; B9 0A B1 | Read graphics status
	STA $AEA8			; 8D A8 AE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B0F2,Y		  ; 99 F2 B0 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B122,X		  ; BD 22 B1 | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	LDA $B130,X		  ; BD 30 B1 | Read graphics status
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	JMP $6017			; 4C 17 60 | Jump to address
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $B13E,Y		  ; B9 3E B1 | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_43F
; Address: $C0DFF0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_43F:
	JSR $60D4			; 20 D4 60 | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	LDA $AEA8			; AD A8 AE | Read graphics status
	STA $B13E,Y		  ; 99 3E B1 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	LDA $AEA8			; AD A8 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $B130,Y		  ; D9 30 B1 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_440
; Address: $C0E00B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_440:
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $B13E,Y		  ; B9 3E B1 | Read graphics status
	STA $B13E,X		  ; 9D 3E B1 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_441
; Address: $C0E014
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_441:
	JSR $615E			; 20 5E 61 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_442
; Address: $C0E01F
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_442:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEAC,Y		  ; B9 AC AE | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	BNE $61			  ; D0 61 | Branch if not equal
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	STA $AEA6			; 8D A6 AE | Update graphics data
	LDA $AEBC,Y		  ; B9 BC AE | Read graphics status
	STA $AEA8			; 8D A8 AE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $AEAC,Y		  ; 99 AC AE | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	JMP $6096			; 4C 96 60 | Jump to address
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $AEE0,Y		  ; B9 E0 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $AEA6			; CD A6 AE | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_444
; Address: $C0E074
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_444:
	LDA $AEA8			; AD A8 AE | Read graphics status
	STA $AEE0,Y		  ; 99 E0 AE | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	LDA $AEA8			; AD A8 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $AED6,Y		  ; D9 D6 AE | Compare accumulator (absolute,Y)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $AEE0,Y		  ; B9 E0 AE | Read graphics status
	STA $AEE0,X		  ; 9D E0 AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_445
; Address: $C0E093
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_445:
	JSR $617C			; 20 7C 61 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_446
; Address: $C0E09E
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_446:
	PHX				  ; DA | Push X register to stack
	LDX #$06			 ; A2 06 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	STA $AECE,X		  ; 9D CE AE | Update graphics data
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AED8,X		  ; 9D D8 AE | Update graphics data
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	STA $AEE2,X		  ; 9D E2 AE | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $9D			  ; 80 9D | Branch always
	CPY $ADAE			; CC AE AD | Compare Y register (absolute)
	LDX $AE			  ; A6 AE | Load from zero page into X register
	STA $AED6,X		  ; 9D D6 AE | Update graphics data
	LDA $AEA8			; AD A8 AE | Read graphics status
	STA $AEE0,X		  ; 9D E0 AE | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_447
; Address: $C0E0D4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_447:
	PHX				  ; DA | Push X register to stack
	LDX #$0A			 ; A2 0A | Load immediate value into X register
	LDA $B122,X		  ; BD 22 B1 | Read graphics status
	STA $B124,X		  ; 9D 24 B1 | Update graphics data
	LDA $B130,X		  ; BD 30 B1 | Read graphics status
	STA $B132,X		  ; 9D 32 B1 | Update graphics data
	LDA $B13E,X		  ; BD 3E B1 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_448
; Address: $C0E0E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_448:
	STA $B140,X		  ; 9D 40 B1 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $9D			  ; 80 9D | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_449
; Address: $C0E0FA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_449:
	JSL $A6ADB1		  ; 22 B1 AD A6 | Jump to subroutine long
	LDX $309D			; AE 9D 30 | Load from absolute address into X register
	LDA ($AD),Y		  ; B1 AD | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $3E9D			; AE 9D 3E | Load from absolute address into X register
	LDA ($FA),Y		  ; B1 FA | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44A
; Address: $C0E10A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44A:
	PHX				  ; DA | Push X register to stack
	LDX #$06			 ; A2 06 | Load immediate value into X register
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	STA $AECE,X		  ; 9D CE AE | Update graphics data
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AED8,X		  ; 9D D8 AE | Update graphics data
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	STA $AEE2,X		  ; 9D E2 AE | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $9D			  ; 80 9D | Branch always
	CPY $ADAE			; CC AE AD | Compare Y register (absolute)
	LDX $AE			  ; A6 AE | Load from zero page into X register
	STA $AED6,X		  ; 9D D6 AE | Update graphics data
	LDA $AEA8			; AD A8 AE | Read graphics status
	STA $AEE0,X		  ; 9D E0 AE | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44B
; Address: $C0E140
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44B:
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	STA $AECA,X		  ; 9D CA AE | Update graphics data
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AED4,X		  ; 9D D4 AE | Update graphics data
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	STA $AEDE,X		  ; 9D DE AE | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44C
; Address: $C0E15A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44C:
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44D
; Address: $C0E15E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44D:
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $B122,X		  ; BD 22 B1 | Read graphics status
	STA $B120,X		  ; 9D 20 B1 | Update graphics data
	LDA $B130,X		  ; BD 30 B1 | Read graphics status
	STA $B12E,X		  ; 9D 2E B1 | Update graphics data
	LDA $B13E,X		  ; BD 3E B1 | Read graphics status
	STA $B13C,X		  ; 9D 3C B1 | Update graphics data
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44E
; Address: $C0E17C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44E:
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $AECC,X		  ; BD CC AE | Read graphics status
	STA $AECA,X		  ; 9D CA AE | Update graphics data
	LDA $AED6,X		  ; BD D6 AE | Read graphics status
	STA $AED4,X		  ; 9D D4 AE | Update graphics data
	LDA $AEE0,X		  ; BD E0 AE | Read graphics status
	STA $AEDE,X		  ; 9D DE AE | Update graphics data
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_44F
; Address: $C0E19A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_44F:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $AEA4			; AD A4 AE | Read graphics status
	BEQ $42			  ; F0 42 | Hardware register operation
	STZ $16			  ; 64 16 | Store zero to zero page
	LDX $AEAA			; AE AA AE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_450
; Address: $C0E1A6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_450:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E3			 ; 69 E3 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data
	LDA $AEA4			; AD A4 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_451
; Address: $C0E1CA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_451:
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $AEEA,X		  ; 9D EA AE | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $2E			  ; C6 2E | Decrement (zero page)
	BNE $F3			  ; D0 F3 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_452
; Address: $C0E1DF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_452:
	JSL $C062BE		  ; 22 BE 62 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_453
; Address: $C0E1E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_453:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $AEA4			; AD A4 AE | Read graphics status
	BEQ $42			  ; F0 42 | Hardware register operation
	STZ $16			  ; 64 16 | Store zero to zero page
	LDX $AEAA			; AE AA AE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_454
; Address: $C0E1F2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_454:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	LDX $10			  ; A6 10 | Load from zero page into X register
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E4			 ; 69 E4 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data
	LDA $AEA4			; AD A4 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $B0FE,Y		  ; B9 FE B0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $B14C,X		  ; 9D 4C B1 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $2E			  ; C6 2E | Decrement (zero page)
	BNE $F3			  ; D0 F3 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_455
; Address: $C0E22B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_455:
	JSL $C0633C		  ; 22 3C 63 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_457
; Address: $C0E233
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_457:
	PHY				  ; 5A | Push Y register to stack
	LDA $AEA4			; AD A4 AE | Read graphics status
	BEQ $42			  ; F0 42 | Hardware register operation
	STZ $16			  ; 64 16 | Store zero to zero page
	LDX $AEAA			; AE AA AE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_458
; Address: $C0E23E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_458:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$1A			 ; 69 1A | Add with carry (immediate)
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E5			 ; 69 E5 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data
	LDA $AEA4			; AD A4 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $AEB4,Y		  ; B9 B4 AE | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $AEEA,X		  ; 9D EA AE | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $2E			  ; C6 2E | Decrement (zero page)
	BNE $F3			  ; D0 F3 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_459
; Address: $C0E277
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_459:
	JSL $C06586		  ; 22 86 65 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45A
; Address: $C0E27E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$D0			 ; A9 D0 | Read graphics status
	STA $B74C			; 8D 4C B7 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status
	STA $B74E			; 8D 4E B7 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45B
; Address: $C0E29B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45B:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45C
; Address: $C0E29E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$20			 ; A9 20 | Read graphics status
	STA $B74C			; 8D 4C B7 | Update graphics data
	LDA #$32			 ; A9 32 | Read graphics status
	STA $B74E			; 8D 4E B7 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45D
; Address: $C0E2BE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7FAEA4		  ; AF A4 AE 7F | Read graphics status
	STA $967A			; 8D 7A 96 | Update graphics data
	LDA $7FAEA6		  ; AF A6 AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDA $2A			  ; A5 2A | Read graphics status
	LSR $7FB7			; 4E B7 7F | Logical shift right (absolute)
	BCS $08			  ; B0 08 | Branch if carry set
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45E
; Address: $C0E2E9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45E:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	LDA				  ; BF EA AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_45F
; Address: $C0E2F9
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_45F:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$A0			 ; 69 A0 | Add with carry (immediate)
	STX $AE99			; 8E 99 AE | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	LDA $2E			  ; A5 2E | Read graphics status
	ADC #$E3			 ; 69 E3 | Add with carry (immediate)
	STA $8DAE,Y		  ; 99 AE 8D | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $91AE,Y		  ; 99 AE 91 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $99DF			; 6D DF 99 | Add with carry (absolute)
	STA $8FAE,Y		  ; 99 AE 8F | Update graphics data
	INC $93AE			; EE AE 93 | Increment (absolute)
	INC $93AE			; EE AE 93 | Increment (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $2A			  ; E6 2A | Increment (zero page)
	DEC $967A			; CE 7A 96 | Decrement (absolute)
	BNE $A9			  ; D0 A9 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_460
; Address: $C0E330
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_460:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_461
; Address: $C0E33C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_461:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7FAEA4		  ; AF A4 AE 7F | Read graphics status
	STA $967A			; 8D 7A 96 | Update graphics data
	LDA $7FAEA6		  ; AF A6 AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_462
; Address: $C0E355
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_462:
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDA $2A			  ; A5 2A | Read graphics status
	JMP $7FB7			; 4C B7 7F | Jump to address
	BCS $08			  ; B0 08 | Branch if carry set
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_463
; Address: $C0E367
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_463:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	STZ $2E			  ; 64 2E | Store zero to zero page
	LDA				  ; BF 4C B1 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $8BAE,Y		  ; 99 AE 8B | Update graphics data
	LDA $2E			  ; A5 2E | Read graphics status
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	STA $8DAE,Y		  ; 99 AE 8D | Update graphics data
	LDA #$20			 ; A9 20 | Read graphics status
	STA $91AE,Y		  ; 99 AE 91 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $99DB			; 6D DB 99 | Add with carry (absolute)
	STA $8FAE,Y		  ; 99 AE 8F | Update graphics data
	INC $93AE			; EE AE 93 | Increment (absolute)
	INC $93AE			; EE AE 93 | Increment (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $2A			  ; E6 2A | Increment (zero page)
	DEC $967A			; CE 7A 96 | Decrement (absolute)
	BNE $A3			  ; D0 A3 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_464
; Address: $C0E3B4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_464:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_466
; Address: $C0E3C0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_466:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEA4			; AD A4 AE | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	JMP $6474			; 4C 74 64 | Jump to address
	LDX $AEAA			; AE AA AE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_467
; Address: $C0E3DC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_467:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	LDX $10			  ; A6 10 | Load from zero page into X register
	CMP $10			  ; C5 10 | Compare accumulator (zero page)
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	BPL $85			  ; 10 85 | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BPL $29			  ; 10 29 | Branch if positive
	STA $0E			  ; 85 0E | Update graphics data
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	BEQ $DB			  ; F0 DB | Branch if equal
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA $AEA6			; AD A6 AE | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $12			  ; 64 12 | Store zero to zero page
	LDA $B14C,X		  ; BD 4C B1 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STA $10			  ; 85 10 | Update graphics data
	LDA $12			  ; A5 12 | Read graphics status
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	STA $12			  ; 85 12 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_468
; Address: $C0E423
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_468:
	STA $16			  ; 85 16 | Update graphics data
	LDA $10			  ; A5 10 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $14			  ; 85 14 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_469
; Address: $C0E42D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_469:
	JSR $64A4			; 20 A4 64 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $1C			  ; C6 1C | Decrement (zero page)
	BNE $CC			  ; D0 CC | Branch if not equal
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $94B0			; AD B0 94 | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_46A
; Address: $C0E440
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_46A:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	LDA #$D2			 ; A9 D2 | Read graphics status
	ADC $7C20			; 6D 20 7C | Add with carry (absolute)
	STZ $A9			  ; 64 A9 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_46B
; Address: $C0E44D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_46B:
	JSR $647C			; 20 7C 64 | Jump to subroutine
	LDA #$D2			 ; A9 D2 | Read graphics status
	ADC $7C20,X		  ; 7D 20 7C | Add with carry (absolute,X)
	STZ $A9			  ; 64 A9 | Store zero to zero page
	STA $20			  ; 85 20 | Update graphics data
	STZ $A9			  ; 64 A9 | Store zero to zero page
	STA $7C20			; 8D 20 7C | Update graphics data
	STZ $A9			  ; 64 A9 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_46C
; Address: $C0E465
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_46C:
	JSR $647C			; 20 7C 64 | Jump to subroutine
	LDA #$D2			 ; A9 D2 | Read graphics status
	STA $7C20,X		  ; 9D 20 7C | Update graphics data
	STZ $A9			  ; 64 A9 | Store zero to zero page
	LDA $20			  ; A5 20 | Read graphics status
	STZ $AB			  ; 64 AB | Store zero to zero page
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_46D
; Address: $C0E47C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_46D:
	PHA				  ; 48 | Push accumulator to stack
	LDY $94B0			; AC B0 94 | Load from absolute address into Y register
	STA $93B0,Y		  ; 99 B0 93 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $93F0,Y		  ; 99 F0 93 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9470,Y		  ; 99 70 94 | Update graphics data
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC #$D2			 ; E9 D2 | Subtract with carry (immediate)
	ADC $3099			; 6D 99 30 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_46F
; Address: $C0E49E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_46F:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_470
; Address: $C0E4A4
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_470:
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC $AEA6			; ED A6 AE | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	STA $1A			  ; 85 1A | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $85			  ; 10 85 | Branch if positive
	STA $02			  ; 85 02 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_471
; Address: $C0E4F6
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_471:
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_472
; Address: $C0E54A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_472:
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	STA $6DD2,X		  ; 9D D2 6D | Update graphics data
	INX				  ; E8 | Increment X register
	REP #$20			 ; C2 20 | Reset processor status bits
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $64BC			; 4C BC 64 | Jump to address
	STX $18			  ; 86 18 | Store X register to zero page
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_473
; Address: $C0E586
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_473:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99D9			; AD D9 99 | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6615			; 4C 15 66 | Jump to address
	LDA $7FAEA4		  ; AF A4 AE 7F | Read graphics status
	STA $967A			; 8D 7A 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_474
; Address: $C0E5A4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_474:
	LDA $7FAEA6		  ; AF A6 AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDA $2A			  ; A5 2A | Read graphics status
	CMP #$32			 ; C9 32 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_475
; Address: $C0E5BB
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_475:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDY $93AE			; AC AE 93 | Load from absolute address into Y register
	LDA				  ; BF EA AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $8BAE,Y		  ; 99 AE 8B | Update graphics data
	LDA $2E			  ; A5 2E | Read graphics status
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	STA $8DAE,Y		  ; 99 AE 8D | Update graphics data
	LDA #$40			 ; A9 40 | Read graphics status
	STA $91AE,Y		  ; 99 AE 91 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $99DB			; 6D DB 99 | Add with carry (absolute)
	STA $8FAE,Y		  ; 99 AE 8F | Update graphics data
	INC $93AE			; EE AE 93 | Increment (absolute)
	INC $93AE			; EE AE 93 | Increment (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $2A			  ; E6 2A | Increment (zero page)
	DEC $967A			; CE 7A 96 | Decrement (absolute)
	BNE $A3			  ; D0 A3 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_477
; Address: $C0E60E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_477:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_478
; Address: $C0E615
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_478:
	LDA $7FAEA4		  ; AF A4 AE 7F | Read graphics status
	STA $967A			; 8D 7A 96 | Update graphics data
	LDA $7FAEA6		  ; AF A6 AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDA $2A			  ; A5 2A | Read graphics status
	CMP #$32			 ; C9 32 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	LDY $94B0			; AC B0 94 | Load from absolute address into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_479
; Address: $C0E633
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_479:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	STZ $2A			  ; 64 2A | Store zero to zero page
	LDY $94B0			; AC B0 94 | Load from absolute address into Y register
	LDA				  ; BF EA AE 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E			  ; 26 2E | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $93B0,Y		  ; 99 B0 93 | Update graphics data
	LDA $2E			  ; A5 2E | Read graphics status
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	STA $93F0,Y		  ; 99 F0 93 | Update graphics data
	LDA #$40			 ; A9 40 | Read graphics status
	STA $9470,Y		  ; 99 70 94 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $9430,Y		  ; 99 30 94 | Update graphics data
	INC $94B0			; EE B0 94 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_47A
; Address: $C0E673
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_47A:
	INC $94B0			; EE B0 94 | Increment (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $2A			  ; E6 2A | Increment (zero page)
	DEC $967A			; CE 7A 96 | Decrement (absolute)
	BNE $A5			  ; D0 A5 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_47B
; Address: $C0E67F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_47B:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_47C
; Address: $C0E68B
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_47C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $AEAA			; 8D AA AE | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B0F2,X		  ; BD F2 B0 | Read graphics status
	BEQ $1C			  ; F0 1C | Branch if equal
	LDA $B0FE,X		  ; BD FE B0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B10A,X		  ; BD 0A B1 | Read graphics status
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $AEA8			; 8D A8 AE | Update graphics data
	LDA $B14C,Y		  ; B9 4C B1 | Read graphics status
	CMP $AEAA			; CD AA AE | Compare accumulator (absolute)
	BEQ $17			  ; F0 17 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $AEA8			; CC A8 AE | Compare Y register (absolute)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_47E
; Address: $C0E6CD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_47E:
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_47F
; Address: $C0E6D4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_47F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $AEAA			; 8D AA AE | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AEAC,X		  ; BD AC AE | Read graphics status
	BEQ $1C			  ; F0 1C | Branch if equal
	LDA $AEB4,X		  ; BD B4 AE | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $AEBC,X		  ; BD BC AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $AEA8			; 8D A8 AE | Update graphics data
	LDA $AEEA,Y		  ; B9 EA AE | Read graphics status
	CMP $AEAA			; CD AA AE | Compare accumulator (absolute)
	BEQ $17			  ; F0 17 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $AEA8			; CC A8 AE | Compare Y register (absolute)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $D8			  ; 90 D8 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_480
; Address: $C0E716
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_480:
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_482
; Address: $C0E71D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_482:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $B760,X		  ; 9E 60 B7 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $B820,X		  ; 9E 20 B8 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	STZ $B842			; 9C 42 B8 | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	STA $B864			; 8D 64 B8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $8D			  ; 80 8D | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_483
; Address: $C0E752
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_483:
	JSR $ABB8			; 20 B8 AB | Jump to subroutine
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_484
; Address: $C0E75C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_484:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_487
; Address: $C0E779
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_487:
	JSL $C05CE1		  ; 22 E1 5C C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $67F4			; 4C F4 67 | Jump to address
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_488
; Address: $C0E78F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_488:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_489
; Address: $C0E7A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_489:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $46			  ; 90 46 | Branch if carry clear
	BVS $3B			  ; 70 3B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_48A
; Address: $C0E7A9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_48A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	ORA $1485,X		  ; 1D 85 14 | Logical OR with accumulator (absolute,X)
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E5			 ; 69 E5 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_48C
; Address: $C0E7D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_48C:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $14			  ; C5 14 | Compare accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_48D
; Address: $C0E7E1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_48D:
	JSR $6C0D			; 20 0D 6C | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_490
; Address: $C0E7F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_490:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_491
; Address: $C0E7FD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_491:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_492
; Address: $C0E80A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_492:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_493
; Address: $C0E81A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_493:
	JSL $C05DA1		  ; 22 A1 5D C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6895			; 4C 95 68 | Jump to address
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_494
; Address: $C0E830
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_494:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_495
; Address: $C0E842
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_495:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $46			  ; 90 46 | Branch if carry clear
	BVS $3B			  ; 70 3B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_496
; Address: $C0E84A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_496:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_497
; Address: $C0E865
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_497:
	ADC #$A0			 ; 69 A0 | Add with carry (immediate)
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E5			 ; 69 E5 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_499
; Address: $C0E874
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_499:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $14			  ; C5 14 | Compare accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_49A
; Address: $C0E882
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_49A:
	JSR $6C0D			; 20 0D 6C | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_49C
; Address: $C0E891
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_49C:
	JSL $C05FA0		  ; 22 A0 5F C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_49D
; Address: $C0E89E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_49D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_49E
; Address: $C0E8AB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_49E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_49F
; Address: $C0E8BB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_49F:
	JSL $C05E61		  ; 22 61 5E C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6936			; 4C 36 69 | Jump to address
	LDA $AEA2			; AD A2 AE | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A0
; Address: $C0E8C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A0:
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A1
; Address: $C0E8D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A2
; Address: $C0E8E3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A2:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $46			  ; 90 46 | Branch if carry clear
	BVS $3B			  ; 70 3B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A3
; Address: $C0E8EB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A5
; Address: $C0E915
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A5:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A6
; Address: $C0E923
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A6:
	JSR $6C0D			; 20 0D 6C | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A8
; Address: $C0E932
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A8:
	JSL $C0601F		  ; 22 1F 60 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4A9
; Address: $C0E93A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4A9:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4AA
; Address: $C0E93F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4AA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4AB
; Address: $C0E957
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4AB:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4AC
; Address: $C0E969
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4AC:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $4D			  ; 90 4D | Branch if carry clear
	LDY $B750			; AC 50 B7 | Load from absolute address into Y register
	LDA $B75E			; AD 5E B7 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4AD
; Address: $C0E978
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4AD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	ORA $1485,X		  ; 1D 85 14 | Logical OR with accumulator (absolute,X)
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E5			 ; 69 E5 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4AF
; Address: $C0E9A2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4AF:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $14			  ; C5 14 | Compare accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B1
; Address: $C0E9B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B1:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B2
; Address: $C0E9BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B2:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B3
; Address: $C0E9C5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B3:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B4
; Address: $C0E9DD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B5
; Address: $C0E9EF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B5:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $4D			  ; 90 4D | Branch if carry clear
	LDY $B750			; AC 50 B7 | Load from absolute address into Y register
	LDA $B75E			; AD 5E B7 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B6
; Address: $C0E9FE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B7
; Address: $C0EA19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B7:
	ADC #$A0			 ; 69 A0 | Add with carry (immediate)
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E5			 ; 69 E5 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4B9
; Address: $C0EA28
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4B9:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CMP $14			  ; C5 14 | Compare accumulator (zero page)
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4BA
; Address: $C0EA36
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4BA:
	JSR $6C0D			; 20 0D 6C | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4BB
; Address: $C0EA42
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4BB:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4BC
; Address: $C0EA4B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4BC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $B75C			; 8D 5C B7 | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $B75A			; 8D 5A B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4BD
; Address: $C0EA63
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4BD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $B752			; 8D 52 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4BE
; Address: $C0EA75
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4BE:
	JSL $C06C4A		  ; 22 4A 6C C0 | Jump to subroutine long
	BCC $4D			  ; 90 4D | Branch if carry clear
	LDY $B750			; AC 50 B7 | Load from absolute address into Y register
	LDA $B75E			; AD 5E B7 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C0
; Address: $C0EA84
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C0:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $16			  ; 64 16 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $16			  ; 26 16 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	STA $14			  ; 85 14 | Update graphics data
	LDA $16			  ; A5 16 | Read graphics status
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $16			  ; 85 16 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C2
; Address: $C0EAAE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C2:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$C5			 ; 42 C5 | Reserved instruction
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C3
; Address: $C0EABC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C3:
	JSR $6C0D			; 20 0D 6C | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C4
; Address: $C0EAC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C4:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C5
; Address: $C0EAD1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C5:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C6
; Address: $C0EADB
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C6:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data
	JMP $6AF3			; 4C F3 6A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $B760,Y		  ; 99 60 B7 | Update graphics data
	BNE $61			  ; D0 61 | Branch if not equal
	LDA $B780,Y		  ; B9 80 B7 | Read graphics status
	STA $B754			; 8D 54 B7 | Update graphics data
	LDA $B7A0,Y		  ; B9 A0 B7 | Read graphics status
	STA $B756			; 8D 56 B7 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B820,X		  ; BD 20 B8 | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	LDA $B842,X		  ; BD 42 B8 | Read graphics status
	CMP $B754			; CD 54 B7 | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	JMP $6B5E			; 4C 5E 6B | Jump to address
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $09			  ; 30 09 | Branch if negative
	LDA $B864,Y		  ; B9 64 B8 | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $B754			; CD 54 B7 | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C7
; Address: $C0EB37
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C7:
	JSR $6B73			; 20 73 6B | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	LDA $B756			; AD 56 B7 | Read graphics status
	STA $B864,Y		  ; 99 64 B8 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C8
; Address: $C0EB4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C8:
	LDA $B756			; AD 56 B7 | Read graphics status
	INC				  ; 1A | Increment accumulator
	CMP $B842,Y		  ; D9 42 B8 | Compare accumulator (absolute,Y)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $B864,Y		  ; B9 64 B8 | Read graphics status
	STA $B864,X		  ; 9D 64 B8 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4C9
; Address: $C0EB5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4C9:
	JSR $6BA9			; 20 A9 6B | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CA
; Address: $C0EB66
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 86 D8 7F | Read graphics status
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CB
; Address: $C0EB73
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CB:
	PHX				  ; DA | Push X register to stack
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	LDA $B820,X		  ; BD 20 B8 | Read graphics status
	STA $B822,X		  ; 9D 22 B8 | Update graphics data
	LDA $B842,X		  ; BD 42 B8 | Read graphics status
	STA $B844,X		  ; 9D 44 B8 | Update graphics data
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	STA $B866,X		  ; 9D 66 B8 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $E5			  ; 10 E5 | Branch if positive
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $9D			  ; 80 9D | Branch always

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CC
; Address: $C0EB99
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CC:
	JSR $ADB8			; 20 B8 AD | Jump to subroutine
	STA $B842,X		  ; 9D 42 B8 | Update graphics data
	LDA $B756			; AD 56 B7 | Read graphics status
	STA $B864,X		  ; 9D 64 B8 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CD
; Address: $C0EBA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CD:
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCS $14			  ; B0 14 | Branch if carry set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CE
; Address: $C0EBB1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CE:
	LDA $B820,X		  ; BD 20 B8 | Read graphics status
	STA $B81E,X		  ; 9D 1E B8 | Update graphics data
	LDA $B842,X		  ; BD 42 B8 | Read graphics status
	STA $B840,X		  ; 9D 40 B8 | Update graphics data
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	STA $B862,X		  ; 9D 62 B8 | Update graphics data
	BRA $E5			  ; 80 E5 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4CF
; Address: $C0EBC7
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4CF:
	PHX				  ; DA | Push X register to stack
	LDA $B752			; AD 52 B7 | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $2C			  ; 85 2C | Update graphics data
	LDX $B750			; AE 50 B7 | Load from absolute address into X register
	LDA $B780,X		  ; BD 80 B7 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	STA $C086,X		  ; 9D 86 C0 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	STA $B886,X		  ; 9D 86 B8 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	STA $D086,X		  ; 9D 86 D0 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	STA $C886,X		  ; 9D 86 C8 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $D2			  ; D0 D2 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D0
; Address: $C0EC0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D0:
	LDA $B752			; AD 52 B7 | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDX $B750			; AE 50 B7 | Load from absolute address into X register
	LDA $B780,X		  ; BD 80 B7 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D1
; Address: $C0EC19
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D1:
	TAX				  ; AA | Transfer accumulator to X register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $16			  ; 85 16 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $14			  ; 85 14 | Update graphics data
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D886,X		  ; 9D 86 D8 | Update graphics data
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $F1			  ; D0 F1 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D2
; Address: $C0EC40
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D2:
	STZ $D886,X		  ; 9E 86 D8 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $2A			  ; C6 2A | Decrement (zero page)
	BNE $F7			  ; D0 F7 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D3
; Address: $C0EC4A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D3:
	PHX				  ; DA | Push X register to stack
	STX $B758			; 8E 58 B7 | Store X register to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B7C0,Y		  ; B9 C0 B7 | Read graphics status
	CMP $B758			; CD 58 B7 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $B7E0,Y		  ; B9 E0 B7 | Read graphics status
	CMP $B75A			; CD 5A B7 | Compare accumulator (absolute)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6CC8			; 4C C8 6C | Jump to address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B820,X		  ; BD 20 B8 | Read graphics status
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $B842,X		  ; FD 42 B8 | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $B752			; CD 52 B7 | Compare accumulator (absolute)
	BCS $0A			  ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D4
; Address: $C0EC85
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D4:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	JMP $6CCF			; 4C CF 6C | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $6CCF			; 4C CF 6C | Jump to address
	LDA $B842,X		  ; BD 42 B8 | Read graphics status
	STA $B780,Y		  ; 99 80 B7 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $B752			; 6D 52 B7 | Add with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	STA $B7A0,Y		  ; 99 A0 B7 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $B842,X		  ; 9D 42 B8 | Update graphics data
	CMP $B864,X		  ; DD 64 B8 | Compare accumulator (absolute,X)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D5
; Address: $C0ECB8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D5:
	JSR $6BA9			; 20 A9 6B | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D6
; Address: $C0ECC1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D6:
	JSR $6D59			; 20 59 6D | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D7
; Address: $C0ECC8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D7:
	JSR $6D59			; 20 59 6D | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SEP #$41			 ; E2 41 | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D8
; Address: $C0ECCF
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D8:
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4D9
; Address: $C0ECD2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4D9:
	PHX				  ; DA | Push X register to stack
	STX $B758			; 8E 58 B7 | Store X register to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B7C0,Y		  ; B9 C0 B7 | Read graphics status
	CMP $B758			; CD 58 B7 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $B7E0,Y		  ; B9 E0 B7 | Read graphics status
	CMP $B75A			; CD 5A B7 | Compare accumulator (absolute)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6D4F			; 4C 4F 6D | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DA
; Address: $C0ECF1
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DA:
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA $B820,X		  ; BD 20 B8 | Read graphics status
	BPL $0D			  ; 10 0D | Branch if positive
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $B842,X		  ; FD 42 B8 | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	CMP $B752			; CD 52 B7 | Compare accumulator (absolute)
	BCS $07			  ; B0 07 | Branch if carry set
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $EA			  ; 10 EA | Branch if positive
	JMP $6D56			; 4C 56 6D | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	JMP $6D56			; 4C 56 6D | Jump to address
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	STA $B7A0,Y		  ; 99 A0 B7 | Update graphics data
	SEC				  ; 38 | Set carry flag
	SBC $B752			; ED 52 B7 | Subtract with carry (absolute)
	STA $B864,X		  ; 9D 64 B8 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $B780,Y		  ; 99 80 B7 | Update graphics data
	LDA $B864,X		  ; BD 64 B8 | Read graphics status
	CMP $B842,X		  ; DD 42 B8 | Compare accumulator (absolute,X)
	BCS $03			  ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DB
; Address: $C0ED3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DB:
	JSR $6BA9			; 20 A9 6B | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $B760,Y		  ; 99 60 B7 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DC
; Address: $C0ED48
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DC:
	JSR $6D59			; 20 59 6D | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DD
; Address: $C0ED4F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DD:
	JSR $6D59			; 20 59 6D | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SEP #$41			 ; E2 41 | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DE
; Address: $C0ED56
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DE:
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4DF
; Address: $C0ED59
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4DF:
	LDA $B758			; AD 58 B7 | Read graphics status
	STA $B7C0,Y		  ; 99 C0 B7 | Update graphics data
	LDA $B760,Y		  ; B9 60 B7 | Read graphics status
	INC				  ; 1A | Increment accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	STA $B760,Y		  ; 99 60 B7 | Update graphics data
	STY $B750			; 8C 50 B7 | Store Y register to absolute address
	LDA $B75A			; AD 5A B7 | Read graphics status
	STA $B7E0,Y		  ; 99 E0 B7 | Update graphics data
	LDA $B75C			; AD 5C B7 | Read graphics status
	STA $B800,Y		  ; 99 00 B8 | Update graphics data
	LDA $B780,Y		  ; B9 80 B7 | Read graphics status
	STA $B754			; 8D 54 B7 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E0
; Address: $C0ED7F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E0:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E1
; Address: $C0ED8C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	STA $E086			; 8D 86 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E2
; Address: $C0ED9E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E2:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E088			; 8D 88 E0 | Game work RAM access
	ORA $E086			; 0D 86 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6E41			; 4C 41 6E | Jump to address
	PHX				  ; DA | Push X register to stack
	LDA $E088			; AD 88 E0 | Game work RAM access
	STA $00			  ; 85 00 | Update graphics data
	LDA $E086			; AD 86 E0 | Game work RAM access
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E3
; Address: $C0EDC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E3:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $00			  ; A5 00 | Read graphics status
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E6
; Address: $C0EDD8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E7
; Address: $C0EDEE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E7:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E8
; Address: $C0EE04
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4E9
; Address: $C0EE12
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4E9:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4EA
; Address: $C0EE23
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4EA:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4EB
; Address: $C0EE33
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4EB:
	JSL $C05CE1		  ; 22 E1 5C C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4EC
; Address: $C0EE3C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4EC:
	JSR $74A9			; 20 A9 74 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4EF
; Address: $C0EE54
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4EF:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F0
; Address: $C0EE61
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F0:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F1
; Address: $C0EE6E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E086			; 8D 86 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F2
; Address: $C0EE80
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F2:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E088			; 8D 88 E0 | Game work RAM access
	ORA $E086			; 0D 86 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6F23			; 4C 23 6F | Jump to address
	PHX				  ; DA | Push X register to stack
	LDA $E088			; AD 88 E0 | Game work RAM access
	STA $00			  ; 85 00 | Update graphics data
	LDA $E086			; AD 86 E0 | Game work RAM access
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F3
; Address: $C0EEA6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F3:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $00			  ; A5 00 | Read graphics status
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F4
; Address: $C0EEB1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F4:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6F3A			; 4C 3A 6F | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F5
; Address: $C0EEBA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F7
; Address: $C0EED0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F7:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F8
; Address: $C0EEE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4F9
; Address: $C0EEF4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4F9:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4FA
; Address: $C0EF05
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4FA:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4FB
; Address: $C0EF15
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4FB:
	JSL $C05DA1		  ; 22 A1 5D C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4FC
; Address: $C0EF1E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4FC:
	JSR $74A9			; 20 A9 74 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_4FF
; Address: $C0EF36
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_4FF:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_500
; Address: $C0EF43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_500:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_501
; Address: $C0EF50
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_501:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $E086			; 8D 86 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_502
; Address: $C0EF62
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_502:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E088			; 8D 88 E0 | Game work RAM access
	ORA $E086			; 0D 86 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7005			; 4C 05 70 | Jump to address
	PHX				  ; DA | Push X register to stack
	LDA $E088			; AD 88 E0 | Game work RAM access
	STA $00			  ; 85 00 | Update graphics data
	LDA $E086			; AD 86 E0 | Game work RAM access
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_503
; Address: $C0EF88
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_503:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $00			  ; A5 00 | Read graphics status
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_504
; Address: $C0EF93
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_504:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $701C			; 4C 1C 70 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_505
; Address: $C0EF9C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_505:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_506
; Address: $C0EFB2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_506:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_508
; Address: $C0EFC8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_508:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_509
; Address: $C0EFD6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_509:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_50A
; Address: $C0EFE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_50A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_50B
; Address: $C0EFF7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_50B:
	JSL $C05E61		  ; 22 61 5E C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_50C
; Address: $C0F000
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_50C:
	JSR $74A9			; 20 A9 74 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_50F
; Address: $C0F018
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_50F:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_510
; Address: $C0F025
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_510:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_511
; Address: $C0F02C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_511:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E086			; 8E 86 E0 | Game work RAM access
	STY $E088			; 8C 88 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E088			; 0D 88 E0 | Game work RAM access
	BEQ $41			  ; F0 41 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E086			; AD 86 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E088			; AD 88 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_512
; Address: $C0F046
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_512:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_513
; Address: $C0F050
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_513:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $28			  ; 90 28 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_514
; Address: $C0F059
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_514:
	JSL $C05CE1		  ; 22 E1 5C C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_515
; Address: $C0F062
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_515:
	JSR $759C			; 20 9C 75 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_518
; Address: $C0F07A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_518:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_519
; Address: $C0F087
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_519:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_51A
; Address: $C0F08E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_51A:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E086			; 8E 86 E0 | Game work RAM access
	STY $E088			; 8C 88 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E088			; 0D 88 E0 | Game work RAM access
	BEQ $41			  ; F0 41 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E086			; AD 86 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E088			; AD 88 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_51B
; Address: $C0F0A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_51B:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_51C
; Address: $C0F0B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_51C:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $28			  ; 90 28 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_51D
; Address: $C0F0BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_51D:
	JSL $C05DA1		  ; 22 A1 5D C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_51E
; Address: $C0F0C4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_51E:
	JSR $759C			; 20 9C 75 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_521
; Address: $C0F0DC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_521:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_522
; Address: $C0F0E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_522:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_523
; Address: $C0F0F0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_523:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E086			; 8E 86 E0 | Game work RAM access
	STY $E088			; 8C 88 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E088			; 0D 88 E0 | Game work RAM access
	BEQ $41			  ; F0 41 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E086			; AD 86 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E088			; AD 88 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_524
; Address: $C0F10A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_524:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_525
; Address: $C0F114
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_525:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $28			  ; 90 28 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_526
; Address: $C0F11D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_526:
	JSL $C05E61		  ; 22 61 5E C0 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_527
; Address: $C0F126
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_527:
	JSR $759C			; 20 9C 75 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_52A
; Address: $C0F13E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_52A:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_52B
; Address: $C0F14B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_52B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_52C
; Address: $C0F152
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_52C:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $71FB			; 4C FB 71 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_52E
; Address: $C0F167
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_52E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	STA $E096			; 8D 96 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_52F
; Address: $C0F179
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_52F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E09A			; 8D 9A E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E096			; AD 96 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09A			; AD 9A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_530
; Address: $C0F194
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_530:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_531
; Address: $C0F19D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_531:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_532
; Address: $C0F1AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_532:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_533
; Address: $C0F1BC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_533:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_534
; Address: $C0F1CD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_534:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_536
; Address: $C0F1E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_536:
	JSR $7563			; 20 63 75 | Jump to subroutine
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_537
; Address: $C0F1EE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_537:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_538
; Address: $C0F1FB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_538:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_539
; Address: $C0F204
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_539:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $72B4			; 4C B4 72 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_53B
; Address: $C0F220
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_53B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E096			; 8D 96 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_53C
; Address: $C0F232
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_53C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E09A			; 8D 9A E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E096			; AD 96 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_53E
; Address: $C0F24D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_53E:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_53F
; Address: $C0F256
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_53F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_540
; Address: $C0F264
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_540:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_541
; Address: $C0F275
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_541:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_542
; Address: $C0F286
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_542:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BVC $18			  ; 50 18 | Branch if overflow clear
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_544
; Address: $C0F29C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_544:
	JSR $7563			; 20 63 75 | Jump to subroutine
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_545
; Address: $C0F2A7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_545:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_546
; Address: $C0F2B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_546:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_548
; Address: $C0F2BE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_548:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $736D			; 4C 6D 73 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54A
; Address: $C0F2D9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $E096			; 8D 96 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54B
; Address: $C0F2EB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E09A			; 8D 9A E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E096			; AD 96 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09A			; AD 9A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54C
; Address: $C0F306
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54C:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54D
; Address: $C0F30F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54D:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54E
; Address: $C0F31D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_54F
; Address: $C0F32E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_54F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_550
; Address: $C0F33F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_550:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C5			 ; 42 C5 | Reserved instruction
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_552
; Address: $C0F355
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_552:
	JSR $7563			; 20 63 75 | Jump to subroutine
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_553
; Address: $C0F360
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_553:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_554
; Address: $C0F36D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_554:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_555
; Address: $C0F376
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_555:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_556
; Address: $C0F382
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_556:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $E096			; 8D 96 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_557
; Address: $C0F397
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_557:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $E09A			; 8D 9A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_558
; Address: $C0F3AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_558:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E096			; AD 96 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09A			; AD 9A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_559
; Address: $C0F3B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_559:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55A
; Address: $C0F3BE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55A:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55B
; Address: $C0F3CC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55B:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55C
; Address: $C0F3DD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55D
; Address: $C0F3EE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55E
; Address: $C0F3FE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55E:
	JSL $C05CE1		  ; 22 E1 5C C0 | Jump to subroutine long
	BCC $45			  ; 90 45 | Branch if carry clear
	STZ $04			  ; 64 04 | Store zero to zero page
	LDA $E096			; AD 96 E0 | Game work RAM access
	STA $06			  ; 85 06 | Update graphics data
	STZ $08			  ; 64 08 | Store zero to zero page
	LDA $E09A			; AD 9A E0 | Game work RAM access
	STA $0A			  ; 85 0A | Update graphics data
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STA $18			  ; 85 18 | Update graphics data
	LDA $E090			; AD 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_55F
; Address: $C0F425
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_55F:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $E08C			; AD 8C E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_560
; Address: $C0F42D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_560:
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_561
; Address: $C0F43C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_561:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_562
; Address: $C0F449
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_562:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_563
; Address: $C0F452
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_563:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $E096			; 8D 96 E0 | Game work RAM access
	STX $E09A			; 8E 9A E0 | Game work RAM access
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $36			  ; 10 36 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BMI $31			  ; 30 31 | Branch if negative

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_564
; Address: $C0F46F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_564:
	JSR $754E			; 20 4E 75 | Jump to subroutine
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E096			; AD 96 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09A			; AD 9A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_565
; Address: $C0F47B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_565:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E08A			; 8D 8A E0 | Game work RAM access
	LDA $E096			; AD 96 E0 | Game work RAM access
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_566
; Address: $C0F489
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_566:
	JSR $7563			; 20 63 75 | Jump to subroutine
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $2E			  ; 64 2E | Store zero to zero page
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_567
; Address: $C0F493
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_567:
	JSL $C04C15		  ; 22 15 4C C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_568
; Address: $C0F4A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_568:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_569
; Address: $C0F4A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_569:
	JSL $C05A71		  ; 22 71 5A C0 | Jump to subroutine long
	BCS $01			  ; B0 01 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56A
; Address: $C0F4B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56A:
	JSR $74D0			; 20 D0 74 | Jump to subroutine
	LDA $E412,Y		  ; B9 12 E4 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56B
; Address: $C0F4BA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56B:
	JSL $C04923		  ; 22 23 49 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $AEA6			; 6D A6 AE | Add with carry (absolute)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F1			  ; D0 F1 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56C
; Address: $C0F4D0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56C:
	STA $E3F2,Y		  ; 99 F2 E3 | Update graphics data
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $E492,Y		  ; 99 92 E4 | Update graphics data
	LDA $FC4C			; AD 4C FC | Read graphics status
	STA $E472,Y		  ; 99 72 E4 | Update graphics data
	LDA $FC4A			; AD 4A FC | Read graphics status
	STA $E4B2,Y		  ; 99 B2 E4 | Update graphics data
	LDX $AE9A			; AE 9A AE | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $E4A2,Y		  ; 99 A2 E4 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56D
; Address: $C0F4EC
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56D:
	LDA $ADF4,X		  ; BD F4 AD | Read graphics status
	STA $E412,Y		  ; 99 12 E4 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $E422,Y		  ; 99 22 E4 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $99			  ; 80 99 | Branch always
	SEP #$E3			 ; E2 E3 | Set processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $E552			; 8D 52 E5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E4D2,Y		  ; 99 D2 E4 | Update graphics data
	STA $E4E2,Y		  ; 99 E2 E4 | Update graphics data
	STA $E4F2,Y		  ; 99 F2 E4 | Update graphics data
	STA $E502,Y		  ; 99 02 E5 | Update graphics data
	STA $E512,Y		  ; 99 12 E5 | Update graphics data
	STA $E522,Y		  ; 99 22 E5 | Update graphics data
	STA $E532,Y		  ; 99 32 E5 | Update graphics data
	STA $E542,Y		  ; 99 42 E5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E402,Y		  ; 99 02 E4 | Update graphics data
	LDA $E086			; AD 86 E0 | Game work RAM access
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC46			; AD 46 FC | Read graphics status
	STA $E432,Y		  ; 99 32 E4 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E442,Y		  ; 99 42 E4 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E088			; AD 88 E0 | Game work RAM access
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC48			; AD 48 FC | Read graphics status
	STA $E452,Y		  ; 99 52 E4 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E462,Y		  ; 99 62 E4 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56E
; Address: $C0F54E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56E:
	LDA $7E967C		  ; AF 7C 96 7E | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E08C			; 8D 8C E0 | Game work RAM access
	LDA $7E967E		  ; AF 7E 96 7E | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E090			; 8D 90 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_56F
; Address: $C0F563
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_56F:
	STZ $04			  ; 64 04 | Store zero to zero page
	LDA $E096			; AD 96 E0 | Game work RAM access
	STA $06			  ; 85 06 | Update graphics data
	STZ $08			  ; 64 08 | Store zero to zero page
	LDA $E09A			; AD 9A E0 | Game work RAM access
	STA $0A			  ; 85 0A | Update graphics data
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STA $18			  ; 85 18 | Update graphics data
	LDA $E090			; AD 90 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_570
; Address: $C0F588
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_570:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $E08C			; AD 8C E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_572
; Address: $C0F5A2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_572:
	JSR $74D0			; 20 D0 74 | Jump to subroutine
	LDA $AEA6			; AD A6 AE | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $E412,Y		  ; B9 12 E4 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E08A			; AD 8A E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_573
; Address: $C0F5B1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_573:
	JSL $C04A44		  ; 22 44 4A C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_574
; Address: $C0F5B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_574:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_576
; Address: $C0F5CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_576:
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E09C			; 8D 9C E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_577
; Address: $C0F5D6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_577:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E09E			; 8D 9E E0 | Game work RAM access
	ORA $E09C			; 0D 9C E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7693			; 4C 93 76 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_578
; Address: $C0F5F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_578:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_579
; Address: $C0F603
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_579:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7693			; 4C 93 76 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_57A
; Address: $C0F60C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_57A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_57B
; Address: $C0F622
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_57B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_57C
; Address: $C0F638
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_57C:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_57D
; Address: $C0F646
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_57D:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_57E
; Address: $C0F657
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_57E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_580
; Address: $C0F667
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_580:
	JSL $C0675C		  ; 22 5C 67 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$06			 ; A9 06 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_581
; Address: $C0F670
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_581:
	JSR $79A1			; 20 A1 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_585
; Address: $C0F68F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_585:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_586
; Address: $C0F69C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_586:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_587
; Address: $C0F6A9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_587:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	STA $E09C			; 8D 9C E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_588
; Address: $C0F6BB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_588:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E09E			; 8D 9E E0 | Game work RAM access
	ORA $E09C			; 0D 9C E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_589
; Address: $C0F6D2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_589:
	JMP $7778			; 4C 78 77 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58A
; Address: $C0F6DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58A:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58B
; Address: $C0F6E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58B:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7778			; 4C 78 77 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58C
; Address: $C0F6F1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58D
; Address: $C0F707
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58E
; Address: $C0F71D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_58F
; Address: $C0F72B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_58F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_590
; Address: $C0F73C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_590:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_591
; Address: $C0F74C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_591:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$08			 ; A9 08 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_592
; Address: $C0F755
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_592:
	JSR $79A1			; 20 A1 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_597
; Address: $C0F774
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_597:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_598
; Address: $C0F781
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_598:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_599
; Address: $C0F78E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_599:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E09C			; 8D 9C E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59A
; Address: $C0F7A0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E09E			; 8D 9E E0 | Game work RAM access
	ORA $E09C			; 0D 9C E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $785D			; 4C 5D 78 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59B
; Address: $C0F7C3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59B:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59C
; Address: $C0F7CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59C:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $785D			; 4C 5D 78 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59D
; Address: $C0F7D6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59E
; Address: $C0F7EC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_59F
; Address: $C0F802
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_59F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A0
; Address: $C0F810
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A0:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A1
; Address: $C0F821
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A2
; Address: $C0F831
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A2:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$0A			 ; A9 0A | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A3
; Address: $C0F83A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A3:
	JSR $79A1			; 20 A1 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A8
; Address: $C0F85E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A8:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5A9
; Address: $C0F866
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5A9:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E09C			; 8E 9C E0 | Game work RAM access
	STY $E09E			; 8C 9E E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E09E			; 0D 9E E0 | Game work RAM access
	BEQ $48			  ; F0 48 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5AA
; Address: $C0F887
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5AA:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5AB
; Address: $C0F891
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5AB:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $2F			  ; 90 2F | Branch if carry clear
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5AC
; Address: $C0F89A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5AC:
	JSL $C0675C		  ; 22 5C 67 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$06			 ; A9 06 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5AD
; Address: $C0F8A3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5AD:
	JSR $79CF			; 20 CF 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B1
; Address: $C0F8C2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B1:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B2
; Address: $C0F8CF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E09C			; 8E 9C E0 | Game work RAM access
	STY $E09E			; 8C 9E E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E09E			; 0D 9E E0 | Game work RAM access
	BEQ $48			  ; F0 48 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B3
; Address: $C0F8F0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B3:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B4
; Address: $C0F8FA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B4:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $2F			  ; 90 2F | Branch if carry clear
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B5
; Address: $C0F903
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B5:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$08			 ; A9 08 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5B6
; Address: $C0F90C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5B6:
	JSR $79CF			; 20 CF 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BA
; Address: $C0F92B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BA:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BB
; Address: $C0F938
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $E09C			; 8E 9C E0 | Game work RAM access
	STY $E09E			; 8C 9E E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $E09E			; 0D 9E E0 | Game work RAM access
	BEQ $48			  ; F0 48 | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E09C			; AD 9C E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E09E			; AD 9E E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BC
; Address: $C0F959
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BC:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BD
; Address: $C0F963
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BD:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCC $2F			  ; 90 2F | Branch if carry clear
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BE
; Address: $C0F96C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BE:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA #$0A			 ; A9 0A | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5BF
; Address: $C0F975
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5BF:
	JSR $79CF			; 20 CF 79 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5C3
; Address: $C0F994
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5C3:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5C5
; Address: $C0F9A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5C5:
	JSR $79EE			; 20 EE 79 | Jump to subroutine
	LDA $E412,Y		  ; B9 12 E4 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5C6
; Address: $C0F9B1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5C6:
	JSL $C04923		  ; 22 23 49 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B754			; AD 54 B7 | Read graphics status
	STA $857E,Y		  ; 99 7E 85 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F2			  ; D0 F2 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5C8
; Address: $C0F9D5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5C8:
	JSR $79EE			; 20 EE 79 | Jump to subroutine
	LDA $B754			; AD 54 B7 | Read graphics status
	STA $857E,Y		  ; 99 7E 85 | Update graphics data
	LDA $E412,Y		  ; B9 12 E4 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5C9
; Address: $C0F9E8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5C9:
	JSL $C04A44		  ; 22 44 4A C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5CA
; Address: $C0F9EE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5CA:
	STA $E3F2,Y		  ; 99 F2 E3 | Update graphics data
	LDA $FC4C			; AD 4C FC | Read graphics status
	STA $E472,Y		  ; 99 72 E4 | Update graphics data
	LDA $FC4A			; AD 4A FC | Read graphics status
	STA $E4B2,Y		  ; 99 B2 E4 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5CB
; Address: $C0F9FD
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5CB:
	LDX $AE9A			; AE 9A AE | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $E4A2,Y		  ; 99 A2 E4 | Update graphics data
	LDA $ADF4,X		  ; BD F4 AD | Read graphics status
	STA $E412,Y		  ; 99 12 E4 | Update graphics data
	LDA #$7F			 ; A9 7F | Read graphics status
	STA $E422,Y		  ; 99 22 E4 | Update graphics data
	LDA $B750			; AD 50 B7 | Read graphics status
	STA $E482,Y		  ; 99 82 E4 | Update graphics data
	LDA $AEA2			; AD A2 AE | Read graphics status
	STA $E492,Y		  ; 99 92 E4 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $99			  ; 80 99 | Branch always
	SEP #$E3			 ; E2 E3 | Set processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $E552			; 8D 52 E5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E4D2,Y		  ; 99 D2 E4 | Update graphics data
	STA $E4E2,Y		  ; 99 E2 E4 | Update graphics data
	STA $E4F2,Y		  ; 99 F2 E4 | Update graphics data
	STA $E502,Y		  ; 99 02 E5 | Update graphics data
	STA $E512,Y		  ; 99 12 E5 | Update graphics data
	STA $E522,Y		  ; 99 22 E5 | Update graphics data
	STA $E532,Y		  ; 99 32 E5 | Update graphics data
	STA $E542,Y		  ; 99 42 E5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $E402,Y		  ; 99 02 E4 | Update graphics data
	LDA $E09C			; AD 9C E0 | Game work RAM access
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC46			; AD 46 FC | Read graphics status
	STA $E432,Y		  ; 99 32 E4 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E442,Y		  ; 99 42 E4 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E09E			; AD 9E E0 | Game work RAM access
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $FC48			; AD 48 FC | Read graphics status
	STA $E452,Y		  ; 99 52 E4 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	STA $E462,Y		  ; 99 62 E4 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5CD
; Address: $C0FA77
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5CD:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $7B2B			; 4C 2B 7B | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5CF
; Address: $C0FA91
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5CF:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E0AC			; 8D AC E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D0
; Address: $C0FAA3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D0:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E0B0			; 8D B0 E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0AC			; AD AC E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B0			; AD B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D1
; Address: $C0FABE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D1:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D2
; Address: $C0FAC7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D2:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D3
; Address: $C0FAD5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D3:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D4
; Address: $C0FAE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D5
; Address: $C0FAF7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D6
; Address: $C0FB00
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D6:
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D7
; Address: $C0FB08
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D7:
	JSL $C0675C		  ; 22 5C 67 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $1C			  ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D8
; Address: $C0FB0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D8:
	JSR $7DDA			; 20 DA 7D | Jump to subroutine
	LDA $B754			; AD 54 B7 | Read graphics status
	STY $96			  ; 84 96 | Store Y register to zero page
	ROR $2E85,X		  ; 7E 85 2E | Rotate right (absolute,X)
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5D9
; Address: $C0FB1E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5D9:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5DA
; Address: $C0FB2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5DA:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5DB
; Address: $C0FB34
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5DB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $7BEB			; 4C EB 7B | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5DD
; Address: $C0FB51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5DD:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	STA $E0AC			; 8D AC E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5DF
; Address: $C0FB6A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5DF:
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B0			; 8D B0 E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0AC			; AD AC E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B0			; AD B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E0
; Address: $C0FB7E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E0:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E1
; Address: $C0FB87
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E1:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E2
; Address: $C0FB95
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E2:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E3
; Address: $C0FBA6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E4
; Address: $C0FBB7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E5
; Address: $C0FBC8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E5:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $1C			  ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E6
; Address: $C0FBCF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E6:
	JSR $7DDA			; 20 DA 7D | Jump to subroutine
	LDA $B754			; AD 54 B7 | Read graphics status
	STY $96			  ; 84 96 | Store Y register to zero page
	ROR $2E85,X		  ; 7E 85 2E | Rotate right (absolute,X)
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E7
; Address: $C0FBDE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E7:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E8
; Address: $C0FBEB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E8:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5E9
; Address: $C0FBEF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5E9:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5EA
; Address: $C0FBF4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5EA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $05			  ; 10 05 | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status
	BPL $03			  ; 10 03 | Branch if positive
	JMP $7CAB			; 4C AB 7C | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5EC
; Address: $C0FC11
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5EC:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $E0AC			; 8D AC E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5ED
; Address: $C0FC23
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5ED:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STA $E0B0			; 8D B0 E0 | Game work RAM access
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0AC			; AD AC E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B0			; AD B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5EE
; Address: $C0FC3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5EE:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5EF
; Address: $C0FC47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5EF:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F0
; Address: $C0FC55
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F0:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F2
; Address: $C0FC6B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F2:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F3
; Address: $C0FC77
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F4
; Address: $C0FC88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F4:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $1C			  ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F5
; Address: $C0FC8F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F5:
	JSR $7DDA			; 20 DA 7D | Jump to subroutine
	LDA $B754			; AD 54 B7 | Read graphics status
	STY $96			  ; 84 96 | Store Y register to zero page
	ROR $2E85,X		  ; 7E 85 2E | Rotate right (absolute,X)
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F6
; Address: $C0FC9E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F6:
	JSL $C04A5B		  ; 22 5B 4A C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F7
; Address: $C0FCAB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F7:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5F8
; Address: $C0FCB4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5F8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $E0AC			; 8D AC E0 | Game work RAM access
	STX $E0B0			; 8E B0 E0 | Game work RAM access
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $3A			  ; 10 3A | Branch if positive
	LDA $E4A2,Y		  ; B9 A2 E4 | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FA
; Address: $C0FCD1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FA:
	JSR $7DAB			; 20 AB 7D | Jump to subroutine
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0AC			; AD AC E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B0			; AD B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FB
; Address: $C0FCDD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FB:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0A0			; 8D A0 E0 | Game work RAM access
	LDA $E0AC			; AD AC E0 | Game work RAM access
	STA $0C			  ; 85 0C | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FC
; Address: $C0FCEB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FC:
	JSR $7DDA			; 20 DA 7D | Jump to subroutine
	STZ $00			  ; 64 00 | Store zero to zero page
	LDA $7E9684		  ; AF 84 96 7E | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	LDA $E0A0			; AD A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FD
; Address: $C0FCF9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FD:
	JSL $C04C15		  ; 22 15 4C C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FE
; Address: $C0FD06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FE:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_5FF
; Address: $C0FD0F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_5FF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_600
; Address: $C0FD1B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_600:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_601
; Address: $C0FD2B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_601:
	JSL $C0675C		  ; 22 5C 67 C0 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_602
; Address: $C0FD32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_602:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_603
; Address: $C0FD3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_603:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_604
; Address: $C0FD43
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_604:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_605
; Address: $C0FD4F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_605:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $C518,X		  ; 7D 18 C5 | Add with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_606
; Address: $C0FD5F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_606:
	JSL $C067FD		  ; 22 FD 67 C0 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_607
; Address: $C0FD6E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_607:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_608
; Address: $C0FD77
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_608:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_609
; Address: $C0FD7C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_609:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_60A
; Address: $C0FD83
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_60A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_60B
; Address: $C0FD93
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_60B:
	JSL $C0689E		  ; 22 9E 68 C0 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_60C
; Address: $C0FDA2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_60C:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_60D
; Address: $C0FDAB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_60D:
	LDA $E432,Y		  ; B9 32 E4 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E9680		  ; AF 80 96 7E | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX #$E0			 ; A2 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E452,Y		  ; B9 52 E4 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E9682		  ; AF 82 96 7E | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $E0			  ; A6 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_60F
; Address: $C0FDDA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_60F:
	STZ $04			  ; 64 04 | Store zero to zero page
	LDA $E0AC			; AD AC E0 | Game work RAM access
	STA $06			  ; 85 06 | Update graphics data
	STZ $08			  ; 64 08 | Store zero to zero page
	LDA $E0B0			; AD B0 E0 | Game work RAM access
	STA $0A			  ; 85 0A | Update graphics data
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	STA $0E			  ; 85 0E | Update graphics data
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STA $18			  ; 85 18 | Update graphics data
	LDA $E0A6			; AD A6 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_610
; Address: $C0FDFF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_610:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $E0A2			; AD A2 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_611
; Address: $C0FE15
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_611:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_612
; Address: $C0FE21
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_612:
	JSR $7E47			; 20 47 7E | Jump to subroutine
	LDA $0000,Y		  ; B9 00 00 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_613
; Address: $C0FE2C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_613:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_614
; Address: $C0FE33
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_614:
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_615
; Address: $C0FE39
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_615:
	JSR $7E47			; 20 47 7E | Jump to subroutine
	ORA $99			  ; 05 99 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_616
; Address: $C0FE47
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_616:
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E452,X		  ; FD 52 E4 | Subtract with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $E442,X		  ; BD 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,X		  ; FD 32 E4 | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	ORA ($A5,X)		  ; 01 A5 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SBC $E432,X		  ; FD 32 E4 | Subtract with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC $E412,X		  ; 7D 12 E4 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_617
; Address: $C0FE84
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_617:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_618
; Address: $C0FE8B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_618:
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_619
; Address: $C0FE91
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_619:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	STA $E0B2			; 8D B2 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61A
; Address: $C0FEA3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B4			; 8D B4 E0 | Game work RAM access
	ORA $E0B2			; 0D B2 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7F74			; 4C 74 7F | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0B2			; AD B2 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B4			; AD B4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61B
; Address: $C0FEC6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61B:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61C
; Address: $C0FED0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61C:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7F74			; 4C 74 7F | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61D
; Address: $C0FED9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61E
; Address: $C0FEEF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_61F
; Address: $C0FF05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_61F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_620
; Address: $C0FF16
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_620:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STZ $C510			; 9C 10 C5 | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B8			; 8D B8 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_623
; Address: $C0FF38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_623:
	JSL $C0675C		  ; 22 5C 67 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $2E			  ; 90 2E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_624
; Address: $C0FF3F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_624:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_625
; Address: $C0FF4D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_625:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $C5			  ; 10 C5 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data
	LDA #$0C			 ; A9 0C | Read graphics status

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_626
; Address: $C0FF61
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_626:
	JSR $847A			; 20 7A 84 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_628
; Address: $C0FF70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_628:
	JSL $C09052		  ; 22 52 90 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_629
; Address: $C0FF7D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_629:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62A
; Address: $C0FF8A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	STA $E0B2			; 8D B2 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62B
; Address: $C0FF9C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $E0B4			; 8D B4 E0 | Game work RAM access
	ORA $E0B2			; 0D B2 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $806D			; 4C 6D 80 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $E0B2			; AD B2 E0 | Game work RAM access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E0B4			; AD B4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62C
; Address: $C0FFBF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62C:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $E0B6			; 8D B6 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62D
; Address: $C0FFC9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62D:
	JSL $C08FD7		  ; 22 D7 8F C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $806D			; 4C 6D 80 | Jump to address

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62E
; Address: $C0FFD2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC46			; 6D 46 FC | Add with carry (absolute)
	STA $FC46			; 8D 46 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank00_GraphicsFunction_62F
; Address: $C0FFE8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank00_GraphicsFunction_62F:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FC48			; 6D 48 FC | Add with carry (absolute)
	STA $FC48			; 8D 48 FC | Update graphics data
