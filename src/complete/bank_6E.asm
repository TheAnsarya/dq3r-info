;==============================================================================
; Dragon Quest III - Bank $6E
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F70000-$F77FFF
; Instructions: 7833
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_6E"

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_000
; Address: $F78014
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_000:
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,Y		  ; 19 00 1D | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $AA00			; CC 00 AA | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	EOR $E724,Y		  ; 59 24 E7 | Exclusive OR with accumulator (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ROR $DB00,X		  ; 7E 00 DB | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ADC $0F00,Y		  ; 79 00 0F | Add with carry (absolute,Y)
	DEC $B300,X		  ; DE 00 B3 | Decrement (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	ADC $0F00,Y		  ; 79 00 0F | Add with carry (absolute,Y)
	DEC $B300,X		  ; DE 00 B3 | Decrement (absolute,X)
	EOR ($22),Y		  ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
	LDX #$51			 ; A2 51 | Load immediate value into X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_001
; Address: $F78158
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_001:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $1E			  ; 80 1E | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INC $7B00,X		  ; FE 00 7B | Increment (absolute,X)
	CMP $CC00			; CD 00 CC | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $F000,X		  ; 9E 00 F0 | Store zero to absolute,X
	INC $7B00,X		  ; FE 00 7B | Increment (absolute,X)
	CMP $CC00			; CD 00 CC | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_002
; Address: $F78207
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_002:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_003
; Address: $F78216
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_003:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_004
; Address: $F7827C
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_004:
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7F00			; 0E 00 7F | Arithmetic shift left (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BPL $08			  ; 10 08 | Branch if positive
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_005
; Address: $F78468
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_005:
	STA				  ; 9F 00 1F 00 | Store accumulator to absolute long,X
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	STA				  ; 9F 00 1F 00 | Store accumulator to absolute long,X
	TAX				  ; AA | Transfer accumulator to X register
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	DEC $00			  ; C6 00 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	WDM #$E7			 ; 42 E7 | Reserved instruction
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_006
; Address: $F7859E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_006:
	BEQ $00			  ; F0 00 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR $1900,Y		  ; 59 00 19 | Exclusive OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR $1900,Y		  ; 59 00 19 | Exclusive OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($51),Y		  ; 11 51 | Logical OR with accumulator ((zero page),Y)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	DEY				  ; 88 | Decrement Y register
	TXA				  ; 8A | Transfer X register to accumulator
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($A0,X)		  ; E1 A0 | Subtract with carry ((zero page,X))
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	DEC $CF00			; CE 00 CF | Decrement (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_007
; Address: $F78660
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_007:
	JSR $4400			; 20 00 44 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_008
; Address: $F78698
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_008:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_009
; Address: $F7874E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_009:
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00A
; Address: $F787A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00B
; Address: $F787B8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $FF00			; AD 00 FF | Load from absolute address into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $01			  ; A5 01 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00C
; Address: $F7884D
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00C:
	STA ($14,X)		  ; 81 14 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	LDY $F4			  ; A4 F4 | Load from zero page into Y register
	BPL $B0			  ; 10 B0 | Branch if positive
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$B000		   ; F4 00 B0 | Push effective address to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $F4			  ; F0 F4 | Branch if equal
	BCS $B0			  ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00D
; Address: $F78948
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00D:
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$B000		   ; F4 00 B0 | Push effective address to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$2A			 ; A0 2A | Load immediate value into Y register
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	AND $0D2D			; 2D 2D 0D | Logical AND with accumulator (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	AND $0D00			; 2D 00 0D | Logical AND with accumulator (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	BCS $B0			  ; B0 B0 | Branch if carry set
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$B400		   ; F4 00 B4 | Push effective address to stack
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00E
; Address: $F789D9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00E:
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_00F
; Address: $F78A02
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_00F:
	JSR $C0A0			; 20 A0 C0 | Jump to subroutine
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_011
; Address: $F78A0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_011:
	JSR $00A0			; 20 A0 00 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_015
; Address: $F78A91
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_015:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_016
; Address: $F78BAA
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_016:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA				  ; 9F 00 01 00 | Store accumulator to absolute long,X
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR ($AE),Y		  ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
	LDX $7D			  ; A6 7D | Load from zero page into X register
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	EOR ($A8),Y		  ; 51 A8 | Exclusive OR with accumulator ((zero page),Y)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDY #$AA			 ; A0 AA | Load immediate value into Y register
	TAX				  ; AA | Transfer accumulator to X register
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $55			  ; 05 55 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_017
; Address: $F78CDC
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_017:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	LDA $01			  ; A5 01 | Load from zero page into accumulator
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	LDY $58			  ; A4 58 | Load from zero page into Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $80			  ; A5 80 | Load from zero page into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $1900			; 0D 00 19 | Logical OR with accumulator (absolute)
	ORA $1900			; 0D 00 19 | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	STA $0A8F00		  ; 8F 00 8F 0A | Store accumulator to absolute long address
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($50),Y		  ; F1 50 | Subtract with carry ((zero page),Y)
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	CMP $CF00,X		  ; DD 00 CF | Compare accumulator (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $40			  ; 50 40 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_018
; Address: $F78DAD
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_018:
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $BE			  ; 65 BE | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	BRA $A0			  ; 80 A0 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $5A			  ; A5 5A | Load from zero page into accumulator
	PHY				  ; 5A | Push Y register to stack
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA				  ; BF 00 FF 2A | Load from absolute long,X into accumulator
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_019
; Address: $F78EC0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_019:
	LDA $5A			  ; A5 5A | Load from zero page into accumulator
	PHY				  ; 5A | Push Y register to stack
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	INC $F850,X		  ; FE 50 F8 | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01A
; Address: $F78F4A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01A:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01B
; Address: $F78FA0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01B:
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01C
; Address: $F78FAC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01C:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	INC $F8A8,X		  ; FE A8 F8 | Increment (absolute,X)
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	BCS $B0			  ; B0 B0 | Branch if carry set
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01D
; Address: $F7901F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01E
; Address: $F790F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_01F
; Address: $F79138
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_01F:
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($C3,X)		  ; 81 C3 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_020
; Address: $F7926E
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_020:
	WDM #$E7			 ; 42 E7 | Reserved instruction
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	WDM #$E7			 ; 42 E7 | Reserved instruction
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_021
; Address: $F793B2
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_021:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	STA ($C3,X)		  ; 81 C3 | Store accumulator to (zero page,X)
	WDM #$E7			 ; 42 E7 | Reserved instruction
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_022
; Address: $F79516
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_022:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_023
; Address: $F7956F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_023:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	PEA #$F000		   ; F4 00 F0 | Push effective address to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_024
; Address: $F7966F
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_024:
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$A000		   ; F4 00 A0 | Push effective address to stack
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$2A00		   ; F4 00 2A | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	BVC $A4			  ; 50 A4 | Branch if overflow clear
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_025
; Address: $F79749
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_025:
	JSR $2020			; 20 20 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_026
; Address: $F79758
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_026:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_027
; Address: $F7976B
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_027:
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $FF55,X		  ; 7E 55 FF | Rotate right (absolute,X)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	PEA #$F000		   ; F4 00 F0 | Push effective address to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $05			  ; 25 05 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $7E54,X		  ; 7E 54 7E | Rotate right (absolute,X)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_028
; Address: $F7981A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_028:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_029
; Address: $F79887
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_029:
	JSR $2020			; 20 20 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02A
; Address: $F79896
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $7E54,X		  ; 7E 54 7E | Rotate right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02B
; Address: $F798EE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02B:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,Y		  ; 19 00 1D | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	ROR $3F00,X		  ; 7E 00 3F | Rotate right (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02C
; Address: $F79962
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02C:
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,Y		  ; 19 00 1D | Logical OR with accumulator (absolute,Y)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,Y		  ; 19 00 1D | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $88			  ; C6 88 | Decrement (zero page)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02D
; Address: $F799EE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02D:
	JSL $000022		  ; 22 22 00 00 | Jump to subroutine long
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,Y		  ; 19 00 1D | Logical OR with accumulator (absolute,Y)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $88			  ; C6 88 | Decrement (zero page)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02E
; Address: $F79A80
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02E:
	EOR ($63,X)		  ; 41 63 | Exclusive OR with accumulator ((zero page,X))
	LDX #$E7			 ; A2 E7 | Load immediate value into X register
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	LDX #$45			 ; A2 45 | Load immediate value into X register
	BVC $50			  ; 50 50 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_02F
; Address: $F79B18
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_02F:
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	STY $8F00			; 8C 00 8F | Store Y register to absolute address
	ROR $00			  ; 66 00 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_030
; Address: $F79C0D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_030:
	BRA $70			  ; 80 70 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_034
; Address: $F79C3A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_034:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $80			  ; 30 80 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ORA $1F00,Y		  ; 19 00 1F | Logical OR with accumulator (absolute,Y)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_035
; Address: $F79C7A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_035:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	BRA $48			  ; 80 48 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $37			  ; 24 37 | Test bits in accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	EOR $0037			; 4D 37 00 | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	STZ $2004,X		  ; 9E 04 20 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_036
; Address: $F79CC1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_036:
	JSR $6070			; 20 70 60 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BEQ $20			  ; F0 20 | Branch if equal
	INX				  ; E8 | Increment X register
	BVS $94			  ; 70 94 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $0800			; 2C 00 08 | Test bits in accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0E0D			; 0D 0D 0E | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0E7B			; 0D 7B 0E | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_037
; Address: $F79D09
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_037:
	BRA $70			  ; 80 70 | Branch always
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_039
; Address: $F79D18
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_039:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	BVS $09			  ; 70 09 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_03A
; Address: $F79D26
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_03A:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BPL $E0			  ; 10 E0 | Game work RAM access
	BMI $C0			  ; 30 C0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_03C
; Address: $F79D36
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_03C:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $80			  ; 30 80 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_03D
; Address: $F79D6D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_03D:
	RTI				  ; 40 | Return from interrupt
	BVS $10			  ; 70 10 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_03E
; Address: $F79D76
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_03E:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $D818,X		  ; 7E 18 D8 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_03F
; Address: $F79D7E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_03F:
	STZ $0070			; 9C 70 00 | Store zero to absolute
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	BPL $60			  ; 10 60 | Branch if positive
	AND $3860,Y		  ; 39 60 38 | Logical AND with accumulator (absolute,Y)
	ADC ($0F,X)		  ; 61 0F | Add with carry ((zero page,X))
	BMI $1D			  ; 30 1D | Branch if negative
	BPL $3F			  ; 10 3F | Branch if positive
	ORA #$AF			 ; 09 AF | Logical OR with accumulator (immediate)
	BMI $60			  ; 30 60 | Branch if negative
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ADC ($16),Y		  ; 71 16 | Add with carry ((zero page),Y)
	AND $3B04,Y		  ; 39 04 3B | Logical AND with accumulator (absolute,Y)
	ORA $3B			  ; 05 3B | Logical OR with accumulator (zero page)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_040
; Address: $F79DBE
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_040:
	BPL $80			  ; 10 80 | Branch if positive
	BRA $60			  ; 80 60 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	DEC $5F08			; CE 08 5F | Decrement (absolute)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $1F86			; CE 86 1F | Decrement (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	LDX $FD1E,Y		  ; BE 1E FD | Load from absolute,Y into X register
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $3010,X		  ; 1D 10 30 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $C380,Y		  ; B9 80 C3 | Load from absolute,Y into accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $60			  ; 30 60 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_041
; Address: $F79E50
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_041:
	JSR $30E0			; 20 E0 30 | Jump to subroutine
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	ORA $3E04,X		  ; 1D 04 3E | Logical OR with accumulator (absolute,X)
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_042
; Address: $F79E72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_042:
	JSR $1C1F			; 20 1F 1C | Jump to subroutine
	BVC $0F			  ; 50 0F | Branch if overflow clear
	ROR $1D			  ; 66 1D | Rotate right (zero page)
	ROL $1C3F,X		  ; 3E 3F 1C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_043
; Address: $F79E80
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_043:
	BPL $10			  ; 10 10 | Branch if positive
	BNE $D0			  ; D0 D0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX $1824			; EC 24 18 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BPL $F9			  ; 10 F9 | Branch if positive
	BNE $1C			  ; D0 1C | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	ASL $36FC,X		  ; 1E FC 36 | Arithmetic shift left (absolute,X)
	CPX $18EC			; EC EC 18 | Compare X register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_044
; Address: $F79EA0
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_044:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BVS $78			  ; 70 78 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	BRA $1C			  ; 80 1C | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $C4			  ; 70 C4 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	LDY $D8			  ; A4 D8 | Load from zero page into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0107			; 0E 07 01 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BMI $1F			  ; 30 1F | Branch if negative
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_045
; Address: $F79EE6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_045:
	JSR $F6E6			; 20 E6 F6 | Jump to subroutine
	DEC $FF			  ; C6 FF | Decrement (zero page)
	STX $DF			  ; 86 DF | Store X register to zero page
	BMI $3F			  ; 30 3F | Branch if negative
	SBC $3916,Y		  ; F9 16 39 | Subtract with carry (absolute,Y)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $09C0,Y		  ; 19 C0 09 | Logical OR with accumulator (absolute,Y)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $90			  ; 80 90 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_046
; Address: $F79EFD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_046:
	BPL $19			  ; 10 19 | Branch if positive
	STA $C000,Y		  ; 99 00 C0 | Store accumulator to absolute,Y
	BRA $C0			  ; 80 C0 | Branch always
	ASL $4940			; 0E 40 49 | Arithmetic shift left (absolute)
	ROR $36F8,X		  ; 7E F8 36 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BCS $C8			  ; B0 C8 | Branch if carry set
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	ROL $3608,X		  ; 3E 08 36 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_047
; Address: $F79F1A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_047:
	JSR $901C			; 20 1C 90 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BRA $98			  ; 80 98 | Branch always
	ASL $0F02			; 0E 02 0F | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F29			; 0E 29 0F | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	LSR $03			  ; 46 03 | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SBC ($31),Y		  ; F1 31 | Subtract with carry ((zero page),Y)
	SBC $FF18,Y		  ; F9 18 FF | Subtract with carry (absolute,Y)
	STZ $00FF,X		  ; 9E FF 00 | Store zero to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_048
; Address: $F79F4F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_048:
	JSL $39F80C		  ; 22 0C F8 39 | Jump to subroutine long
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	SBC ($1E),Y		  ; F1 1E | Subtract with carry ((zero page),Y)
	SBC $FF9E,Y		  ; F9 9E FF | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_049
; Address: $F79F5E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_049:
	ROL $01E3,X		  ; 3E E3 01 | Rotate left (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$E6			 ; A0 E6 | Load immediate value into Y register
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ASL $5F			  ; 06 5F | Arithmetic shift left (zero page)
	BCS $3F			  ; B0 3F | Branch if carry set
	ADC $5FC6,Y		  ; 79 C6 5F | Add with carry (absolute,Y)
	SBC $707F,Y		  ; F9 7F 70 | Subtract with carry (absolute,Y)
	ORA $C019,Y		  ; 19 19 C0 | Logical OR with accumulator (absolute,Y)
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $90			  ; 10 90 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04A
; Address: $F79F98
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04A:
	ORA $2019,Y		  ; 19 19 20 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	AND $0FF0,X		  ; 3D F0 0F | Logical AND with accumulator (absolute,X)
	LDX #$DB			 ; A2 DB | Load immediate value into X register
	LDA $EDEFF3		  ; AF F3 EF ED | Load from absolute long address into accumulator
	STA				  ; 9F 88 36 00 | Store accumulator to absolute long,X
	AND $0B31,X		  ; 3D 31 0B | Logical AND with accumulator (absolute,X)
	STY $98			  ; 84 98 | Store Y register to zero page
	BRA $40			  ; 80 40 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $1F02			; 0E 02 1F | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	EOR $FF82			; 4D 82 FF | Exclusive OR with accumulator (absolute)
	LDY $87			  ; A4 87 | Load from zero page into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $81			  ; 86 81 | Store X register to zero page
	RTI				  ; 40 | Return from interrupt
	STZ $A6			  ; 64 A6 | Store zero to zero page
	BIT $3628			; 2C 28 36 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$E8F0		   ; F4 F0 E8 | Push effective address to stack
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04B
; Address: $F79FF8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04B:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BMI $40			  ; 30 40 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04C
; Address: $F7A000
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04C:
	JSR $1078			; 20 78 10 | Jump to subroutine
	ROL $1E05,X		  ; 3E 05 1E | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $70			  ; 10 70 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04D
; Address: $F7A043
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04D:
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $1C16,X		  ; 1E 16 1C | Arithmetic shift left (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	STA $990F,Y		  ; 99 0F 99 | Store accumulator to absolute,Y
	ASL $1C7E,X		  ; 1E 7E 1C | Arithmetic shift left (absolute,X)
	BMI $E4			  ; 30 E4 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $9818			; 9C 18 98 | Store zero to absolute
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04E
; Address: $F7A07A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04E:
	RTI				  ; 40 | Return from interrupt
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FA70,X		  ; FE 70 FA | Increment (absolute,X)
	BEQ $10			  ; F0 10 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	SBC $71FE,Y		  ; F9 FE 71 | Subtract with carry (absolute,Y)
	INC $FA07,X		  ; FE 07 FA | Increment (absolute,X)
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	AND #$B6			 ; 29 B6 | Logical AND with accumulator (immediate)
	BVC $D9			  ; 50 D9 | Branch if overflow clear
	ADC $26D9,Y		  ; 79 D9 26 | Add with carry (absolute,Y)
	LSR $29			  ; 46 29 | Logical shift right (zero page)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BNE $A0			  ; D0 A0 | Branch if not equal
	BCS $E0			  ; B0 E0 | Game work RAM access
	BCS $40			  ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_04F
; Address: $F7A0C7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_04F:
	JSR $8040			; 20 40 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $09			  ; 80 09 | Branch always
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_050
; Address: $F7A0F1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_050:
	ORA #$39			 ; 09 39 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $1C02			; 0E 02 1C | Arithmetic shift left (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	CMP $1903			; CD 03 19 | Compare accumulator (absolute)
	ASL $0E93			; 0E 93 0E | Arithmetic shift left (absolute)
	BMI $3B			  ; 30 3B | Branch if negative
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_051
; Address: $F7A122
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_051:
	JSR $0616			; 20 16 06 | Jump to subroutine
	ORA $1609,Y		  ; 19 09 16 | Logical OR with accumulator (absolute,Y)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA $360F,Y		  ; 19 0F 36 | Logical OR with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_052
; Address: $F7A13E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_052:
	JSR $471F			; 20 1F 47 | Jump to subroutine
	CMP #$5F			 ; C9 5F | Compare accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_053
; Address: $F7A14D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_053:
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	BCC $80			  ; 90 80 | Branch if carry clear
	BMI $0F			  ; 30 0F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_054
; Address: $F7A155
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_054:
	STA				  ; 9F 70 CF 7C | Store accumulator to absolute long,X
	JMP $977CA3		  ; 5C A3 7C 97 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	INC $FC			  ; E6 FC | Increment (zero page)
	CPX $F3A3			; EC A3 F3 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_055
; Address: $F7A16A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_055:
	JSL $37FEF2		  ; 22 F2 FE 37 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	STX $831C			; 8E 1C 83 | Store X register to absolute address
	BIT #$0E			 ; 89 0E | Test bits in accumulator (immediate)
	CPY $CDCB			; CC CB CD | Compare Y register (absolute)
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	INC $40			  ; E6 40 | Increment (zero page)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $40			  ; 30 40 | Branch if negative
	BVC $90			  ; 50 90 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_056
; Address: $F7A18C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_056:
	JSR $6068			; 20 68 60 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_057
; Address: $F7A196
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_057:
	BVS $C0			  ; 70 C0 | Branch if overflow set
	BVS $A0			  ; 70 A0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_058
; Address: $F7A19C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_058:
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ORA ($8F),Y		  ; 11 8F | Logical OR with accumulator ((zero page),Y)
	STA $603030		  ; 8F 30 30 60 | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_059
; Address: $F7A1CA
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_059:
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_05A
; Address: $F7A1CD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_05A:
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	STA $CF3070		  ; 8F 70 30 CF | Store accumulator to absolute long address
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $D8			  ; 30 D8 | Branch if negative
	BEQ $1F			  ; F0 1F | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_05C
; Address: $F7A202
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_05C:
	JSR $3000			; 20 00 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ADC $00F0,Y		  ; 79 F0 00 | Add with carry (absolute,Y)
	ADC $BFC0,Y		  ; 79 C0 BF | Add with carry (absolute,Y)
	BEQ $BF			  ; F0 BF | Branch if equal
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_05E
; Address: $F7A217
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_05E:
	ADC $00CF,Y		  ; 79 CF 00 | Add with carry (absolute,Y)
	STX $C0			  ; 86 C0 | Store X register to zero page
	BPL $90			  ; 10 90 | Branch if positive
	ORA $0099,Y		  ; 19 99 00 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	SBC ($3E,X)		  ; E1 3E | Subtract with carry ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_05F
; Address: $F7A234
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_05F:
	BRA $60			  ; 80 60 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	ROL $1F00,X		  ; 3E 00 1F | Rotate left (absolute,X)
	ROL $928C,X		  ; 3E 8C 92 | Rotate left (absolute,X)
	BRA $9C			  ; 80 9C | Branch always
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_061
; Address: $F7A262
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_061:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $060A			; 0E 0A 06 | Arithmetic shift left (absolute)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	BRA $83			  ; 80 83 | Branch always
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_062
; Address: $F7A272
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_062:
	INC $9A18,X		  ; FE 18 9A | Increment (absolute,X)
	ASL $06A9			; 0E A9 06 | Arithmetic shift left (absolute)
	CMP $C407			; CD 07 C4 | Compare accumulator (absolute)
	JMP $0083			; 4C 83 00 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $273D,X		  ; 1D 3D 27 | Logical OR with accumulator (absolute,X)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	ASL $E9E9,X		  ; 1E E9 E9 | Arithmetic shift left (absolute,X)
	ASL $C1DF,X		  ; 1E DF C1 | Arithmetic shift left (absolute,X)
	DEC $D9E7,X		  ; DE E7 D9 | Decrement (absolute,X)
	STX $7E			  ; 86 7E | Store X register to zero page
	BMI $1F			  ; 30 1F | Branch if negative
	CMP $E9E7,Y		  ; D9 E7 E9 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_063
; Address: $F7A2D7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_063:
	JSR $013E			; 20 3E 01 | Jump to subroutine
	AND $3726,Y		  ; 39 26 37 | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ROR $9FE1,X		  ; 7E E1 9F | Rotate right (absolute,X)
	BCC $4B			  ; 90 4B | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	ORA $C7A3,X		  ; 1D A3 C7 | Logical OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $8717			; EC 17 87 | Compare X register (absolute)
	SEP #$7F			 ; E2 7F | Set processor status bits

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_064
; Address: $F7A2FC
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_064:
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	CMP ($39),Y		  ; D1 39 | Compare accumulator ((zero page),Y)
	ROR $FB14,X		  ; 7E 14 FB | Rotate right (absolute,X)
	ROR $FCE5,X		  ; 7E E5 FC | Rotate right (absolute,X)
	CMP $F3F3			; CD F3 F3 | Compare accumulator (absolute)
	STY $216C			; 8C 6C 21 | PPU graphics register access
	INC $66			  ; E6 66 | Increment (zero page)
	SBC $F8E7,Y		  ; F9 E7 F8 | Subtract with carry (absolute,Y)
	CMP #$F6			 ; C9 F6 | Compare accumulator (immediate)
	STA $33E7,Y		  ; 99 E7 33 | Store accumulator to absolute,Y
	DEC $FC0F			; CE 0F FC | Decrement (absolute)
	STY $7B08			; 8C 08 7B | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	STA $61EC93		  ; 8F 93 EC 61 | Store accumulator to absolute long address
	ROR $70FC,X		  ; 7E FC 70 | Rotate right (absolute,X)
	STY $97			  ; 84 97 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$F40C		   ; F4 0C F4 | Push effective address to stack
	ROR $0087,X		  ; 7E 87 00 | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDY $66E4,X		  ; BC E4 66 | Load from absolute,X into Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	DEC $E9E9,X		  ; DE E9 E9 | Decrement (absolute,X)
	ASL $C1DF,X		  ; 1E DF C1 | Arithmetic shift left (absolute,X)
	INC $F1DE,X		  ; FE DE F1 | Increment (absolute,X)
	CMP #$37			 ; C9 37 | Compare accumulator (immediate)
	STX $7E			  ; 86 7E | Store X register to zero page
	ASL $21DF			; 0E DF 21 | PPU graphics register access
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_065
; Address: $F7A377
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_065:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	BMI $2F			  ; 30 2F | Branch if negative
	BEQ $7E			  ; F0 7E | Branch if equal
	SBC ($93,X)		  ; E1 93 | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	STZ $706B			; 9C 6B 70 | Store zero to absolute
	LDA $80BFC0		  ; AF C0 BF 80 | Load from absolute long address into accumulator
	BRA $FF			  ; 80 FF | Branch always
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_066
; Address: $F7A3A5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_066:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $2990,Y		  ; 19 90 29 | Logical OR with accumulator (absolute,Y)
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	INC $66			  ; E6 66 | Increment (zero page)
	CMP $6619,Y		  ; D9 19 66 | Compare accumulator (absolute,Y)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $3F			  ; 10 3F | Branch if positive
	STY $9E			  ; 84 9E | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	JMP $607820		  ; 5C 20 78 60 | Jump to address long
	BCS $80			  ; B0 80 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_067
; Address: $F7A3EA
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_067:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	ASL $0CA0			; 0E A0 0C | Arithmetic shift left (absolute)
	BRA $08			  ; 80 08 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $1C0C			; 0E 0C 1C | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1E0E,X		  ; 1D 0E 1E | Logical OR with accumulator (absolute,X)
	ASL $3618,X		  ; 1E 18 36 | Arithmetic shift left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC $18F0,X		  ; FD F0 18 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $1F98,X		  ; FE 98 1F | Increment (absolute,X)
	ASL $1F73			; 0E 73 1F | Arithmetic shift left (absolute)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ROL $B8B8,X		  ; 3E B8 B8 | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_068
; Address: $F7A447
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_068:
	PHA				  ; 48 | Push accumulator to stack
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	STX $0688			; 8E 88 06 | Store X register to absolute address
	AND $3FC7,X		  ; 3D C7 3F | Logical AND with accumulator (absolute,X)
	INC $B8FE,X		  ; FE FE B8 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	INC $7AC4,X		  ; FE C4 7A | Increment (absolute,X)
	STY $D9			  ; 84 D9 | Store Y register to zero page
	STX $06D9			; 8E D9 06 | Store X register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	STZ $58			  ; 64 58 | Store zero to zero page
	ORA $6F07,Y		  ; 19 07 6F | Logical OR with accumulator (absolute,Y)
	BIT $12			  ; 24 12 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $CB94			; EC 94 CB | Compare X register (absolute)
	STY $C689			; 8C 89 C6 | Store Y register to absolute address
	CMP $E0CF			; CD CF E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $CF			  ; 80 CF | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	STA $E700,Y		  ; 99 00 E7 | Store accumulator to absolute,Y
	BRA $7E			  ; 80 7E | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_069
; Address: $F7A4C8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_069:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	AND #$D3			 ; 29 D3 | Logical AND with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	AND ($91),Y		  ; 31 91 | Logical AND with accumulator ((zero page),Y)
	SBC #$B3			 ; E9 B3 | Subtract with carry (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	CPY #$03			 ; C0 03 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_06A
; Address: $F7A515
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_06A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($E4,X)		  ; 01 E4 | Logical OR with accumulator ((zero page,X))
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	SEP #$3C			 ; E2 3C | Set processor status bits
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	INC $1800,X		  ; FE 00 18 | Increment (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_06B
; Address: $F7A535
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_06B:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $08			  ; 80 08 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	CPX $CB94			; EC 94 CB | Compare X register (absolute)
	STY $C689			; 8C 89 C6 | Store Y register to absolute address
	CMP $E0CF			; CD CF E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $8F			  ; 80 8F | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0F0F,Y		  ; 19 0F 0F | Logical OR with accumulator (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROL $6722			; 2E 22 67 | Rotate left (absolute)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROL $6788			; 2E 88 67 | Rotate left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_06C
; Address: $F7A5D6
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_06C:
	INC $CFC1			; EE C1 CF | Increment (absolute)
	CPY $C9			  ; C4 C9 | Compare Y register (zero page)
	STZ $03			  ; 64 03 | Store zero to zero page
	ASL $FF03,X		  ; 1E 03 FF | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	BEQ $90			  ; F0 90 | Branch if equal
	SBC $FED9,Y		  ; F9 D9 FE | Subtract with carry (absolute,Y)
	ASL $04FC			; 0E FC 04 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $1FF3,X		  ; 1E F3 1F | Arithmetic shift left (absolute,X)
	SBC ($9F),Y		  ; F1 9F | Subtract with carry ((zero page),Y)
	BEQ $DF			  ; F0 DF | Branch if equal
	SBC $FE0F,Y		  ; F9 0F FE | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_06F
; Address: $F7A63C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_06F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_070
; Address: $F7A663
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_070:
	BRA $70			  ; 80 70 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_073
; Address: $F7A672
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_073:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_074
; Address: $F7A678
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_074:
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	AND $3906,Y		  ; 39 06 39 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_075
; Address: $F7A680
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_075:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BPL $E0			  ; 10 E0 | Game work RAM access
	BMI $80			  ; 30 80 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_076
; Address: $F7A688
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_076:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $80			  ; 30 80 | Branch if negative
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_078
; Address: $F7A69D
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_078:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	LDX $FF1E,Y		  ; BE 1E FF | Load from absolute,Y into X register
	SBC $F07B,X		  ; FD 7B F0 | Subtract with carry (absolute,X)
	BEQ $D9			  ; F0 D9 | Branch if equal
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BPL $10			  ; 10 10 | Branch if positive
	BCS $80			  ; B0 80 | Branch if carry set
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	AND $7000,Y		  ; 39 00 70 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	INC $FF7E,X		  ; FE 7E FF | Increment (absolute,X)
	SBC $FAF7,X		  ; FD F7 FA | Subtract with carry (absolute,X)
	CMP ($FB),Y		  ; D1 FB | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_079
; Address: $F7A732
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_079:
	JSR $0078			; 20 78 00 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	ASL $1F01			; 0E 01 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_07A
; Address: $F7A73E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_07A:
	JSR $003B			; 20 3B 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_07B
; Address: $F7A783
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_07B:
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	LDY $E8F7,X		  ; BC F7 E8 | Load from absolute,X into Y register
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	AND $6030,X		  ; 3D 30 60 | Logical AND with accumulator (absolute,X)
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	STA $001C90		  ; 8F 90 1C 00 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STZ $0408			; 9C 08 04 | Store zero to absolute
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $0404			; 0D 04 04 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_07D
; Address: $F7A7F6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_07D:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ADC $0F08,X		  ; 7D 08 0F | Add with carry (absolute,X)
	ORA $0C1F			; 0D 1F 0C | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA $71			  ; 05 71 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_07E
; Address: $F7A81B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_07E:
	SEI				  ; 78 | Set interrupt disable flag
	ROR $1F02,X		  ; 7E 02 1F | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_07F
; Address: $F7A82C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_07F:
	BRA $F0			  ; 80 F0 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_082
; Address: $F7A83C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_082:
	JSR $4030			; 20 30 40 | Jump to subroutine
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0107			; 0E 07 01 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1631,X		  ; 1E 31 16 | Arithmetic shift left (absolute,X)
	AND $AF09,Y		  ; 39 09 AF | Logical AND with accumulator (absolute,Y)
	LDY #$E6			 ; A0 E6 | Load immediate value into Y register
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ASL $5F			  ; 06 5F | Arithmetic shift left (zero page)
	BCS $3F			  ; B0 3F | Branch if carry set
	ADC $3907,Y		  ; 79 07 39 | Add with carry (absolute,Y)
	AND $8010,Y		  ; 39 10 80 | Logical AND with accumulator (absolute,Y)
	ORA $09C0,Y		  ; 19 C0 09 | Logical OR with accumulator (absolute,Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $90			  ; 10 90 | Branch if positive
	ORA $8019,Y		  ; 19 19 80 | Logical OR with accumulator (absolute,Y)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	LSR $7658,X		  ; 5E 58 76 | Logical shift right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	ASL $3688,X		  ; 1E 88 36 | Arithmetic shift left (absolute,X)
	BMI $08			  ; 30 08 | Branch if negative
	BRA $98			  ; 80 98 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	AND #$5F			 ; 29 5F | Logical AND with accumulator (immediate)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	BVS $20			  ; 70 20 | Branch if overflow set
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP ($E0,X)		  ; C1 E0 | Game work RAM access
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_083
; Address: $F7A8C3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_083:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	AND ($23,X)		  ; 21 23 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_084
; Address: $F7A8F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_084:
	JSR $E0E0			; 20 E0 E0 | Game work RAM access
	CMP $EA17,X		  ; DD 17 EA | Compare accumulator (absolute,X)
	BNE $F9			  ; D0 F9 | Branch if not equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_085
; Address: $F7A905
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_085:
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	AND $7040,Y		  ; 39 40 70 | Logical AND with accumulator (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_086
; Address: $F7A919
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_086:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F02			; 0D 02 0F | Logical OR with accumulator (absolute)
	ASL $1B			  ; 06 1B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_088
; Address: $F7A959
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_088:
	PHP				  ; 08 | Push processor status to stack
	CPX $3CF8			; EC F8 3C | Compare X register (absolute)
	NOP				  ; EA | No operation
	BNE $F8			  ; D0 F8 | Branch if not equal
	BNE $F8			  ; D0 F8 | Branch if not equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_089
; Address: $F7A966
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_089:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_08A
; Address: $F7A972
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_08A:
	JSR $4038			; 20 38 40 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BPL $38			  ; 10 38 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_08C
; Address: $F7A995
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_08C:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_08D
; Address: $F7A9BC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_08D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $0C			  ; 30 0C | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_08E
; Address: $F7AA0A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_08E:
	JSR $F8F0			; 20 F0 F8 | Jump to subroutine
	BMI $D8			  ; 30 D8 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_08F
; Address: $F7AA1D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_08F:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$46			 ; E0 46 | Compare X register (immediate)
	ADC $30FF,Y		  ; 79 FF 30 | Add with carry (absolute,Y)
	EOR $0929,Y		  ; 59 29 09 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_090
; Address: $F7AA28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_090:
	JSR $0616			; 20 16 06 | Jump to subroutine
	ORA $1609,Y		  ; 19 09 16 | Logical OR with accumulator (absolute,Y)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_091
; Address: $F7AA30
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_091:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_092
; Address: $F7AA40
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_092:
	JSR $E0B0			; 20 B0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_093
; Address: $F7AA6E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_093:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	BPL $18			  ; 10 18 | Branch if positive
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $40			  ; 30 40 | Branch if negative
	BVC $90			  ; 50 90 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_094
; Address: $F7AAAC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_094:
	JSR $6068			; 20 68 60 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	BVS $A0			  ; 70 A0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_095
; Address: $F7AABC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_095:
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	BPL $30			  ; 10 30 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $18			  ; 10 18 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_096
; Address: $F7AADC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_096:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $F1			  ; 80 F1 | Branch always
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page
	ASL $1A04			; 0E 04 1A | Arithmetic shift left (absolute)
	BPL $64			  ; 10 64 | Branch if positive
	BMI $58			  ; 30 58 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BNE $38			  ; D0 38 | Branch if not equal
	BCC $78			  ; 90 78 | Branch if carry clear
	BPL $F8			  ; 10 F8 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BEQ $7C			  ; F0 7C | Branch if equal
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	CPY $F0F0			; CC F0 F0 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_097
; Address: $F7AB70
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_097:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BEQ $98			  ; F0 98 | Branch if equal
	CPX $30			  ; E4 30 | Compare X register (zero page)
	CPY $F000			; CC 00 F0 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA $160F,Y		  ; 19 0F 16 | Logical OR with accumulator (absolute,Y)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_098
; Address: $F7ABA3
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_098:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1D37			; 0E 37 1D | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA $0231,Y		  ; 19 31 02 | Logical OR with accumulator (absolute,Y)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_099
; Address: $F7ABF5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_099:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $1E0C			; 0E 0C 1E | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $3A0C,X		  ; 3E 0C 3A | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ROL $24			  ; 26 24 | Rotate left (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $9C00			; CC 00 9C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_09A
; Address: $F7AC78
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_09A:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_09E
; Address: $F7ACBC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_09E:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $38			  ; 30 38 | Branch if negative
	ADC $3E1A,X		  ; 7D 1A 3E | Add with carry (absolute,X)
	ORA $0F3F,X		  ; 1D 3F 0F | Logical OR with accumulator (absolute,X)
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	ROL $1E00,X		  ; 3E 00 1E | Rotate left (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_09F
; Address: $F7ACE2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_09F:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $A0			  ; 70 A0 | Branch if overflow set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A2
; Address: $F7ACFB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A2:
	JSR $9080			; 20 80 90 | Jump to subroutine
	BRA $3A			  ; 80 3A | Branch always
	PHY				  ; 5A | Push Y register to stack
	INC $DE24,X		  ; FE 24 DE | Increment (absolute,X)
	ASL $2220,X		  ; 1E 20 22 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A3
; Address: $F7AD17
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A3:
	DEC $60			  ; C6 60 | Decrement (zero page)
	DEC $E0			  ; C6 E0 | Game work RAM access
	INC $3C			  ; E6 3C | Increment (zero page)
	DEC $EA17,X		  ; DE 17 EA | Decrement (absolute,X)
	BMI $7E			  ; 30 7E | Branch if negative
	INC $FC68,X		  ; FE 68 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A4
; Address: $F7AD2C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A4:
	JSR $1420			; 20 20 14 | Jump to subroutine
	ROR $40			  ; 66 40 | Rotate right (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $4C00			; CC 00 4C | Compare Y register (absolute)
	CPX #$EC			 ; E0 EC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A5
; Address: $F7AD3F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A5:
	NOP				  ; EA | No operation
	CLC				  ; 18 | Clear carry flag
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A6
; Address: $F7AD44
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A6:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A7
; Address: $F7AD4C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A7:
	JSR $1420			; 20 20 14 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BPL $18			  ; 10 18 | Branch if positive
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A8
; Address: $F7AD83
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A8:
	BVS $09			  ; 70 09 | Branch if overflow set
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	DEC $DF			  ; C6 DF | Decrement (zero page)
	BCS $BF			  ; B0 BF | Branch if carry set
	ADC $F669,Y		  ; 79 69 F6 | Add with carry (absolute,Y)
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	ADC $0610,Y		  ; 79 10 06 | Add with carry (absolute,Y)
	BIT #$40			 ; 89 40 | Test bits in accumulator (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $99			  ; 90 99 | Branch if carry clear
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC $F120,X		  ; DE 20 F1 | Decrement (absolute,X)
	ROL $D2BC,X		  ; 3E BC D2 | Rotate left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CPX $F860			; EC 60 F8 | Compare X register (absolute)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ASL $0F20,X		  ; 1E 20 0F | Arithmetic shift left (absolute,X)
	ROL $92AC,X		  ; 3E AC 92 | Rotate left (absolute,X)
	BCC $8C			  ; 90 8C | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $C0			  ; 70 C0 | Branch if overflow set
	EOR $A9A0,Y		  ; 59 A0 A9 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0A9
; Address: $F7ADE6
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0A9:
	SBC $B6FF,Y		  ; F9 FF B6 | Subtract with carry (absolute,Y)
	DEC $BF			  ; C6 BF | Decrement (zero page)
	LSR $5F			  ; 46 5F | Logical shift right (zero page)
	BEQ $7F			  ; F0 7F | Branch if equal
	SBC $E010,Y		  ; F9 10 E0 | Game work RAM access
	ADC #$B0			 ; 69 B0 | Add with carry (immediate)
	BCC $7F			  ; 90 7F | Branch if carry clear
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	ORA $E019,Y		  ; 19 19 E0 | Game work RAM access
	BMI $A0			  ; 30 A0 | Branch if negative
	BVC $5E			  ; 50 5E | Branch if overflow clear
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	INC $32DC,X		  ; FE DC 32 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $F8E0			; 2C E0 F8 | Test bits in accumulator (absolute)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $70			  ; 80 70 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AA
; Address: $F7AE13
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AA:
	BNE $9E			  ; D0 9E | Branch if not equal
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	ROL $320C,X		  ; 3E 0C 32 | Rotate left (absolute,X)
	BPL $0C			  ; 10 0C | Branch if positive
	BRA $88			  ; 80 88 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BPL $F8			  ; 10 F8 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	BMI $D8			  ; 30 D8 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND #$28			 ; 29 28 | Logical AND with accumulator (immediate)
	STA $00008F		  ; 8F 8F 00 00 | Store accumulator to absolute long address
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AB
; Address: $F7AE9E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AB:
	STA $000070		  ; 8F 70 00 00 | Store accumulator to absolute long address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AC
; Address: $F7AEC9
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AC:
	JSR $9090			; 20 90 90 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BCC $6F			  ; 90 6F | Branch if carry clear
	BEQ $10			  ; F0 10 | Branch if equal
	BVC $D9			  ; 50 D9 | Branch if overflow clear
	EOR $66F9,Y		  ; 59 F9 66 | Exclusive OR with accumulator (absolute,Y)
	DEC $29			  ; C6 29 | Decrement (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $A0			  ; 06 A0 | Arithmetic shift left (zero page)
	BCS $A0			  ; B0 A0 | Branch if carry set
	BEQ $60			  ; F0 60 | Branch if equal
	BMI $40			  ; 30 40 | Branch if negative
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ADC #$F6			 ; 69 F6 | Add with carry (immediate)
	BVC $D9			  ; 50 D9 | Branch if overflow clear
	ORA $2679,Y		  ; 19 79 26 | Logical OR with accumulator (absolute,Y)
	ASL $29			  ; 06 29 | Arithmetic shift left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AD
; Address: $F7AF61
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AD:
	BEQ $C0			  ; F0 C0 | Branch if equal
	BNE $80			  ; D0 80 | Branch if not equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AE
; Address: $F7AF72
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0AF
; Address: $F7AFAA
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0AF:
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	BPL $35			  ; 10 35 | Branch if positive
	AND $D300			; 2D 00 D3 | Logical AND with accumulator (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA $1F0A,X		  ; 1D 0A 1F | Logical OR with accumulator (absolute,X)
	ORA $0A3F			; 0D 3F 0A | Logical OR with accumulator (absolute)
	BIT $3033			; 2C 33 30 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0B1
; Address: $F7AFE9
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0B1:
	BVC $60			  ; 50 60 | Branch if overflow clear
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BCS $53			  ; B0 53 | Branch if carry set
	BMI $CF			  ; 30 CF | Branch if negative
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $D8			  ; 30 D8 | Branch if negative
	LDA $F01FF0		  ; AF F0 1F F0 | Load from absolute long address into accumulator
	LDY $0000			; AC 00 00 | Load from absolute address into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	JMP $C4CC			; 4C CC C4 | Jump to address
	SBC $0407			; ED 07 04 | Subtract with carry (absolute)
	ASL $0C01			; 0E 01 0C | Arithmetic shift left (absolute)
	ASL $3F09,X		  ; 1E 09 3F | Arithmetic shift left (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0B3
; Address: $F7B044
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0B3:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 9F C8 C8 | Store accumulator to absolute long,X
	BVS $20			  ; 70 20 | Branch if overflow set
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0B7
; Address: $F7B066
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0B7:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0B8
; Address: $F7B083
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0B8:
	JSR $3C17			; 20 17 3C | Jump to subroutine
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $0B			  ; 30 0B | Branch if negative
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPY $8003			; CC 03 80 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0B9
; Address: $F7B0A0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0B9:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BPL $A0			  ; 10 A0 | Branch if positive
	BEQ $7E			  ; F0 7E | Branch if equal
	SBC ($1E),Y		  ; F1 1E | Subtract with carry ((zero page),Y)
	INC $EC79			; EE 79 EC | Increment (absolute)
	INC $7EB4,X		  ; FE B4 7E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0BA
; Address: $F7B0B0
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0BA:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BMI $40			  ; 30 40 | Branch if negative
	BEQ $9E			  ; F0 9E | Branch if equal
	ASL $4946,X		  ; 1E 46 49 | Arithmetic shift left (absolute,X)
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $0C03			; 0D 03 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BPL $F8			  ; 10 F8 | Branch if positive
	BNE $38			  ; D0 38 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	INX				  ; E8 | Increment X register
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0BC
; Address: $F7B105
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0BC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $253D			; 0D 3D 25 | Logical OR with accumulator (absolute)
	ADC $67			  ; 65 67 | Add with carry (zero page)
	INC $7E			  ; E6 7E | Increment (zero page)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	DEC $E9E9,X		  ; DE E9 E9 | Decrement (absolute,X)
	ASL $C1DF,X		  ; 1E DF C1 | Arithmetic shift left (absolute,X)
	INC $F1DE,X		  ; FE DE F1 | Increment (absolute,X)
	SBC #$37			 ; E9 37 | Subtract with carry (immediate)
	ROR $DE			  ; 66 DE | Rotate right (zero page)
	ASL $21DF			; 0E DF 21 | PPU graphics register access
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0BD
; Address: $F7B137
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0BD:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	BMI $0F			  ; 30 0F | Branch if negative
	BEQ $BE			  ; F0 BE | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $83F1,X		  ; 3E F1 83 | Rotate left (absolute,X)
	EOR $0133,X		  ; 5D 33 01 | Exclusive OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BRA $A6			  ; 80 A6 | Branch always
	ADC ($7D,X)		  ; 61 7D | Add with carry ((zero page,X))
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	ASL $81DF,X		  ; 1E DF 81 | Arithmetic shift left (absolute,X)
	INC $F15E,X		  ; FE 5E F1 | Increment (absolute,X)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	INC $DE			  ; E6 DE | Increment (zero page)
	EOR $827D,Y		  ; 59 7D 82 | Exclusive OR with accumulator (absolute,Y)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0BE
; Address: $F7B177
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0BE:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	LDA $F0CFB0		  ; AF B0 CF F0 | Load from absolute long address into accumulator
	ROL $8EC1,X		  ; 3E C1 8E | Rotate left (absolute,X)
	STX $0701			; 8E 01 07 | Store X register to absolute address
	LDA				  ; BF DF E7 0F | Load from absolute long,X into accumulator
	INY				  ; C8 | Increment Y register
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	STA $F90E71		  ; 8F 71 0E F9 | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0BF
; Address: $F7B198
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0BF:
	JSR $F0FF			; 20 FF F0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C0
; Address: $F7B1A0
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C0:
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $37F7,Y		  ; 79 F7 37 | Add with carry (absolute,Y)
	STA $3D4E7B		  ; 8F 7B 4E 3D | Store accumulator to absolute long address
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0601			; 0D 01 06 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA ($BD),Y		  ; B1 BD | Load from (zero page),Y into accumulator
	EOR #$C9			 ; 49 C9 | Exclusive OR with accumulator (immediate)
	STZ $60DF,X		  ; 9E DF 60 | Store zero to absolute,X
	INC $E9F1,X		  ; FE F1 E9 | Increment (absolute,X)
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	LDA $42BD			; AD BD 42 | Hardware register operation
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C1
; Address: $F7B1D7
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C1:
	JSR $809F			; 20 9F 80 | Jump to subroutine
	BEQ $AF			  ; F0 AF | Branch if equal
	BVC $1E			  ; 50 1E | Branch if overflow clear
	CMP ($9F,X)		  ; C1 9F | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	BRA $77			  ; 80 77 | Branch always
	STA				  ; 9F 2F 33 C7 | Store accumulator to absolute long,X
	INY				  ; C8 | Increment Y register
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BNE $FF			  ; D0 FF | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BIT $23EC			; 2C EC 23 | Test bits in accumulator (absolute)
	BRA $0C			  ; 80 0C | Branch always
	BNE $DC			  ; D0 DC | Branch if not equal
	BPL $38			  ; 10 38 | Branch if positive
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C2
; Address: $F7B226
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C2:
	JSR $80C0			; 20 C0 80 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C3
; Address: $F7B230
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C3:
	JSR $C004			; 20 04 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0C0A			; 0E 0A 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C4
; Address: $F7B24B
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C4:
	STZ $F8			  ; 64 F8 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	STA $068F04		  ; 8F 04 8F 06 | Store accumulator to absolute long address
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	ASL $0CF2			; 0E F2 0C | Arithmetic shift left (absolute)
	INC $7C			  ; E6 7C | Increment (zero page)
	CPY $3CF8			; CC F8 3C | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ADC $5EF7,Y		  ; 79 F7 5E | Add with carry (absolute,Y)
	AND $1F23,Y		  ; 39 23 1F | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BIT $12			  ; 24 12 | Test bits in accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	PHB				  ; 8B | Push data bank register to stack
	BIT #$46			 ; 89 46 | Test bits in accumulator (immediate)
	SBC $E0CF			; ED CF E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $99			  ; 80 99 | Branch always
	BRA $7E			  ; 80 7E | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C5
; Address: $F7B2C6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C5:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ROL $181D			; 2E 1D 18 | Rotate left (absolute)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $CC			  ; 30 CC | Branch if negative
	PLB				  ; AB | Pull data bank register from stack
	LDA $6040F0		  ; AF F0 40 60 | Load from absolute long address into accumulator
	BRA $40			  ; 80 40 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $80			  ; 30 80 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C7
; Address: $F7B320
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C7:
	BRA $99			  ; 80 99 | Branch always
	BRA $7E			  ; 80 7E | Branch always
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0C9
; Address: $F7B367
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0C9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0CA
; Address: $F7B377
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0CA:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	STZ $3C			  ; 64 3C | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STY $3E			  ; 84 3E | Store Y register to zero page
	BMI $07			  ; 30 07 | Branch if negative
	ASL $467F,X		  ; 1E 7F 46 | Arithmetic shift left (absolute,X)
	SBC $8738,X		  ; FD 38 87 | Subtract with carry (absolute,X)
	SBC ($3E),Y		  ; F1 3E | Subtract with carry ((zero page),Y)
	ASL $7E03,X		  ; 1E 03 7E | Arithmetic shift left (absolute,X)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	BRA $7F			  ; 80 7F | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	STZ $4E08,X		  ; 9E 08 4E | Store zero to absolute,X
	ASL $87			  ; 06 87 | Arithmetic shift left (zero page)
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	STA ($43,X)		  ; 81 43 | Store accumulator to (zero page,X)
	STA ($41,X)		  ; 81 41 | Store accumulator to (zero page,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0CB
; Address: $F7B3F6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0CB:
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0CC
; Address: $F7B41A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0CC:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0CD
; Address: $F7B42F
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0CD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	ASL $0702			; 0E 02 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 9E 7F 41 | Store accumulator to absolute long,X
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $C19F,X		  ; FE 9F C1 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	STZ $20			  ; 64 20 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	ASL $070A			; 0E 0A 07 | Arithmetic shift left (absolute)
	ORA $13			  ; 05 13 | Logical OR with accumulator (zero page)
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BMI $BB			  ; 30 BB | Branch if negative
	STZ $EF			  ; 64 EF | Store zero to zero page
	ASL $070D			; 0E 0D 07 | Arithmetic shift left (absolute)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BRA $FF			  ; 80 FF | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0CE
; Address: $F7B4AE
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0CE:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($F8,X)		  ; C1 F8 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP ($51),Y		  ; D1 51 | Compare accumulator ((zero page),Y)
	SBC $3BE0,Y		  ; F9 E0 3B | Subtract with carry (absolute,Y)
	BMI $1F			  ; 30 1F | Branch if negative
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ADC ($C0),Y		  ; 71 C0 | Add with carry ((zero page),Y)
	CMP ($E6),Y		  ; D1 E6 | Compare accumulator ((zero page),Y)
	SBC $3BF4,Y		  ; F9 F4 3B | Subtract with carry (absolute,Y)
	STA				  ; 9F 06 4C 80 | Store accumulator to absolute long,X
	DEC $80			  ; C6 80 | Decrement (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $0C01			; 0E 01 0C | Arithmetic shift left (absolute)
	ASL $3F09,X		  ; 1E 09 3F | Arithmetic shift left (absolute,X)
	BCC $90			  ; 90 90 | Branch if carry clear
	BPL $27			  ; 10 27 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D0
; Address: $F7B54A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D0:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BCC $6F			  ; 90 6F | Branch if carry clear
	BEQ $10			  ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D4
; Address: $F7B55D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D4:
	LDA				  ; BF D3 2C 00 | Load from absolute long,X into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D5
; Address: $F7B585
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D5:
	JSR $9093			; 20 93 90 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $130E			; 0E 0E 13 | Arithmetic shift left (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BCC $6F			  ; 90 6F | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $10F1			; 0E F1 10 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $3C0D,X		  ; 1E 0D 3C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $904C			; 4C 4C 90 | Jump to address
	BCC $67			  ; 90 67 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D6
; Address: $F7B60D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D6:
	BPL $E8			  ; 10 E8 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D8
; Address: $F7B61B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D8:
	STA				  ; 9F 10 EF 08 | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	DEC $E9E9,X		  ; DE E9 E9 | Decrement (absolute,X)
	ASL $01DF,X		  ; 1E DF 01 | Arithmetic shift left (absolute,X)
	ROR $F14E,X		  ; 7E 4E F1 | Rotate right (absolute,X)
	SBC $7CE3,X		  ; FD E3 7C | Subtract with carry (absolute,X)
	ASL $21DF			; 0E DF 21 | PPU graphics register access
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0D9
; Address: $F7B657
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0D9:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	ORA $8C02,X		  ; 1D 02 8C | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $C4CC			; 4C CC C4 | Jump to address
	SBC $5240			; ED 40 52 | Subtract with carry (absolute)
	LDA ($BD),Y		  ; B1 BD | Load from (zero page),Y into accumulator
	EOR #$C9			 ; 49 C9 | Exclusive OR with accumulator (immediate)
	ASL $60DF,X		  ; 1E DF 60 | Arithmetic shift left (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDA $42BD			; AD BD 42 | Hardware register operation
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0DA
; Address: $F7B69D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0DA:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	STA				  ; 9F 9F C8 C8 | Store accumulator to absolute long,X
	BVS $9F			  ; 70 9F | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	BRA $7F			  ; 80 7F | Branch always
	STA $D8609F		  ; 8F 9F 60 D8 | Store accumulator to absolute long address
	BEQ $8F			  ; F0 8F | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ASL $043E			; 0E 3E 04 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	PHY				  ; 5A | Push Y register to stack
	PLX				  ; FA | Pull X register from stack
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0DB
; Address: $F7B6D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0DB:
	ORA $3E			  ; 05 3E | Logical OR with accumulator (zero page)
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	INC $FF05,X		  ; FE 05 FF | Increment (absolute,X)
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0DD
; Address: $F7B6E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0DD:
	JSR $6060			; 20 60 60 | Jump to subroutine
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $48488F		  ; 8F 8F 48 48 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0DE
; Address: $F7B6F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0DE:
	JSR $C0DF			; 20 DF C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 20 DF 60 | Load from absolute long,X into accumulator
	STA				  ; 9F 90 6F 8F | Store accumulator to absolute long,X
	BVS $C8			  ; 70 C8 | Branch if overflow set
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E0
; Address: $F7B70E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E0:
	ROR $04E7			; 6E E7 04 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	JMP ($EC6C)		  ; 6C 6C EC | Jump to address (absolute indirect)
	EOR $295C,X		  ; 5D 5C 29 | Exclusive OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDY $7CAC			; AC AC 7C | Load from absolute address into Y register
	ADC $2AF5			; 6D F5 2A | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	INC $0B0E,X		  ; FE 0E 0B | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $DF			  ; 30 DF | Branch if negative
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E4
; Address: $F7B770
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E4:
	ASL $08F1			; 0E F1 08 | Arithmetic shift left (absolute)
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 20 DF 20 | Load from absolute long,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E5
; Address: $F7B77F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E5:
	STA				  ; 9F 01 03 02 | Store accumulator to absolute long,X
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	DEC $DDE8			; CE E8 DD | Decrement (absolute)
	SBC ($98,X)		  ; E1 98 | Subtract with carry ((zero page,X))
	LDA $F1A3,Y		  ; B9 A3 F1 | Load from absolute,Y into accumulator
	SEP #$F1			 ; E2 F1 | Set processor status bits
	SBC $F831,Y		  ; F9 31 F8 | Subtract with carry (absolute,Y)
	AND $3C11,X		  ; 3D 11 3C | Logical AND with accumulator (absolute,X)
	BPL $78			  ; 10 78 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E6
; Address: $F7B7B6
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E6:
	JSR $4078			; 20 78 40 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BRA $99			  ; 80 99 | Branch always
	INC $E090,X		  ; FE 90 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	PLB				  ; AB | Pull data bank register from stack
	NOP				  ; EA | No operation
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA $1A4D,Y		  ; 19 4D 1A | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL $1ED8,X		  ; 1E D8 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E7
; Address: $F7B81A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E7:
	BNE $1C			  ; D0 1C | Branch if not equal
	ASL $9FB3,X		  ; 1E B3 9F | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E8
; Address: $F7B825
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E8:
	SBC #$80			 ; E9 80 | Subtract with carry (immediate)
	INC $C0A0,X		  ; FE A0 C0 | Increment (absolute,X)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX $FF5F			; EC 5F FF | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR #$69			 ; 49 69 | Exclusive OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR #$C9			 ; 49 C9 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0E9
; Address: $F7B84E
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0E9:
	JSL $957B62		  ; 22 62 7B 95 | Jump to subroutine long
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	LDA $BF57,X		  ; BD 57 BF | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$73			 ; 29 73 | Logical AND with accumulator (immediate)
	ORA $F0F3,X		  ; 1D F3 F0 | Logical OR with accumulator (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $8F			  ; 10 8F | Branch if positive
	STA $707777		  ; 8F 77 77 70 | Store accumulator to absolute long address
	BVS $0F			  ; 70 0F | Branch if overflow set
	STA $F0E0E0		  ; 8F E0 E0 F0 | Store accumulator to absolute long address
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	STA $88FF70		  ; 8F 70 FF 88 | Store accumulator to absolute long address
	STA $F070FF		  ; 8F FF 70 F0 | Store accumulator to absolute long address
	XBA				  ; EB | Exchange accumulator bytes
	SEI				  ; 78 | Set interrupt disable flag
	BCS $7F			  ; B0 7F | Branch if carry set
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	BRA $7F			  ; 80 7F | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $0C			  ; 10 0C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0EA
; Address: $F7B8BC
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0EA:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($B6,X)		  ; 01 B6 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	STY $93EC			; 8C EC 93 | Store Y register to absolute address
	STA $FECD			; 8D CD FE | Store accumulator to absolute address
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ROR				  ; 6A | Rotate right (accumulator)
	INC $FF13,X		  ; FE 13 FF | Increment (absolute,X)
	BIT $6BFF			; 2C FF 6B | Test bits in accumulator (absolute)
	BCC $90			  ; 90 90 | Branch if carry clear
	BCS $90			  ; B0 90 | Branch if carry set
	ASL $8B0E			; 0E 0E 8B | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $1FDE,X		  ; DE DE 1F | Decrement (absolute,X)
	BCC $6F			  ; 90 6F | Branch if carry clear
	BCC $6F			  ; 90 6F | Branch if carry clear
	ASL $88F1			; 0E F1 88 | Arithmetic shift left (absolute)
	BVC $AF			  ; 50 AF | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	INC $3F21,X		  ; FE 21 3F | Increment (absolute,X)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($F8),Y		  ; 31 F8 | Logical AND with accumulator ((zero page),Y)
	BPL $F8			  ; 10 F8 | Branch if positive
	BPL $F8			  ; 10 F8 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BCS $F0			  ; B0 F0 | Branch if carry set
	BVC $00			  ; 50 00 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $0DFE,X		  ; 1D FE 0D | Logical OR with accumulator (absolute,X)
	INC $7E84,X		  ; FE 84 7E | Increment (absolute,X)
	STY $7E			  ; 84 7E | Store Y register to zero page
	BVC $2C			  ; 50 2C | Branch if overflow clear
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0EB
; Address: $F7B986
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0EB:
	RTI				  ; 40 | Return from interrupt
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	JMP $613C			; 4C 3C 61 | Jump to address
	AND $0F44,X		  ; 3D 44 0F | Logical AND with accumulator (absolute,X)
	AND $5D			  ; 25 5D | Logical AND with accumulator (zero page)
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	ASL $031E			; 0E 1E 03 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	STX $EF10			; 8E 10 EF | Store X register to absolute address
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $FF			  ; 10 FF | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $0180			; 0E 80 01 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	PLB				  ; AB | Pull data bank register from stack
	EOR ($65,X)		  ; 41 65 | Exclusive OR with accumulator ((zero page,X))
	ROL $36			  ; 26 36 | Rotate left (zero page)
	BVC $51			  ; 50 51 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	STA $CB48,X		  ; 9D 48 CB | Store accumulator to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	PLB				  ; AB | Pull data bank register from stack
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	LDX $62DF			; AE DF 62 | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	LDA $E7E7AF		  ; AF AF E7 E7 | Load from absolute long address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0ED
; Address: $F7BA27
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0ED:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $EF0F,X		  ; 9E 0F EF | Store zero to absolute,X
	LDA				  ; BF 50 FF 18 | Load from absolute long,X into accumulator
	STA				  ; 9F FF F7 FF | Store accumulator to absolute long,X
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0008,X		  ; 1E 08 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0EE
; Address: $F7BA58
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0EE:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA $0319,Y		  ; 19 19 03 | Logical OR with accumulator (absolute,Y)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	LDA $787820		  ; AF 20 78 78 | Load from absolute long address into accumulator
	ADC $FE66,Y		  ; 79 66 FE | Add with carry (absolute,Y)
	SBC $DC23,X		  ; FD 23 DC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0EF
; Address: $F7BA7C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0EF:
	JSR $78DF			; 20 DF 78 | Jump to subroutine
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F0
; Address: $F7BAB4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F0:
	JSR $3000			; 20 00 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F1
; Address: $F7BAC6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F1:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEP #$40			 ; E2 40 | Set processor status bits
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F3
; Address: $F7BADA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F3:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1E0E,Y		  ; 39 0E 1E | Logical AND with accumulator (absolute,Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SBC $6C0C,X		  ; FD 0C 6C | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F4
; Address: $F7BB11
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F4:
	JSR $A07F			; 20 7F A0 | Jump to subroutine
	BIT $FE			  ; 24 FE | Test bits in accumulator (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0409,Y		  ; 19 09 04 | Logical OR with accumulator (absolute,Y)
	SBC ($31),Y		  ; F1 31 | Subtract with carry ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$76			 ; 49 76 | Exclusive OR with accumulator (immediate)
	AND $3ACE,Y		  ; 39 CE 3A | Logical AND with accumulator (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	ADC $0F0F			; 6D 0F 0F | Add with carry (absolute)
	STA				  ; 9F 9F 3B 1B | Store accumulator to absolute long,X
	BVS $10			  ; 70 10 | Branch if overflow set
	BPL $6F			  ; 10 6F | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F5
; Address: $F7BB71
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F5:
	BEQ $FF			  ; F0 FF | Branch if equal
	STA				  ; 9F 60 1B E4 | Store accumulator to absolute long,X
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	LDA				  ; BF BA 04 33 | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX $DC			  ; E4 DC | Compare X register (zero page)
	LDA $F940,Y		  ; B9 40 F9 | Load from absolute,Y into accumulator
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	AND $322D			; 2D 2D 32 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $15DD,X		  ; 9D DD 15 | Store accumulator to absolute,X
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	LDX $A6			  ; A6 A6 | Load from zero page into X register
	ROR $7ECD,X		  ; 7E CD 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F6
; Address: $F7BC17
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F6:
	JSL $FEEAF7		  ; 22 F7 EA FE | Jump to subroutine long
	INC $FF59			; EE 59 FF | Increment (absolute)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0F9
; Address: $F7BC26
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0F9:
	BCS $B0			  ; B0 B0 | Branch if carry set
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0FB
; Address: $F7BC35
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0FB:
	STA				  ; 9F F0 4F 0F | Store accumulator to absolute long,X
	BEQ $08			  ; F0 08 | Branch if equal
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	ASL $1C0D			; 0E 0D 1C | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $13			  ; 10 13 | Branch if positive
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BIT $F0FF			; 2C FF F0 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0FC
; Address: $F7BC7F
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0FC:
	PHB				  ; 8B | Push data bank register to stack
	WDM #$40			 ; 42 40 | Reserved instruction
	TSX				  ; BA | Transfer stack pointer to X register
	DEC				  ; 3A | Decrement accumulator
	ADC $FF01,X		  ; 7D 01 FF | Add with carry (absolute,X)
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BPL $41			  ; 10 41 | Branch if positive
	LDA				  ; BF 3F C5 FE | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	BRA $1F			  ; 80 1F | Branch always
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E09			; 0D 09 0E | Logical OR with accumulator (absolute)
	ASL $5818,X		  ; 1E 18 58 | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	BMI $30			  ; 30 30 | Branch if negative
	LDY $78BC,X		  ; BC BC 78 | Load from absolute,X into Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDA $AA77			; AD 77 AA | Load from absolute address into accumulator
	INC $C943,X		  ; FE 43 C9 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0FD
; Address: $F7BCE5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0FD:
	JSR $F0F7			; 20 F7 F0 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	LDA $1F7F2F		  ; AF 2F 7F 1F | Load from absolute long address into accumulator
	BEQ $23			  ; F0 23 | Branch if equal
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BPL $3F			  ; 10 3F | Branch if positive
	BNE $1F			  ; D0 1F | Branch if not equal
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($C9,X)		  ; 81 C9 | Store accumulator to (zero page,X)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$E4			 ; C0 E4 | Compare Y register (immediate)
	CPY $E7			  ; C4 E7 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0FE
; Address: $F7BD2F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0FE:
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ORA $4BFF,X		  ; 1D FF 4B | Logical OR with accumulator (absolute,X)
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	ASL $1F1E,X		  ; 1E 1E 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_0FF
; Address: $F7BD4C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_0FF:
	JSR $1028			; 20 28 10 | Jump to subroutine
	BCS $4F			  ; B0 4F | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	INC $FFE1,X		  ; FE E1 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $D7FF			; AC FF D7 | Load from absolute address into Y register
	ASL $190F			; 0E 0F 19 | Arithmetic shift left (absolute)
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	BIT $302F			; 2C 2F 30 | Test bits in accumulator (absolute)
	ORA $010F			; 0D 0F 01 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $238E			; 8E 8E 23 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $FEDD,X		  ; 1D DD FE | Logical OR with accumulator (absolute,X)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	CMP $22FD			; CD FD 22 | Compare accumulator (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	BEQ $6C			  ; F0 6C | Branch if equal
	JMP ($8F8F)		  ; 6C 8F 8F | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_100
; Address: $F7BDAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_100:
	RTI				  ; 40 | Return from interrupt
	BPL $EF			  ; 10 EF | Branch if positive
	BEQ $0F			  ; F0 0F | Branch if equal
	BVS $3F			  ; 70 3F | Branch if overflow set
	BNE $23			  ; D0 23 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_101
; Address: $F7BDBD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_101:
	STA				  ; 9F 40 BF 09 | Store accumulator to absolute long,X
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1716,Y		  ; 19 16 17 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1D13,X		  ; 1D 13 1D | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_102
; Address: $F7BDE1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_102:
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $B0			  ; B0 B0 | Branch if carry set
	ADC $65			  ; 65 65 | Add with carry (zero page)
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	INC $FFA5,X		  ; FE A5 FF | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	PEA #$FF4F		   ; F4 4F FF | Push effective address to stack
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	SBC $FD9A,X		  ; FD 9A FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_105
; Address: $F7BE0A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_105:
	BPL $10			  ; 10 10 | Branch if positive
	STA $E0E18F		  ; 8F 8F E1 E0 | Game work RAM access
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_107
; Address: $F7BE17
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_107:
	STA				  ; 9F E0 9F 10 | Store accumulator to absolute long,X
	STA				  ; 9F 70 E0 1F | Store accumulator to absolute long,X
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CPX $EFFF			; EC FF EF | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	ORA $0D4D			; 0D 4D 0D | Logical OR with accumulator (absolute)
	EOR $2404			; 4D 04 24 | Exclusive OR with accumulator (absolute)
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $70			  ; 70 70 | Branch if overflow set
	LDA $D8D8AF		  ; AF AF D8 D8 | Load from absolute long address into accumulator
	BRA $7F			  ; 80 7F | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BVS $8F			  ; 70 8F | Branch if overflow set
	LDA				  ; BF 50 F8 27 | Load from absolute long,X into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $06			  ; 30 06 | Branch if negative
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_108
; Address: $F7BEB6
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_108:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $36			  ; 26 36 | Rotate left (zero page)
	ORA ($9D),Y		  ; 11 9D | Logical OR with accumulator ((zero page),Y)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $FE			  ; 30 FE | Branch if negative
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	AND $177F,Y		  ; 39 7F 17 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	LDX $BFBE,Y		  ; BE BE BF | Load from absolute,Y into X register
	LDA				  ; BF 3F BF 8F | Load from absolute long,X into accumulator
	STA $60E3C3		  ; 8F C3 E3 60 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	BVS $EF			  ; 70 EF | Branch if overflow set
	INC $FF41,X		  ; FE 41 FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $FF			  ; 70 FF | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $3E04,X		  ; 1E 04 3E | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0E05			; 0D 05 0E | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC $0700,X		  ; FD 00 07 | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA $0E79			; 0D 79 0E | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	STX $00			  ; 86 00 | Store X register to zero page
	WDM #$00			 ; 42 00 | Reserved instruction
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	BRA $41			  ; 80 41 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_10B
; Address: $F7BF9F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_10B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_10C
; Address: $F7BFC2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_10C:
	JSR $0F30			; 20 30 0F | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BNE $FF			  ; D0 FF | Branch if not equal
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_10D
; Address: $F7C007
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_10D:
	JSR $6000			; 20 00 60 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F FF 07 1F | Store accumulator to absolute long,X
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($44),Y		  ; 11 44 | Logical OR with accumulator ((zero page),Y)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $068F00		  ; 8F 00 8F 06 | Store accumulator to absolute long address
	ADC $7613,X		  ; 7D 13 76 | Add with carry (absolute,X)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	LDA $FF76,X		  ; BD 76 FF | Load from absolute,X into accumulator
	ADC ($F1,X)		  ; 61 F1 | Add with carry ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_10E
; Address: $F7C05A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_10E:
	JSR $9100			; 20 00 91 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVC $50			  ; 50 50 | Branch if overflow clear
	AND $1F21,Y		  ; 39 21 1F | Logical AND with accumulator (absolute,Y)
	LDA ($40),Y		  ; B1 40 | Load from (zero page),Y into accumulator
	BVC $E7			  ; 50 E7 | Branch if overflow clear
	AND $1F74,Y		  ; 39 74 1F | Logical AND with accumulator (absolute,Y)
	STA				  ; 9F 0C 0D 00 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_10F
; Address: $F7C095
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_10F:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_110
; Address: $F7C09C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_110:
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	LDY $1233			; AC 33 12 | Load from absolute address into Y register
	ASL $0302,X		  ; 1E 02 03 | Arithmetic shift left (absolute,X)
	LDA				  ; BF 0C 1E F0 | Load from absolute long,X into accumulator
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	BCC $70			  ; 90 70 | Branch if carry clear
	BMI $CC			  ; 30 CC | Branch if negative
	DEC $DEE2			; CE E2 DE | Decrement (absolute)
	STY $00FC			; 8C FC 00 | Store Y register to absolute address
	BEQ $18			  ; F0 18 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_111
; Address: $F7C0D7
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_111:
	BEQ $CC			  ; F0 CC | Branch if equal
	JMP $1CFE			; 4C FE 1C | Jump to address
	INC $FC70,X		  ; FE 70 FC | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $007E,X		  ; 7D 7E 00 | Add with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX $E6			  ; E4 E6 | Compare X register (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BEQ $02			  ; F0 02 | Branch if equal
	INC $80			  ; E6 80 | Increment (zero page)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHB				  ; 8B | Push data bank register to stack
	STZ $005F			; 9C 5F 00 | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	BMI $BB			  ; 30 BB | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STZ $FC			  ; 64 FC | Store zero to zero page

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_112
; Address: $F7C1CA
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_112:
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	BCC $6F			  ; 90 6F | Branch if carry clear
	STZ $7C			  ; 64 7C | Store zero to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDX #$31			 ; A2 31 | Load immediate value into X register
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ASL $FFF5			; 0E F5 FF | Arithmetic shift left (absolute)
	EOR $0EFF,X		  ; 5D FF 0E | Exclusive OR with accumulator (absolute,X)
	BVC $51			  ; 50 51 | Branch if overflow clear
	BRA $9F			  ; 80 9F | Branch always
	CMP $2FDC,X		  ; DD DC 2F | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_113
; Address: $F7C249
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_113:
	JSR $F0F0			; 20 F0 F0 | Jump to subroutine
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	LDX $60FF			; AE FF 60 | Load from absolute address into X register
	INC $2022,X		  ; FE 22 20 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ROL $FD00,X		  ; 3E 00 FD | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_114
; Address: $F7C26B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_114:
	JSR $E0E0			; 20 E0 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_115
; Address: $F7C27A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_115:
	JSR $E0DF			; 20 DF E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_116
; Address: $F7C2AA
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_116:
	AND $B2FF,Y		  ; 39 FF B2 | Logical AND with accumulator (absolute,Y)
	DEC $7C7C			; CE 7C 7C | Decrement (absolute)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	DEC $FF			  ; C6 FF | Decrement (zero page)
	JMP $00FE			; 4C FE 00 | Jump to address
	LSR $C7			  ; 46 C7 | Logical shift right (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1F13,X		  ; 1E 13 1F | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_117
; Address: $F7C322
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_117:
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	ROL $4502,X		  ; 3E 02 45 | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	LSR $9FBF			; 4E BF 9F | Logical shift right (absolute)
	STA				  ; 9F FF 1E 3F | Store accumulator to absolute long,X
	ROL $7D38,X		  ; 3E 38 7D | Rotate left (absolute,X)
	SBC $FF7E,X		  ; FD 7E FF | Subtract with carry (absolute,X)
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_119
; Address: $F7C343
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_119:
	BPL $F8			  ; 10 F8 | Branch if positive
	CPX $1A			  ; E4 1A | Compare X register (zero page)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	REP #$3E			 ; C2 3E | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $04			  ; 10 04 | Branch if positive
	INC				  ; 1A | Increment accumulator
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	INC $FCC8,X		  ; FE C8 FC | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $01CF			; 0D CF 01 | Logical OR with accumulator (absolute)
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	BMI $3F			  ; 30 3F | Branch if negative
	ORA $021F			; 0D 1F 02 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_11A
; Address: $F7C381
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_11A:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BCC $90			  ; 90 90 | Branch if carry clear
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CPX $EFEC			; EC EC EF | Compare X register (absolute)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_11B
; Address: $F7C393
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_11B:
	LDA				  ; BF B0 6F E9 | Load from absolute long,X into accumulator
	CPX #$BD			 ; E0 BD | Compare X register (immediate)
	ROR $13FC,X		  ; 7E FC 13 | Rotate right (absolute,X)
	BPL $C7			  ; 10 C7 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	STA				  ; 9F 80 03 00 | Store accumulator to absolute long,X
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF BF C7 38 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_11C
; Address: $F7C3F5
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_11C:
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $10			  ; 30 10 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND $0F00,Y		  ; 39 00 0F | Logical AND with accumulator (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0A0E			; 0E 0E 0A | Arithmetic shift left (absolute)
	ASL $0604			; 0E 04 06 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F11			; 0E 11 1F | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $38			  ; 10 38 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STX $F6			  ; 86 F6 | Store X register to zero page
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	LDA $2D7F,Y		  ; B9 7F 2D | Load from absolute,Y into accumulator
	STX $FE			  ; 86 FE | Store X register to zero page
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ROL $46FF,X		  ; 3E FF 46 | Rotate left (absolute,X)
	REP #$EF			 ; C2 EF | Reset processor status bits

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_11D
; Address: $F7C51E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_11D:
	BRA $C7			  ; 80 C7 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	BEQ $8E			  ; F0 8E | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $78			  ; 80 78 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ASL $00FE			; 0E FE 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX $9A1E			; EC 1E 9A | Compare X register (absolute)
	ADC $F775,X		  ; 7D 75 F7 | Add with carry (absolute,X)
	WDM #$C2			 ; 42 C2 | Reserved instruction
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BRA $83			  ; 80 83 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	INC $FF65,X		  ; FE 65 FF | Increment (absolute,X)
	BRA $C2			  ; 80 C2 | Branch always
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHB				  ; 8B | Push data bank register to stack
	SEC				  ; 38 | Set carry flag
	BMI $BB			  ; 30 BB | Branch if negative
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $070C,X		  ; 1E 0C 07 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_11E
; Address: $F7C5F8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_11E:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1E1C			; 0E 1C 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_120
; Address: $F7C628
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_120:
	STA $7C			  ; 85 7C | Store accumulator to zero page
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	STA $80FF9F		  ; 8F 9F FF 80 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	SBC $FD78,X		  ; FD 78 FD | Subtract with carry (absolute,X)
	ROL $88FF,X		  ; 3E FF 88 | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_121
; Address: $F7C640
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_121:
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL $3FFF,X		  ; 3E FF 3F | Rotate left (absolute,X)
	ROL $E8FF,X		  ; 3E FF E8 | Rotate left (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $0E09			; 0D 09 0E | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	ORA $3CFE,Y		  ; 19 FE 3C | Logical OR with accumulator (absolute,Y)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	STY $FC9C			; 8C 9C FC | Store Y register to absolute address
	ASL $67			  ; 06 67 | Arithmetic shift left (zero page)
	INC $FF			  ; E6 FF | Increment (zero page)
	STZ $FF			  ; 64 FF | Store zero to zero page
	ASL $88FF,X		  ; 1E FF 88 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_122
; Address: $F7C6A0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_122:
	DEC $913F			; CE 3F 91 | Decrement (absolute)
	ADC ($B0),Y		  ; 71 B0 | Add with carry ((zero page),Y)
	BVS $88			  ; 70 88 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_123
; Address: $F7C6B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_123:
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_125
; Address: $F7C6DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_125:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_126
; Address: $F7C734
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_126:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $002D			; 2D 2D 00 | Logical AND with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $19			  ; 80 19 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LDY #$B6			 ; A0 B6 | Load immediate value into Y register
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $720D			; 0D 0D 72 | Logical OR with accumulator (absolute)
	STA ($8B,X)		  ; 81 8B | Store accumulator to (zero page,X)
	PLA				  ; 68 | Pull accumulator from stack
	STY $0E70			; 8C 70 0E | Store Y register to absolute address
	ASL $3131			; 0E 31 31 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_128
; Address: $F7C7C6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_128:
	ASL $114E			; 0E 4E 11 | Arithmetic shift left (absolute)
	STA				  ; 9F 3B BF 71 | Store accumulator to absolute long,X
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_129
; Address: $F7C7DA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_129:
	EOR ($11),Y		  ; 51 11 | Exclusive OR with accumulator ((zero page),Y)
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	WDM #$1D			 ; 42 1D | Reserved instruction
	AND $B590,X		  ; 3D 90 B5 | Logical AND with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	SBC $FBA2,X		  ; FD A2 FB | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12A
; Address: $F7C7F8
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12A:
	REP #$00			 ; C2 00 | Reset processor status bits
	BRA $05			  ; 80 05 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPY $E3CC			; CC CC E3 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY $E330			; CC 30 E3 | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $08			  ; 64 08 | Store zero to zero page
	LDY $08			  ; A4 08 | Load from zero page into Y register
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ROR $7AA7,X		  ; 7E A7 7A | Rotate right (absolute,X)
	BEQ $FC			  ; F0 FC | Branch if equal
	BCS $BC			  ; B0 BC | Branch if carry set
	BCS $BC			  ; B0 BC | Branch if carry set
	BRA $BC			  ; 80 BC | Branch always
	BRA $FE			  ; 80 FE | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	LDA				  ; BF AC BF 9E | Load from absolute long,X into accumulator
	LDA				  ; BF 8D BF 00 | Load from absolute long,X into accumulator
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LSR $E00E			; 4E 0E E0 | Game work RAM access
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $04			  ; 10 04 | Branch if positive
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	BVS $F2			  ; 70 F2 | Branch if overflow set
	BPL $F2			  ; 10 F2 | Branch if positive
	DEC $F7			  ; C6 F7 | Decrement (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12B
; Address: $F7C8B4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12B:
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STX $00CE			; 8E CE 00 | Store X register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STZ $3E00			; 9C 00 3E | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $90			  ; F0 90 | Branch if equal
	STZ $0CFE			; 9C FE 0C | Store zero to absolute
	ASL $0700,X		  ; 1E 00 07 | Arithmetic shift left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	STZ $9E9C			; 9C 9C 9E | Store zero to absolute
	STZ $0D0D,X		  ; 9E 0D 0D | Store zero to absolute,X
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ASL $3C1C,X		  ; 1E 1C 3C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12C
; Address: $F7C94D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12C:
	JSR $083C			; 20 3C 08 | Jump to subroutine
	AND $5B3D,X		  ; 3D 3D 5B | Logical AND with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	BPL $18			  ; 10 18 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$FAFA		   ; F4 FA FA | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $0404,X		  ; FD 04 04 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12D
; Address: $F7C982
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12D:
	ORA $180D			; 0D 0D 18 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $1802			; 0D 02 18 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	STZ $C3			  ; 64 C3 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	CPY $22CF			; CC CF 22 | Compare Y register (absolute)
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	ADC ($BD),Y		  ; 71 BD | Add with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$E800		   ; F4 00 E8 | Push effective address to stack
	BPL $CE			  ; 10 CE | Branch if positive
	BMI $E3			  ; 30 E3 | Branch if negative
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC $8002,X		  ; FD 02 80 | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP ($FD,X)		  ; C1 FD | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ADC ($30,X)		  ; 61 30 | Add with carry ((zero page,X))
	SBC ($78),Y		  ; F1 78 | Subtract with carry ((zero page),Y)
	SBC $FCFD,Y		  ; F9 FD FC | Subtract with carry (absolute,Y)
	INC $001F,X		  ; FE 1F 00 | Increment (absolute,X)
	LDA ($1E,X)		  ; A1 1E | Load from (zero page,X) into accumulator
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC $FD06,Y		  ; F9 06 FD | Subtract with carry (absolute,Y)
	BRA $70			  ; 80 70 | Branch always
	BVS $F8			  ; 70 F8 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA $0DFD,X		  ; 1D FD 0D | Logical OR with accumulator (absolute,X)
	SBC $FF07,X		  ; FD 07 FF | Subtract with carry (absolute,X)
	STY $7F			  ; 84 7F | Store Y register to zero page
	BRA $7F			  ; 80 7F | Branch always
	BVS $8F			  ; 70 8F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12E
; Address: $F7CA29
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12E:
	JSR $9080			; 20 80 90 | Jump to subroutine
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_12F
; Address: $F7CA37
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_12F:
	BRA $20			  ; 80 20 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_130
; Address: $F7CA3C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_130:
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $08			  ; F0 08 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	AND $133C,X		  ; 3D 3C 13 | Logical AND with accumulator (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	SBC $39F9,Y		  ; F9 F9 39 | Subtract with carry (absolute,Y)
	SBC $FF0E,Y		  ; F9 0E FF | Subtract with carry (absolute,Y)
	INC $DE18,X		  ; FE 18 DE | Increment (absolute,X)
	AND $053F,Y		  ; 39 3F 05 | Logical AND with accumulator (absolute,Y)
	ORA $19E6,Y		  ; 19 E6 19 | Logical OR with accumulator (absolute,Y)
	INC $1F			  ; E6 1F | Increment (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CMP ($5E,X)		  ; C1 5E | Compare accumulator ((zero page,X))
	LDA ($7F,X)		  ; A1 7F | Load from (zero page,X) into accumulator
	BRA $3B			  ; 80 3B | Branch always
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_131
; Address: $F7CA86
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_131:
	JSR $107F			; 20 7F 10 | Jump to subroutine
	CPY $7BDF			; CC DF 7B | Compare Y register (absolute)
	LDA				  ; BF 78 BF 85 | Load from absolute long,X into accumulator
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_132
; Address: $F7CA9B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_132:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	CPY $08FF			; CC FF 08 | Compare Y register (absolute)
	INC $FD10,X		  ; FE 10 FD | Increment (absolute,X)
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_133
; Address: $F7CAAA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_133:
	JSL $3C0CEE		  ; 22 EE 0C 3C | Jump to subroutine long
	ROL $C8FE,X		  ; 3E FE C8 | Rotate left (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $FC01,X		  ; 1E 01 FC | Arithmetic shift left (absolute,X)
	INC $0101,X		  ; FE 01 01 | Increment (absolute,X)
	LDA ($38),Y		  ; B1 38 | Load from (zero page),Y into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	INC $F808,X		  ; FE 08 F8 | Increment (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_134
; Address: $F7CACE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_134:
	JSR $713F			; 20 3F 71 | Jump to subroutine
	ASL $07F8			; 0E F8 07 | Arithmetic shift left (absolute)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_135
; Address: $F7CADD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_135:
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BRA $84			  ; 80 84 | Branch always
	STY $708E			; 8C 8E 70 | Store Y register to absolute address
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STY $78			  ; 84 78 | Store Y register to zero page
	STX $F170			; 8E 70 F1 | Store X register to absolute address
	ASL $3038			; 0E 38 30 | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_136
; Address: $F7CB06
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_136:
	BVS $60			  ; 70 60 | Branch if overflow set
	ROR $E260,X		  ; 7E 60 E2 | Rotate right (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA $7777,X		  ; 1D 77 77 | Logical OR with accumulator (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $3C00			; 0E 00 3C | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	BEQ $F2			  ; F0 F2 | Branch if equal
	CPY $30CC			; CC CC 30 | Compare Y register (absolute)
	BMI $3C			  ; 30 3C | Branch if negative
	BPL $1E			  ; 10 1E | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_137
; Address: $F7CB54
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_137:
	JSR $1120			; 20 20 11 | Jump to subroutine
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA ($E4,X)		  ; 01 E4 | Logical OR with accumulator ((zero page,X))
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL $27			  ; 26 27 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_138
; Address: $F7CB7A
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_138:
	JSR $E023			; 20 23 E0 | Game work RAM access
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	CPX $D03C			; EC 3C D0 | Compare X register (absolute)
	LDY $0FD0			; AC D0 0F | Load from absolute address into Y register
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF F7 17 FA | Load from absolute long,X into accumulator
	PEA #$ED0F		   ; F4 0F ED | Push effective address to stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $FF			  ; 64 FF | Store zero to zero page
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CMP $20E7,Y		  ; D9 E7 20 | Compare accumulator (absolute,Y)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SBC $FE			  ; E5 FE | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	STA $D0DFF0		  ; 8F F0 DF D0 | Store accumulator to absolute long address
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 1F F1 0F | Load from absolute long,X into accumulator
	LDA $3BD477		  ; AF 77 D4 3B | Load from absolute long address into accumulator
	PEA #$F41B		   ; F4 1B F4 | Push effective address to stack
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $0C39,X		  ; 1D 39 0C | Logical OR with accumulator (absolute,X)
	ORA $00FF			; 0D FF 00 | Logical OR with accumulator (absolute)
	STA $C7C080		  ; 8F 80 C0 C7 | Store accumulator to absolute long address
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	BEQ $F1			  ; F0 F1 | Branch if equal
	BEQ $F3			  ; F0 F3 | Branch if equal
	PEA #$9CF8		   ; F4 F8 9C | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC82,X		  ; FE 82 FC | Increment (absolute,X)
	STZ $1CE0,X		  ; 9E E0 1C | Store zero to absolute,X
	BRA $7C			  ; 80 7C | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_139
; Address: $F7CC3D
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_139:
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVS $5E			  ; 70 5E | Branch if overflow set
	CPX #$B9			 ; E0 B9 | Compare X register (immediate)
	CPY #$73			 ; C0 73 | Compare Y register (immediate)
	BRA $03			  ; 80 03 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	ROR $D1F1			; 6E F1 D1 | Rotate right (absolute)
	ROL $3FE8			; 2E E8 3F | Rotate left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BNE $3F			  ; D0 3F | Branch if not equal
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	BRA $79			  ; 80 79 | Branch always
	AND $9FFF,Y		  ; 39 FF 9F | Logical AND with accumulator (absolute,Y)
	ORA $11FD			; 0D FD 11 | Logical OR with accumulator (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	SBC $3100,X		  ; FD 00 31 | Subtract with carry (absolute,X)
	ROL $E5FA			; 2E FA E5 | Rotate left (absolute)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CMP ($7C,X)		  ; C1 7C | Compare accumulator ((zero page,X))
	ROR $3F01,X		  ; 7E 01 3F | Rotate right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F F8 3F F8 | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	SBC $FBBA,Y		  ; F9 BA FB | Subtract with carry (absolute,Y)
	ROL $18FF,X		  ; 3E FF 18 | Rotate left (absolute,X)
	INC $FC1E,X		  ; FE 1E FC | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	SBC $FB06,Y		  ; F9 06 FB | Subtract with carry (absolute,Y)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_13A
; Address: $F7CD14
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_13A:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0E07			; 0E 07 0E | Arithmetic shift left (absolute)
	ORA $0C1E			; 0D 1E 0C | Logical OR with accumulator (absolute)
	ASL $1808,X		  ; 1E 08 18 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $93E0,Y		  ; 19 E0 93 | Logical OR with accumulator (absolute,Y)
	SBC ($96,X)		  ; E1 96 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_13B
; Address: $F7CD67
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_13B:
	JSR $04E0			; 20 E0 04 | Jump to subroutine
	SBC ($07,X)		  ; E1 07 | Subtract with carry ((zero page,X))
	INC $03			  ; E6 03 | Increment (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	INC $FD7E,X		  ; FE 7E FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $100F			; 0D 0F 10 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_13C
; Address: $F7CD88
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_13C:
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	INC $E01F,X		  ; FE 1F E0 | Game work RAM access
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	BRA $0E			  ; 80 0E | Branch always
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL $FE0E			; 0E 0E FE | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	STY $FB			  ; 84 FB | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	STX $03			  ; 86 03 | Store X register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $80FF00		  ; 8F 00 FF 80 | Store accumulator to absolute long address
	BRA $03			  ; 80 03 | Branch always
	ROL $AA30,X		  ; 3E 30 AA | Rotate left (absolute,X)
	CPX $F213			; EC 13 F2 | Compare X register (absolute)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $87FE			; 0E FE 87 | Arithmetic shift left (absolute)
	ORA $06F9			; 0D F9 06 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_13D
; Address: $F7CDD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_13D:
	SBC $F802,X		  ; FD 02 F8 | Subtract with carry (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA $060D			; 0D 0D 06 | Logical OR with accumulator (absolute)
	ASL $CA			  ; 06 CA | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_13E
; Address: $F7CDE8
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_13E:
	JSL $831283		  ; 22 83 12 83 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BEQ $F3			  ; F0 F3 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $F8F8,Y		  ; F9 F8 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	LDY $9C38,X		  ; BC 38 9C | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	CPY $CC08			; CC 08 CC | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	STZ $1C08,X		  ; 9E 08 1C | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $1C00,X		  ; 9E 00 1C | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	BNE $01			  ; D0 01 | Branch if not equal
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $3F			  ; 10 3F | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	BMI $D0			  ; 30 D0 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	STY $FF			  ; 84 FF | Store Y register to zero page
	BEQ $FE			  ; F0 FE | Branch if equal
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $800E,X		  ; FE 0E 80 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_140
; Address: $F7CE86
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_140:
	JSL $BF40DF		  ; 22 DF 40 BF | Jump to subroutine long
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BMI $1F			  ; 30 1F | Branch if negative
	CLC				  ; 18 | Clear carry flag
	DEC $6EE1,X		  ; DE E1 6E | Decrement (absolute,X)
	STZ $C04F			; 9C 4F C0 | Store zero to absolute
	AND ($E4,X)		  ; 21 E4 | Logical AND with accumulator ((zero page,X))
	DEC $E4			  ; C6 E4 | Decrement (zero page)
	INC $7C			  ; E6 7C | Increment (zero page)
	INC $1FFC,X		  ; FE FC 1F | Increment (absolute,X)
	BVS $8F			  ; 70 8F | Branch if overflow set
	BCC $6F			  ; 90 6F | Branch if carry clear
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX $19			  ; E4 19 | Compare X register (zero page)
	DEC $38			  ; C6 38 | Decrement (zero page)
	INC $18			  ; E6 18 | Increment (zero page)
	INC $0800,X		  ; FE 00 08 | Increment (absolute,X)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $AC			  ; F0 AC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$F8A8		   ; F4 A8 F8 | Push effective address to stack
	BCC $D0			  ; 90 D0 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	BVC $18			  ; 50 18 | Branch if overflow clear
	BPL $18			  ; 10 18 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_142
; Address: $F7CEDE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_142:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $01			  ; 80 01 | Branch always
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	AND $BFC3			; 2D C3 BF | Logical AND with accumulator (absolute)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPX $FE01			; EC 01 FE | Compare X register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_144
; Address: $F7CF06
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_144:
	BRA $80			  ; 80 80 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	LDY $BD			  ; A4 BD | Load from zero page into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_145
; Address: $F7CF16
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_145:
	BRA $6C			  ; 80 6C | Branch always
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_146
; Address: $F7CF1D
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_146:
	CPY #$BD			 ; C0 BD | Compare Y register (immediate)
	WDM #$0E			 ; 42 0E | Reserved instruction
	ASL $1C1E			; 0E 1E 1C | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $1F10,X		  ; 1E 10 1F | Arithmetic shift left (absolute,X)
	AND $3B3D,X		  ; 3D 3D 3B | Logical AND with accumulator (absolute,X)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	STX $F8			  ; 86 F8 | Store X register to zero page
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $E431			; CE 31 E4 | Decrement (absolute)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA $F807FE		  ; 8F FE 07 F8 | Store accumulator to absolute long address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $C2			  ; 80 C2 | Branch always
	BRA $C2			  ; 80 C2 | Branch always
	STY $80			  ; 84 80 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $4000,X		  ; FD 00 40 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F0F,X		  ; 1E 0F 0F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_147
; Address: $F7D063
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_147:
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	BVS $8C			  ; 70 8C | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_148
; Address: $F7D0C0
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_148:
	JSR $0028			; 20 28 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCC $7F			  ; 90 7F | Branch if carry clear
	INC $1F1F			; EE 1F 1F | Increment (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP ($6EFD)		  ; 6C FD 6E | Jump to address (absolute indirect)
	INX				  ; E8 | Increment X register
	STZ $7070			; 9C 70 70 | Store zero to absolute
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	CPX $FC10			; EC 10 FC | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $77DE,X		  ; 3E DE 77 | Rotate left (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_149
; Address: $F7D141
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_149:
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 9F 60 E0 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $9C			  ; 80 9C | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $3211,Y		  ; 19 11 32 | Logical OR with accumulator (absolute,Y)
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1B01			; 0D 01 1B | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $111E,X		  ; 1E 1E 11 | Arithmetic shift left (absolute,X)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL $3100,X		  ; 1E 00 31 | Arithmetic shift left (absolute,X)
	ASL $0901			; 0E 01 09 | Arithmetic shift left (absolute)
	ASL $011E			; 0E 1E 01 | Arithmetic shift left (absolute)
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	PHB				  ; 8B | Push data bank register to stack
	ASL $03BF			; 0E BF 03 | Arithmetic shift left (absolute)
	LDA				  ; BF 08 06 19 | Load from absolute long,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	LDA $CB0D			; AD 0D CB | Load from absolute address into accumulator
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	SEP #$E2			 ; E2 E2 | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	SBC $FD8D,Y		  ; F9 8D FD | Subtract with carry (absolute,Y)
	STA $87FD			; 8D FD 87 | Store accumulator to absolute address
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_14C
; Address: $F7D244
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_14C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_14D
; Address: $F7D268
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_14D:
	JSR $1DC1			; 20 C1 1D | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	STA				  ; 9F FF 00 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPY $86			  ; C4 86 | Compare Y register (zero page)
	STX $0F			  ; 86 0F | Store X register to zero page
	PLY				  ; 7A | Pull Y register from stack
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	BMI $08			  ; 30 08 | Branch if negative
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	STX $78			  ; 86 78 | Store X register to zero page
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FD			  ; 80 FD | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $3C38,X		  ; 3E 38 3C | Rotate left (absolute,X)
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_14E
; Address: $F7D2D6
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_14E:
	BPL $10			  ; 10 10 | Branch if positive
	ADC $7379,Y		  ; 79 79 73 | Add with carry (absolute,Y)
	BEQ $90			  ; F0 90 | Branch if equal
	STZ $0CFE			; 9C FE 0C | Store zero to absolute
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	STZ $9E9C			; 9C 9C 9E | Store zero to absolute
	STZ $0D0D,X		  ; 9E 0D 0D | Store zero to absolute,X
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $1F5D,X		  ; 1D 5D 1F | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BVS $8F			  ; 70 8F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	EOR $5F22,X		  ; 5D 22 5F | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_150
; Address: $F7D31B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_150:
	BPL $1F			  ; 10 1F | Branch if positive
	STZ $64			  ; 64 64 | Store zero to zero page
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	JMP ($6BEE)		  ; 6C EE 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $EF			  ; 24 EF | Test bits in accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $70			  ; 84 70 | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	BMI $30			  ; 30 30 | Branch if negative
	INY				  ; C8 | Increment Y register
	CPY $0200			; CC 00 02 | Compare Y register (absolute)
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $F939,Y		  ; F9 39 F9 | Subtract with carry (absolute,Y)
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_152
; Address: $F7D36A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_152:
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_153
; Address: $F7D37C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_153:
	SEC				  ; 38 | Set carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_154
; Address: $F7D3C0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_154:
	BCC $BF			  ; 90 BF | Branch if carry clear
	BVC $7F			  ; 50 7F | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_155
; Address: $F7D3C6
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_155:
	JSR $907F			; 20 7F 90 | Jump to subroutine
	STX $60BE			; 8E BE 60 | Store X register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	LDA ($40),Y		  ; B1 40 | Load from (zero page),Y into accumulator
	BRA $FF			  ; 80 FF | Branch always
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $20FF,Y		  ; 19 FF 20 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BCC $FF			  ; 90 FF | Branch if carry clear
	STY $87			  ; 84 87 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $42			  ; F0 42 | Hardware register operation
	REP #$05			 ; C2 05 | Reset processor status bits
	AND $FE02,X		  ; 3D 02 FE | Logical AND with accumulator (absolute,X)
	CMP $ECDF,Y		  ; D9 DF EC | Compare accumulator (absolute,Y)
	LDX $E7			  ; A6 E7 | Load from zero page into X register
	WDM #$C3			 ; 42 C3 | Reserved instruction
	BRA $81			  ; 80 81 | Branch always
	PLX				  ; FA | Pull X register from stack
	SBC $DE00,X		  ; FD 00 DE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_156
; Address: $F7D417
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_156:
	JSR $10EF			; 20 EF 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_157
; Address: $F7D42C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_157:
	JSR $20A0			; 20 A0 20 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $00FF			; 0D FF 00 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $07			  ; 30 07 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	DEC $FF			  ; C6 FF | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_158
; Address: $F7D462
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_158:
	JMP $6AFE			; 4C FE 6A | Jump to address
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BVS $60			  ; 70 60 | Branch if overflow set
	ROR $FA60,X		  ; 7E 60 FA | Rotate right (absolute,X)
	ROR $EC18,X		  ; 7E 18 EC | Rotate right (absolute,X)
	ROR $BE4D,X		  ; 7E 4D BE | Rotate right (absolute,X)
	DEC $38			  ; C6 38 | Decrement (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF83,X		  ; FE 83 FF | Increment (absolute,X)
	INC $0004,X		  ; FE 04 00 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ROL $DC00,X		  ; 3E 00 DC | Rotate left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $577F			; ED 7F 57 | Subtract with carry (absolute)
	STA ($BF),Y		  ; 91 BF | Store accumulator to (zero page),Y
	BPL $3F			  ; 10 3F | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	INC $FF			  ; E6 FF | Increment (zero page)
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	CLV				  ; B8 | Clear overflow flag
	DEC $06			  ; C6 06 | Decrement (zero page)
	SBC $05			  ; E5 05 | Subtract with carry (zero page)
	BRA $40			  ; 80 40 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_159
; Address: $F7D519
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_159:
	BRA $F8			  ; 80 F8 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CMP $FD			  ; C5 FD | Compare accumulator (zero page)
	REP #$FF			 ; C2 FF | Reset processor status bits
	INC $FD04,X		  ; FE 04 FD | Increment (absolute,X)
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL $E7			  ; 06 E7 | Arithmetic shift left (zero page)
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	ASL $3FBE,X		  ; 1E BE 3F | Arithmetic shift left (absolute,X)
	INC $F888,X		  ; FE 88 F8 | Increment (absolute,X)
	ASL $3B0E			; 0E 0E 3B | Arithmetic shift left (absolute)
	AND $7E02,X		  ; 3D 02 7E | Logical AND with accumulator (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	ASL $3FF1			; 0E F1 3F | Arithmetic shift left (absolute)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_15A
; Address: $F7D561
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_15A:
	JSR $D010			; 20 10 D0 | Jump to subroutine
	BNE $F0			  ; D0 F0 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $00C0			; 9C C0 00 | Store zero to absolute
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $9C			  ; F0 9C | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_15B
; Address: $F7D58C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_15B:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $B7FE			; 0D FE B7 | Logical OR with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3F AE 53 | Load from absolute long,X into accumulator
	ROR $3B			  ; 66 3B | Rotate right (zero page)
	ADC $BB			  ; 65 BB | Add with carry (zero page)
	CMP $0EF1,X		  ; DD F1 0E | Compare accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_15C
; Address: $F7D5CE
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_15C:
	BNE $3F			  ; D0 3F | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $E7			  ; F0 E7 | Branch if equal
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	STA				  ; 9F 7C FF F8 | Store accumulator to absolute long,X
	BVS $FF			  ; 70 FF | Branch if overflow set
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	AND $07F9,Y		  ; 39 F9 07 | Logical AND with accumulator (absolute,Y)
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	STA ($E2,X)		  ; 81 E2 | Store accumulator to (zero page,X)
	CMP $8FFE,X		  ; DD FE 8F | Compare accumulator (absolute,X)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $81			  ; 80 81 | Branch always
	ROR $1CE3,X		  ; 7E E3 1C | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_15E
; Address: $F7D625
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_15E:
	JSR $5090			; 20 90 50 | Jump to subroutine
	BCC $50			  ; 90 50 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_15F
; Address: $F7D64E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_15F:
	BVS $60			  ; 70 60 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	ROL $0E0C,X		  ; 3E 0C 0E | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $CD1E,X		  ; 1E 1E CD | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_160
; Address: $F7D67B
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_160:
	CMP $F5F5			; CD F5 F5 | Compare accumulator (absolute)
	SBC $07F9,Y		  ; F9 F9 07 | Subtract with carry (absolute,Y)
	ASL $0C07			; 0E 07 0C | Arithmetic shift left (absolute)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BNE $F8			  ; D0 F8 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $7F			  ; 10 7F | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$9B			 ; C0 9B | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ROR $1CF0			; 6E F0 1C | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_161
; Address: $F7D6EF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_161:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDA $B649,Y		  ; B9 49 B6 | Load from absolute,Y into accumulator
	BEQ $1F			  ; F0 1F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_162
; Address: $F7D70E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_162:
	INX				  ; E8 | Increment X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $E1			  ; F0 E1 | Branch if equal
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	INC $7F99,X		  ; FE 99 7F | Increment (absolute,X)
	LDA				  ; BF 31 CF 0F | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	BCC $EF			  ; 90 EF | Branch if carry clear
	BMI $2F			  ; 30 2F | Branch if negative
	BEQ $CF			  ; F0 CF | Branch if equal
	CPY $7FBF			; CC BF 7F | Compare Y register (absolute)
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	BNE $D4			  ; D0 D4 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	CPY $F830			; CC 30 F8 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $18			  ; F0 18 | Branch if equal
	AND $6423,Y		  ; 39 23 64 | Logical AND with accumulator (absolute,Y)
	BNE $03			  ; D0 03 | Branch if not equal
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $03			  ; E5 03 | Subtract with carry (zero page)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_163
; Address: $F7D7AA
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_163:
	STY $0F			  ; 84 0F | Store Y register to zero page
	ROR $03			  ; 66 03 | Rotate right (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $EF			  ; F0 EF | Branch if equal
	SBC $FFE6,Y		  ; F9 E6 FF | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ROR $0C80,X		  ; 7E 80 0C | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $E002,X		  ; FE 02 E0 | Game work RAM access
	BMI $F0			  ; 30 F0 | Branch if negative
	INC $DF29			; EE 29 DF | Increment (absolute)
	AND $DF			  ; 25 DF | Logical AND with accumulator (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $3F01,X		  ; 1E 01 3F | Arithmetic shift left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BEQ $37			  ; F0 37 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	STY $8E8D			; 8C 8D 8E | Store Y register to absolute address
	PEA #$FFF6		   ; F4 F6 FF | Push effective address to stack
	STA $718F73		  ; 8F 73 8F 71 | Store accumulator to absolute long address
	PHP				  ; 08 | Push processor status to stack
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BIT $0CE8			; 2C E8 0C | Test bits in accumulator (absolute)
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_164
; Address: $F7D83C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_164:
	BNE $C0			  ; D0 C0 | Branch if not equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_165
; Address: $F7D842
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_165:
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX $4D7E			; EC 7E 4D | Compare X register (absolute)
	LDX $3C43,Y		  ; BE 43 3C | Load from absolute,Y into X register
	DEC $38			  ; C6 38 | Decrement (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF83,X		  ; FE 83 FF | Increment (absolute,X)
	INC $0006,X		  ; FE 06 00 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	INC $3C00,X		  ; FE 00 3C | Increment (absolute,X)
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	BNE $F8			  ; D0 F8 | Branch if not equal
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BCC $F8			  ; 90 F8 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BIT #$19			 ; 89 19 | Test bits in accumulator (immediate)
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SBC $FBE6,Y		  ; F9 E6 FB | Subtract with carry (absolute,Y)
	PEA #$F0FF		   ; F4 FF F0 | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	INC				  ; 1A | Increment accumulator
	WDM #$7F			 ; 42 7F | Reserved instruction
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BRA $0C			  ; 80 0C | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_166
; Address: $F7D8FE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_166:
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	BRA $0F			  ; 80 0F | Branch always
	INC $FC5B			; EE 5B FC | Increment (absolute)
	LDA				  ; BF 94 5C CE | Load from absolute long,X into accumulator
	ROR $E7			  ; 66 E7 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_167
; Address: $F7D92C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_167:
	JSL $FF3EE3		  ; 22 E3 3E FF | Jump to subroutine long
	BRA $7F			  ; 80 7F | Branch always
	STY $7B			  ; 84 7B | Store Y register to zero page
	DEC $E730			; CE 30 E7 | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag
	BCC $68			  ; 90 68 | Branch if carry clear
	BVS $98			  ; 70 98 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_169
; Address: $F7D95B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_169:
	JSR $0008			; 20 08 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($9A,X)		  ; 01 9A | Logical OR with accumulator ((zero page,X))
	SEP #$1C			 ; E2 1C | Set processor status bits
	ASL $3EFC,X		  ; 1E FC 3E | Arithmetic shift left (absolute,X)
	ASL $7FF0			; 0E F0 7F | Arithmetic shift left (absolute)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $1470,X		  ; FE 70 14 | Increment (absolute,X)
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_16B
; Address: $F7D9B3
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_16B:
	BPL $04			  ; 10 04 | Branch if positive
	INC $F100,X		  ; FE 00 F1 | Increment (absolute,X)
	EOR ($DF),Y		  ; 51 DF | Exclusive OR with accumulator ((zero page),Y)
	STA ($87,X)		  ; 81 87 | Store accumulator to (zero page,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $1C			  ; F0 1C | Branch if equal
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	INC $C7C4			; EE C4 C7 | Increment (absolute)
	BRA $83			  ; 80 83 | Branch always
	STY $87			  ; 84 87 | Store Y register to zero page
	CMP $C6			  ; C5 C6 | Compare accumulator (zero page)
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	BPL $C7			  ; 10 C7 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $6300			; 8C 00 63 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_16C
; Address: $F7DA41
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_16C:
	JSR $5000			; 20 00 50 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BPL $36			  ; 10 36 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $0C04,Y		  ; 19 04 0C | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_16D
; Address: $F7DA52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_16D:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_16E
; Address: $F7DA8D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_16E:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($6C,X)		  ; 01 6C | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 3D C2 03 | Store accumulator to absolute long,X
	INC $FC1E,X		  ; FE 1E FC | Increment (absolute,X)
	ASL $7FF0			; 0E F0 7F | Arithmetic shift left (absolute)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $0A08,X		  ; FE 08 0A | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $30			  ; 10 30 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_16F
; Address: $F7DAEF
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_16F:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $07			  ; F0 07 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $3F			  ; 10 3F | Branch if positive
	BVC $7F			  ; 50 7F | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	EOR ($7F),Y		  ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
	LDX $D93F			; AE 3F D9 | Load from absolute address into X register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_170
; Address: $F7DB5B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_170:
	BRA $B1			  ; 80 B1 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCC $BF			  ; 90 BF | Branch if carry clear
	BVC $7F			  ; 50 7F | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_171
; Address: $F7DB6B
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_171:
	ROL $7FEC,X		  ; 3E EC 7F | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	STA				  ; 9F 79 FF F9 | Store accumulator to absolute long,X
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	AND $07F9,Y		  ; 39 F9 07 | Logical AND with accumulator (absolute,Y)
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	STA $86			  ; 85 86 | Store accumulator to zero page
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $FCFB,X		  ; 9D FB FC | Store accumulator to absolute,X
	SED				  ; F8 | Set decimal mode flag
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $87			  ; 80 87 | Branch always
	ADC $629F,Y		  ; 79 9F 62 | Add with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BIT $107F			; 2C 7F 10 | Test bits in accumulator (absolute)
	SBC $7020,X		  ; FD 20 70 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_172
; Address: $F7DC0A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_172:
	JSR $0070			; 20 70 00 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $93			  ; F0 93 | Branch if equal
	SBC $70FD,X		  ; FD FD 70 | Subtract with carry (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $E0			  ; 70 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_173
; Address: $F7DC32
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_173:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	DEC $FFDF,X		  ; DE DF FF | Decrement (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_174
; Address: $F7DCB8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_174:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	LDX $6653			; AE 53 66 | Load from absolute address into X register
	ADC $BB			  ; 65 BB | Add with carry (zero page)
	CMP $0EF1,X		  ; DD F1 0E | Compare accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BNE $3F			  ; D0 3F | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $E7			  ; F0 E7 | Branch if equal
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_175
; Address: $F7DD18
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_175:
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_176
; Address: $F7DD44
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_176:
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_178
; Address: $F7DD61
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_178:
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $08FF,X		  ; 1E FF 08 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_179
; Address: $F7DD90
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_179:
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDX $E653			; AE 53 E6 | Load from absolute address into X register
	SBC $3B			  ; E5 3B | Subtract with carry (zero page)
	ORA $0EF1,X		  ; 1D F1 0E | Logical OR with accumulator (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BNE $3F			  ; D0 3F | Branch if not equal
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $E7			  ; F0 E7 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17A
; Address: $F7DE1D
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17A:
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	REP #$FF			 ; C2 FF | Reset processor status bits
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $0807			; 0E 07 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	CMP ($59,X)		  ; C1 59 | Compare accumulator ((zero page,X))
	LDA				  ; BF 1E FE 0F | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	PLY				  ; 7A | Pull Y register from stack
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FD			  ; 80 FD | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $84			  ; 84 84 | Store Y register to zero page
	SEP #$E2			 ; E2 E2 | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17B
; Address: $F7DEB7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17B:
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $84			  ; F0 84 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$1C			 ; E2 1C | Set processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17C
; Address: $F7DEDA
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17C:
	BPL $10			  ; 10 10 | Branch if positive
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $06F9,X		  ; FE F9 06 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FFF8,Y		  ; F9 F8 FF | Subtract with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $44			  ; 10 44 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	JMP ($7C7C)		  ; 6C 7C 7C | Jump to address (absolute indirect)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $533C,X		  ; BD 3C 53 | Load from absolute,X into accumulator
	BPL $2F			  ; 10 2F | Branch if positive
	SEC				  ; 38 | Set carry flag
	ROL $3F07,X		  ; 3E 07 3F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17D
; Address: $F7DF38
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17D:
	JSR $303F			; 20 3F 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC $39F9,Y		  ; F9 F9 39 | Subtract with carry (absolute,Y)
	SBC $FF0E,Y		  ; F9 0E FF | Subtract with carry (absolute,Y)
	INC $DE18,X		  ; FE 18 DE | Increment (absolute,X)
	AND $01FF,Y		  ; 39 FF 01 | Logical AND with accumulator (absolute,Y)
	ORA $19E6,Y		  ; 19 E6 19 | Logical OR with accumulator (absolute,Y)
	INC $1F			  ; E6 1F | Increment (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CMP ($5E,X)		  ; C1 5E | Compare accumulator ((zero page,X))
	LDA ($7F,X)		  ; A1 7F | Load from (zero page,X) into accumulator
	BRA $FF			  ; 80 FF | Branch always
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $03			  ; 85 03 | Store accumulator to zero page
	BRA $08			  ; 80 08 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $69			  ; 10 69 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17E
; Address: $F7DF87
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17E:
	ORA $0F36,Y		  ; 19 36 0F | Logical OR with accumulator (absolute,Y)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BVS $6F			  ; 70 6F | Branch if overflow set
	ADC $3F66,Y		  ; 79 66 3F | Add with carry (absolute,Y)
	BMI $0F			  ; 30 0F | Branch if negative
	STA				  ; 9F 00 80 00 | Store accumulator to absolute long,X
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	LDX $E653			; AE 53 E6 | Load from absolute address into X register
	SBC $3B			  ; E5 3B | Subtract with carry (zero page)
	ORA $0EF1,X		  ; 1D F1 0E | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BNE $3F			  ; D0 3F | Branch if not equal
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $E7			  ; F0 E7 | Branch if equal
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA $0303,X		  ; 1D 03 03 | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	DEC $FF			  ; C6 FF | Decrement (zero page)
	JMP $6AFE			; 4C FE 6A | Jump to address
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	AND $36C9,Y		  ; 39 C9 36 | Logical AND with accumulator (absolute,Y)
	BMI $1F			  ; 30 1F | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$E80F		   ; F4 0F E8 | Push effective address to stack
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $E1			  ; F0 E1 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_17F
; Address: $F7E07F
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_17F:
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	ORA $0800,Y		  ; 19 00 08 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	EOR $9F32			; 4D 32 9F | Exclusive OR with accumulator (absolute)
	JMP ($5EAD)		  ; 6C AD 5E | Jump to address (absolute indirect)
	ROR $FA			  ; 66 FA | Rotate right (zero page)
	ASL $003E			; 0E 3E 00 | Arithmetic shift left (absolute)
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	ROL $0010,X		  ; 3E 10 00 | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	JMP ($6C00)		  ; 6C 00 6C | Jump to address (absolute indirect)
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($7C7C)		  ; 6C 7C 7C | Jump to address (absolute indirect)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $09			  ; 10 09 | Branch if positive
	ORA $0F06,Y		  ; 19 06 0F | Logical OR with accumulator (absolute,Y)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0F06,Y		  ; 19 06 0F | Logical OR with accumulator (absolute,Y)
	ASL $311E,X		  ; 1E 1E 31 | Arithmetic shift left (absolute,X)
	AND ($60),Y		  ; 31 60 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_180
; Address: $F7E146
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_180:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $90			  ; 90 90 | Branch if carry clear
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	ASL $3100,X		  ; 1E 00 31 | Arithmetic shift left (absolute,X)
	ASL $1F60			; 0E 60 1F | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $6F			  ; 90 6F | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_181
; Address: $F7E181
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_181:
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	ASL $0F13,X		  ; 1E 13 0F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $1F01,X		  ; 3E 01 1F | Rotate left (absolute,X)
	ASL $0C01			; 0E 01 0C | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_183
; Address: $F7E1A5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_183:
	JSR $1010			; 20 10 10 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_185
; Address: $F7E1B7
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_185:
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	BCS $84			  ; B0 84 | Branch if carry set
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $0B06,Y		  ; 19 06 0B | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BNE $30			  ; D0 30 | Branch if not equal
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	AND $67			  ; 25 67 | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX $F0			  ; E4 F0 | Compare X register (zero page)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_186
; Address: $F7E25D
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_186:
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ROL $0E1E,X		  ; 3E 1E 0E | Rotate left (absolute,X)
	ASL $1B0B,X		  ; 1E 0B 1B | Arithmetic shift left (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ROL $1E01,X		  ; 3E 01 1E | Rotate left (absolute,X)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $D0			  ; D0 D0 | Branch if not equal
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $00E0,X		  ; FE E0 00 | Increment (absolute,X)
	BNE $20			  ; D0 20 | Branch if not equal
	INY				  ; C8 | Increment Y register
	BMI $0C			  ; 30 0C | Branch if negative
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $7E80,X		  ; 1E 80 7E | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STZ $7EBD			; 9C BD 7E | Store zero to absolute
	PLY				  ; 7A | Pull Y register from stack
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_187
; Address: $F7E30C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_187:
	BPL $10			  ; 10 10 | Branch if positive
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0C1E			; 0E 1E 0C | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1E01,X		  ; 1E 01 1E | Arithmetic shift left (absolute,X)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_188
; Address: $F7E344
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_188:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLY				  ; 7A | Pull Y register from stack
	ROL $00FC,X		  ; 3E FC 00 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_189
; Address: $F7E354
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_189:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	JMP ($2810)		  ; 6C 10 28 | Jump to address (absolute indirect)
	BPL $28			  ; 10 28 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	JMP ($5444)		  ; 6C 44 54 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $BA41,Y		  ; F9 41 BA | Subtract with carry (absolute,Y)
	CMP $5830			; CD 30 58 | Compare accumulator (absolute)
	BMI $34			  ; 30 34 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18A
; Address: $F7E3B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18A:
	INC $7F07,X		  ; FE 07 7F | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18B
; Address: $F7E3CB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18B:
	JSR $1034			; 20 34 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18C
; Address: $F7E3D8
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18C:
	BMI $30			  ; 30 30 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	JMP ($F000)		  ; 6C 00 F0 | Jump to address (absolute indirect)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $7EBD			; 9C BD 7E | Store zero to absolute
	PLY				  ; 7A | Pull Y register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	SEP #$3C			 ; E2 3C | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $3C00,X		  ; FE 00 3C | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18D
; Address: $F7E4FE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18D:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18E
; Address: $F7E508
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18E:
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ORA $151D,X		  ; 1D 1D 15 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	PEA #$F2F4		   ; F4 F4 F2 | Push effective address to stack
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_18F
; Address: $F7E582
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_18F:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $60			  ; 70 60 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_190
; Address: $F7E58D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_190:
	SEI				  ; 78 | Set interrupt disable flag
	BMI $38			  ; 30 38 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_191
; Address: $F7E592
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_191:
	JSR $70C0			; 20 C0 70 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	BRA $78			  ; 80 78 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $38			  ; 80 38 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $3D18,X		  ; 3E 18 3D | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_192
; Address: $F7E5B4
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_192:
	BIT $5A2C			; 2C 2C 5A | Test bits in accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BNE $D0			  ; D0 D0 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BMI $31			  ; 30 31 | Branch if negative
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $E706,Y		  ; 19 06 E7 | Logical OR with accumulator (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	STZ $5121,X		  ; 9E 21 51 | Store zero to absolute,X
	WDM #$A3			 ; 42 A3 | Reserved instruction
	DEC $27			  ; C6 27 | Decrement (zero page)
	BRA $40			  ; 80 40 | Branch always
	ASL $6F00,X		  ; 1E 00 6F | Arithmetic shift left (absolute,X)
	LDA ($2E),Y		  ; B1 2E | Load from (zero page),Y into accumulator
	JMP $C3D8E7		  ; 5C E7 D8 C3 | Jump to address long
	LDY $BFC0,X		  ; BC C0 BF | Load from absolute,X into Y register
	ASL $787F,X		  ; 1E 7F 78 | Arithmetic shift left (absolute,X)
	INC $FC84,X		  ; FE 84 FC | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$79			 ; 49 79 | Exclusive OR with accumulator (immediate)
	ASL $0CBF,X		  ; 1E BF 0C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_193
; Address: $F7E68F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_193:
	STA				  ; 9F 00 00 01 | Store accumulator to absolute long,X
	STX $00			  ; 86 00 | Store X register to zero page
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_194
; Address: $F7E6A0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_194:
	STX $9E			  ; 86 9E | Store X register to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC $FFC6,X		  ; 7D C6 FF | Add with carry (absolute,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	BCC $40			  ; 90 40 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_196
; Address: $F7E6C6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_196:
	JSR $3068			; 20 68 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	BMI $E8			  ; 30 E8 | Branch if negative
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $F8			  ; 10 F8 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_197
; Address: $F7E6DE
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_197:
	JSR $0700			; 20 00 07 | Jump to subroutine
	INC $FC9E,X		  ; FE 9E FC | Increment (absolute,X)
	STA				  ; 9F 9F DE DE | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1300			; 0D 00 13 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1F03			; 0D 03 1F | Logical OR with accumulator (absolute)
	BMI $38			  ; 30 38 | Branch if negative
	BMI $38			  ; 30 38 | Branch if negative
	BVS $78			  ; 70 78 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	BVS $E0			  ; 70 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $38			  ; F0 38 | Branch if equal
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_198
; Address: $F7E755
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_198:
	BRA $78			  ; 80 78 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BPL $78			  ; 10 78 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_199
; Address: $F7E769
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_199:
	JSR $003C			; 20 3C 00 | Jump to subroutine
	ROL $1F00,X		  ; 3E 00 1F | Rotate left (absolute,X)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19A
; Address: $F7E77E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19A:
	JSL $000C22		  ; 22 22 0C 00 | Jump to subroutine long
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	PEA #$FAFB		   ; F4 FB FA | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	CPX $4CEF			; EC EF 4C | Compare X register (absolute)
	STA $8F8E8F		  ; 8F 8F 8E 8F | Store accumulator to absolute long address
	BIT $342F			; 2C 2F 34 | Test bits in accumulator (absolute)
	DEC $83FF,X		  ; DE FF 83 | Decrement (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	STA $708F70		  ; 8F 70 8F 70 | Store accumulator to absolute long address
	BNE $37			  ; D0 37 | Branch if not equal
	INY				  ; C8 | Increment Y register
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	BCS $8F			  ; B0 8F | Branch if carry set
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BRA $07			  ; 80 07 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROL $4F00,X		  ; 3E 00 4F | Rotate left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19B
; Address: $F7E820
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19B:
	STA ($41,X)		  ; 81 41 | Store accumulator to (zero page,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY $7F04,X		  ; BC 04 7F | Load from absolute,X into Y register
	INC $F107,X		  ; FE 07 F1 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP ($BE,X)		  ; C1 BE | Compare accumulator ((zero page,X))
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BPL $5F			  ; 10 5F | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CPX $F7			  ; E4 F7 | Compare X register (zero page)
	STA $029D,Y		  ; 99 9D 02 | Store accumulator to absolute,Y
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19C
; Address: $F7E852
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19C:
	JSR $5080			; 20 80 50 | Jump to subroutine
	BRA $E8			  ; 80 E8 | Branch always
	TXS				  ; 9A | Transfer X register to stack pointer
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19D
; Address: $F7E85E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19D:
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	SBC $61FF			; ED FF 61 | Subtract with carry (absolute)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	JMP ($686C)		  ; 6C 6C 68 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $C63C,X		  ; FE 3C C6 | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	LSR $CD83,X		  ; 5E 83 CD | Logical shift right (absolute,X)
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19E
; Address: $F7E890
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19E:
	JSR $6000			; 20 00 60 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($23,X)		  ; 21 23 | Logical AND with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_19F
; Address: $F7E8C6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_19F:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEC $C7			  ; C6 C7 | Decrement (zero page)
	CPX $E7			  ; E4 E7 | Compare X register (zero page)
	LDY $1CAF			; AC AF 1C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A0
; Address: $F7E8D2
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A0:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	ROL $3F40,X		  ; 3E 40 3F | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	LDA $000050		  ; AF 50 00 00 | Load from absolute long address into accumulator
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	AND $DC2D			; 2D 2D DC | Logical AND with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	JMP ($3810)		  ; 6C 10 38 | Jump to address (absolute indirect)
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A1
; Address: $F7E932
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A1:
	JSR $E03C			; 20 3C E0 | Game work RAM access
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A2
; Address: $F7E93E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A2:
	JSR $0F20			; 20 20 0F | Jump to subroutine
	STY $01			  ; 84 01 | Store Y register to zero page
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A3
; Address: $F7E96B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A3:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	LDY $D8			  ; A4 D8 | Load from zero page into Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A4
; Address: $F7E98E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A4:
	JSR $0240			; 20 40 02 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	DEC $3F03,X		  ; DE 03 3F | Decrement (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $E01F,X		  ; 1E 1F E0 | Game work RAM access
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	INC $F00F,X		  ; FE 0F F0 | Increment (absolute,X)
	ORA $02E0,X		  ; 1D E0 02 | Logical OR with accumulator (absolute,X)
	ASL $FFE0,X		  ; 1E E0 FF | Arithmetic shift left (absolute,X)
	ORA ($8C,X)		  ; 01 8C | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 FF 7D | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	STY $FB			  ; 84 FB | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 40 FE 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $00FF00		  ; 8F 00 FF 00 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	BRA $93			  ; 80 93 | Branch always
	ORA $02FD			; 0D FD 02 | Logical OR with accumulator (absolute)
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	STX $FFFE			; 8E FE FF | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A5
; Address: $F7EA36
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A5:
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	INC $E201,X		  ; FE 01 E2 | Increment (absolute,X)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $A5			  ; 80 A5 | Branch always
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A7
; Address: $F7EA4E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A7:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $783D,X		  ; FD 3D 78 | Subtract with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1A8
; Address: $F7EA5D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1A8:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1AA
; Address: $F7EA67
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1AA:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STZ $4E9F,X		  ; 9E 9F 4E | Store zero to absolute,X
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	ASL $0C0F			; 0E 0F 0C | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0502			; 0D 02 05 | Logical OR with accumulator (absolute)
	STA				  ; 9F 60 4F 30 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $0F			  ; 10 0F | Branch if positive
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1AB
; Address: $F7EAB2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1AB:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1AC
; Address: $F7EAF0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1AC:
	JSR $A020			; 20 20 A0 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	INC $E720			; EE 20 E7 | Increment (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B0
; Address: $F7EB34
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B0:
	JSR $0220			; 20 20 02 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	LSR $484E			; 4E 4E 48 | Logical shift right (absolute)
	STA $759F,X		  ; 9D 9F 75 | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	LSR $4F30			; 4E 30 4F | Logical shift right (absolute)
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B1
; Address: $F7EB7D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B1:
	BRA $7E			  ; 80 7E | Branch always
	BRA $3F			  ; 80 3F | Branch always
	INC				  ; 1A | Increment accumulator
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ROL $183F,X		  ; 3E 3F 18 | Rotate left (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B2
; Address: $F7EBC6
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B2:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEP #$7D			 ; E2 7D | Set processor status bits
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	INC $F807,X		  ; FE 07 F8 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$00A0		   ; F4 A0 00 | Push effective address to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $0015			; 0E 15 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B3
; Address: $F7ECE2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B3:
	STY $84			  ; 84 84 | Store Y register to zero page
	STX $1E8F			; 8E 8F 1E | Store X register to absolute address
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	STY $78			  ; 84 78 | Store Y register to zero page
	STA $E01F70		  ; 8F 70 1F E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $C600			; 2C 00 C6 | Test bits in accumulator (absolute)
	BRA $83			  ; 80 83 | Branch always
	BRA $83			  ; 80 83 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B4
; Address: $F7ED30
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B4:
	JSL $BF9C79		  ; 22 79 9C BF | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SBC $7DFD,X		  ; FD FD 7D | Subtract with carry (absolute,X)
	ADC $7E7E,X		  ; 7D 7E 7E | Add with carry (absolute,X)
	ROL $38			  ; 26 38 | Rotate left (zero page)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	BPL $F8			  ; 10 F8 | Branch if positive
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BVS $7E			  ; 70 7E | Branch if overflow set
	BRA $3E			  ; 80 3E | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP $FE00			; 4C 00 FE | Jump to address
	RTI				  ; 40 | Return from interrupt
	INC $FC78,X		  ; FE 78 FC | Increment (absolute,X)
	BMI $F8			  ; 30 F8 | Branch if negative

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B5
; Address: $F7ED8F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B5:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX $FEE0			; EC E0 FE | Compare X register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B6
; Address: $F7EDC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B6:
	WDM #$E7			 ; 42 E7 | Reserved instruction
	WDM #$C6			 ; 42 C6 | Reserved instruction
	BRA $04			  ; 80 04 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B8
; Address: $F7EDD6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B8:
	WDM #$42			 ; 42 42 | Hardware register operation
	WDM #$42			 ; 42 42 | Hardware register operation
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $0001,Y		  ; 39 01 00 | Logical AND with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPY $FC00			; CC 00 FC | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1B9
; Address: $F7EE0C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1B9:
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1BB
; Address: $F7EE1C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1BB:
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $7F			  ; 10 7F | Branch if positive
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BEQ $80			  ; F0 80 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1BC
; Address: $F7EE43
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1BC:
	CLV				  ; B8 | Clear overflow flag
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	DEC $06FF,X		  ; DE FF 06 | Decrement (absolute,X)
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	BRA $80			  ; 80 80 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	DEC $06DE,X		  ; DE DE 06 | Decrement (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $FF			  ; E6 FF | Increment (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1BD
; Address: $F7EE89
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1BD:
	JSL $C600FF		  ; 22 FF 00 C6 | Jump to subroutine long
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $E6			  ; E6 E6 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1BE
; Address: $F7EE98
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1BE:
	JSL $000022		  ; 22 22 00 00 | Jump to subroutine long
	ASL $0F15			; 0E 15 0F | Arithmetic shift left (absolute)
	BVS $0F			  ; 70 0F | Branch if overflow set
	JMP ($191F)		  ; 6C 1F 19 | Jump to address (absolute indirect)
	SEP #$5B			 ; E2 5B | Set processor status bits
	CPX #$DE			 ; E0 DE | Compare X register (immediate)
	BNE $A8			  ; D0 A8 | Branch if not equal
	BMI $C0			  ; 30 C0 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	PEA #$F00E		   ; F4 0E F0 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	SBC $FE4A			; ED 4A FE | Subtract with carry (absolute)
	BIT #$FD			 ; 89 FD | Test bits in accumulator (immediate)
	BPL $60			  ; 10 60 | Branch if positive
	ROR $3E7E,X		  ; 7E 7E 3E | Rotate right (absolute,X)
	JMP $8B885F		  ; 5C 5F 88 8B | Jump to address long
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1BF
; Address: $F7EF1E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1BF:
	BCC $90			  ; 90 90 | Branch if carry clear
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C0
; Address: $F7EF25
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C0:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $18			  ; 10 18 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BVS $74			  ; 70 74 | Branch if overflow set
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)
	ORA $C0FF			; 0D FF C0 | Logical OR with accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C2
; Address: $F7EF5B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C2:
	JSR $0004			; 20 04 00 | Jump to subroutine
	BRA $90			  ; 80 90 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C3
; Address: $F7EF84
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C3:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $C8			  ; 10 C8 | Branch if positive
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	PEA #$F434		   ; F4 34 F4 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BVS $28			  ; 70 28 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C4
; Address: $F7EF9F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C4:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	INC				  ; 1A | Increment accumulator
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C5
; Address: $F7EFB2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C5:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BVS $70			  ; 70 70 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C6
; Address: $F7EFB9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C6:
	JSR $0018			; 20 18 00 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C8
; Address: $F7EFCC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C8:
	BMI $30			  ; 30 30 | Branch if negative
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BNE $00			  ; D0 00 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BCS $F4			  ; B0 F4 | Branch if carry set
	BVS $74			  ; 70 74 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $20			  ; B0 20 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	BVS $A8			  ; 70 A8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1C9
; Address: $F7EFFF
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1C9:
	JSR $0003			; 20 03 00 | Jump to subroutine
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1FFF,X		  ; 1D FF 1F | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1F1D,X		  ; 1D 1D 1F | Logical OR with accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $7C			  ; 30 7C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROL $3E0C,X		  ; 3E 0C 3E | Rotate left (absolute,X)
	ROR $BC3C,X		  ; 7E 3C BC | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	ORA $3F7F,X		  ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
	ORA $3F1D,X		  ; 1D 1D 3F | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1CA
; Address: $F7F064
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1CA:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FE9C,X		  ; FE 9C FE | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STZ $0C9C			; 9C 9C 0C | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	INY				  ; C8 | Increment Y register
	INC $FF8E,X		  ; FE 8E FF | Increment (absolute,X)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BVS $70			  ; 70 70 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STX $028E			; 8E 8E 02 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1CC
; Address: $F7F0E3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1CC:
	INC $FF03,X		  ; FE 03 FF | Increment (absolute,X)
	CPY $3CFE			; CC FE 3C | Compare Y register (absolute)
	INC $F30D,X		  ; FE 0D F3 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $FE01,X		  ; 3E 01 FE | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $FE8C			; 8C 8C FE | Store Y register to absolute address
	WDM #$CF			 ; 42 CF | Reserved instruction
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1CD
; Address: $F7F114
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1CD:
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$77			 ; E0 77 | Compare X register (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1CE
; Address: $F7F12B
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1CE:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $0DFD			; 0D FD 0D | Logical OR with accumulator (absolute)
	SBC $FA02,X		  ; FD 02 FA | Subtract with carry (absolute,X)
	CPX $88			  ; E4 88 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($F1),Y		  ; 11 F1 | Logical OR with accumulator ((zero page),Y)
	SBC $FE0E,X		  ; FD 0E FE | Subtract with carry (absolute,X)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	STY $60			  ; 84 60 | Store Y register to zero page
	STZ $30			  ; 64 30 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $BEA0,X		  ; 1E A0 BE | Arithmetic shift left (absolute,X)
	BIT $BA			  ; 24 BA | Test bits in accumulator (zero page)
	ROL $1B			  ; 26 1B | Rotate left (zero page)
	STY $78			  ; 84 78 | Store Y register to zero page
	STZ $98			  ; 64 98 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $3C40,X		  ; BC 40 3C | Load from absolute,X into Y register
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	ORA $05FF			; 0D FF 05 | Logical OR with accumulator (absolute)
	BPL $F3			  ; 10 F3 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1CF
; Address: $F7F1AD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1CF:
	BCC $00			  ; 90 00 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $80			  ; 10 80 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA #$5F			 ; 09 5F | Logical OR with accumulator (immediate)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D0
; Address: $F7F1E3
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D0:
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEC $EF			  ; C6 EF | Decrement (zero page)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	LSR $46FF			; 4E FF 46 | Logical shift right (absolute)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	LSR $464E			; 4E 4E 46 | Logical shift right (absolute)
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $D8			  ; D0 D8 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $64			  ; 64 64 | Store zero to zero page
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BVS $64			  ; 70 64 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY $6033			; CC 33 60 | Compare Y register (absolute)
	STA				  ; 9F 18 E7 1B | Store accumulator to absolute long,X
	ASL $C0FF			; 0E FF C0 | Arithmetic shift left (absolute)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	ROL $FFC1,X		  ; 3E C1 FF | Rotate left (absolute,X)
	INC $CF00,X		  ; FE 00 CF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	BEQ $78			  ; F0 78 | Branch if equal
	BRA $38			  ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D1
; Address: $F7F2CA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D1:
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDX $7E			  ; A6 7E | Load from zero page into X register
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BNE $38			  ; D0 38 | Branch if not equal
	BVS $18			  ; 70 18 | Branch if overflow set
	BVS $98			  ; 70 98 | Branch if overflow set
	BCS $D8			  ; B0 D8 | Branch if carry set
	PLP				  ; 28 | Pull processor status from stack
	JMP $C0CC98		  ; 5C 98 CC C0 | Jump to address long
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D3
; Address: $F7F2FD
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D3:
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BMI $C3			  ; 30 C3 | Branch if negative
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	BIT $FB			  ; 24 FB | Test bits in accumulator (zero page)
	ORA $0FFE,Y		  ; 19 FE 0F | Logical OR with accumulator (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	INC $FDC3,X		  ; FE C3 FD | Increment (absolute,X)
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	ROR $FEFE,X		  ; 7E FE FE | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $DCFC			; 2C FC DC | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D4
; Address: $F7F368
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D4:
	BPL $FC			  ; 10 FC | Branch if positive
	ORA $83F1			; 0D F1 83 | Logical OR with accumulator (absolute)
	LDA				  ; BF 1C 03 3C | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ASL $1E14,X		  ; 1E 14 1E | Arithmetic shift left (absolute,X)
	CMP ($DF),Y		  ; D1 DF | Compare accumulator ((zero page),Y)
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $D8			  ; 80 D8 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D5
; Address: $F7F39B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D5:
	JSR $C43C			; 20 3C C4 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $00F0			; EC F0 00 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	AND ($21,X)		  ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D6
; Address: $F7F3E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D6:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	LDA $0F10AF		  ; AF AF 10 0F | Load from absolute long address into accumulator
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D7
; Address: $F7F3F4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D7:
	JSR $401F			; 20 1F 40 | Jump to subroutine
	EOR #$36			 ; 49 36 | Exclusive OR with accumulator (immediate)
	BPL $AF			  ; 10 AF | Branch if positive
	BVC $88			  ; 50 88 | Branch if overflow clear
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D8
; Address: $F7F421
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D8:
	SED				  ; F8 | Set decimal mode flag
	ORA $4B7D			; 0D 7D 4B | Logical OR with accumulator (absolute)
	LSR $303F,X		  ; 5E 3F 30 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1D9
; Address: $F7F42E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1D9:
	JSR $F81F			; 20 1F F8 | Jump to subroutine
	ADC $7B02,X		  ; 7D 02 7B | Add with carry (absolute,X)
	ROR $3801,X		  ; 7E 01 38 | Rotate right (absolute,X)
	BMI $0F			  ; 30 0F | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1DB
; Address: $F7F449
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1DB:
	JSR $E0F0			; 20 F0 E0 | Game work RAM access
	BVS $E0			  ; 70 E0 | Game work RAM access
	BVS $E0			  ; 70 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $01			  ; F0 01 | Branch if equal
	INC $F906,X		  ; FE 06 F9 | Increment (absolute,X)
	CMP ($AE,X)		  ; C1 AE | Compare accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $2001,X		  ; 3E 01 20 | Rotate left (absolute,X)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BEQ $1E			  ; F0 1E | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $C614			; 4C 14 C6 | Jump to address
	STX $D4			  ; 86 D4 | Store X register to zero page
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $58			  ; 70 58 | Branch if overflow set
	BCC $18			  ; 90 18 | Branch if carry clear
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEP #$FE			 ; E2 FE | Set processor status bits

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1DC
; Address: $F7F4C2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1DC:
	CMP $05FD			; CD FD 05 | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1DD
; Address: $F7F4CA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1DD:
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $FD07,X		  ; 1E 07 FD | Arithmetic shift left (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BRA $28			  ; 80 28 | Branch always
	BMI $48			  ; 30 48 | Branch if negative
	CPY $E624			; CC 24 E6 | Compare Y register (absolute)
	AND ($E2,X)		  ; 21 E2 | Logical AND with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA $1DE3,Y		  ; 19 E3 1D | Logical OR with accumulator (absolute,Y)
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1DE
; Address: $F7F506
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1DE:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BNE $18			  ; D0 18 | Branch if not equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	AND $0FC6,Y		  ; 39 C6 0F | Logical AND with accumulator (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $FF01,X		  ; FD 01 FF | Subtract with carry (absolute,X)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $B13F			; CE 3F B1 | Decrement (absolute)
	SBC ($4C),Y		  ; F1 4C | Subtract with carry ((zero page),Y)
	JMP $FE82			; 4C 82 FE | Jump to address
	CPY #$71			 ; C0 71 | Compare Y register (immediate)
	ASL $33CC			; 0E CC 33 | Arithmetic shift left (absolute)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	BMI $10			  ; 30 10 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	BCS $D8			  ; B0 D8 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1DF
; Address: $F7F56C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1DF:
	BMI $58			  ; 30 58 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E1
; Address: $F7F57F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E1:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $0F			  ; 10 0F | Branch if positive
	BMI $0F			  ; 30 0F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $18E7,X		  ; 1D E7 18 | Logical OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	EOR $7A			  ; 45 7A | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVS $D0			  ; 70 D0 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 B8 E0 | Load from absolute long,X into accumulator
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA $8D8F88		  ; AF 88 8F 8D | Load from absolute long address into accumulator
	STX $5F5E			; 8E 5E 5F | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	LDA $708F50		  ; AF 50 8F 70 | Load from absolute long address into accumulator
	STA $205F70		  ; 8F 70 5F 20 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E2
; Address: $F7F5F9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E2:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E3
; Address: $F7F612
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E3:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $E0			  ; 70 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E4
; Address: $F7F645
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E4:
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $18			  ; 70 18 | Branch if overflow set
	BEQ $B0			  ; F0 B0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E6
; Address: $F7F651
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E6:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E7
; Address: $F7F666
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E7:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1E9
; Address: $F7F69E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1E9:
	JSR $0600			; 20 00 06 | Jump to subroutine
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1EA
; Address: $F7F6A5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1EA:
	JSR $4040			; 20 40 40 | Jump to subroutine
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	STA $00068F		  ; 8F 8F 06 00 | Store accumulator to absolute long address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1EC
; Address: $F7F6B7
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1EC:
	ROL $3E41,X		  ; 3E 41 3E | Rotate left (absolute,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	STA $000770		  ; 8F 70 07 00 | Store accumulator to absolute long address
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $1807			; 0E 07 18 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	DEC $14			  ; C6 14 | Decrement (zero page)
	INC $FE04			; EE 04 FE | Increment (absolute)
	ASL $3CFC			; 0E FC 3C | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BVC $18			  ; 50 18 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1EE
; Address: $F7F711
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1EE:
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F0
; Address: $F7F718
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	INC $C6C1,X		  ; FE C1 C6 | Increment (absolute,X)
	ASL $1807			; 0E 07 18 | Arithmetic shift left (absolute)
	ROL $C001,X		  ; 3E 01 C0 | Rotate left (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ASL $34FC,X		  ; 1E FC 34 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $1E			  ; F0 1E | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BCS $44			  ; B0 44 | Branch if carry set
	BVS $84			  ; 70 84 | Branch if overflow set
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F1
; Address: $F7F770
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F1:
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BMI $98			  ; 30 98 | Branch if negative
	BPL $0C			  ; 10 0C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F2
; Address: $F7F780
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F2:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $70			  ; 10 70 | Branch if positive
	BVS $B8			  ; 70 B8 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	PEA #$F434		   ; F4 34 F4 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	BCS $20			  ; B0 20 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA $4F488F		  ; 8F 8F 48 4F | Store accumulator to absolute long address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0502			; 0D 02 05 | Logical OR with accumulator (absolute)
	STA $304F70		  ; 8F 70 4F 30 | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F3
; Address: $F7F802
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F3:
	PLY				  ; 7A | Pull Y register from stack
	ROR $7AB7,X		  ; 7E B7 7A | Rotate right (absolute,X)
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	SEP #$BC			 ; E2 BC | Set processor status bits
	SEP #$DC			 ; E2 DC | Set processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	LDA $AEF9,Y		  ; B9 F9 AE | Load from absolute,Y into accumulator
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	AND $7CFF,X		  ; 3D FF 7C | Logical AND with accumulator (absolute,X)
	INC $FD09,X		  ; FE 09 FD | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	INC $2029			; EE 29 20 | Increment (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F4
; Address: $F7F854
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F4:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	ASL $A6			  ; 06 A6 | Arithmetic shift left (zero page)
	EOR ($71),Y		  ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $18			  ; 66 18 | Rotate right (zero page)
	LDA ($0E),Y		  ; B1 0E | Load from (zero page),Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	ASL $301F,X		  ; 1E 1F 30 | Arithmetic shift left (absolute,X)
	ROL $DCD8,X		  ; 3E D8 DC | Rotate left (absolute,X)
	BNE $D8			  ; D0 D8 | Branch if not equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F5
; Address: $F7F88F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F5:
	BRA $7F			  ; 80 7F | Branch always
	BRA $1F			  ; 80 1F | Branch always
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F8
; Address: $F7F89D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F8:
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPY $CC			  ; C4 CC | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1F9
; Address: $F7F8AA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1F9:
	JSL $F711E6		  ; 22 E6 11 F7 | Jump to subroutine long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $0800,Y		  ; 19 00 08 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	JMP $10BC2C		  ; 5C 2C BC 10 | Jump to address long
	BCS $58			  ; B0 58 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $0C7000		  ; 5C 00 70 0C | Jump to address long
	CLV				  ; B8 | Clear overflow flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1FA
; Address: $F7F8E4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1FA:
	BEQ $60			  ; F0 60 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BNE $EC			  ; D0 EC | Branch if not equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1FB
; Address: $F7F8F5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1FB:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1FC
; Address: $F7F90E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1FC:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)
	INC $FF0B,X		  ; FE 0B FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1FE
; Address: $F7F98A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1FE:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_1FF
; Address: $F7F99C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_1FF:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BRA $21			  ; 80 21 | PPU graphics register access
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ROR $1F9E,X		  ; 7E 9E 1F | Rotate right (absolute,X)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $1F01,X		  ; FE 01 1F | Increment (absolute,X)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $1E21			; 0D 21 1E | Logical OR with accumulator (absolute)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LSR $3E			  ; 46 3E | Logical shift right (zero page)
	LSR $3E			  ; 46 3E | Logical shift right (zero page)
	STZ $1C			  ; 64 1C | Store zero to zero page
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ROR $7E01,X		  ; 7E 01 7E | Rotate right (absolute,X)
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_200
; Address: $F7FA24
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_200:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_201
; Address: $F7FA2C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_201:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $E7			  ; F0 E7 | Branch if equal
	ASL $3EFF,X		  ; 1E FF 3E | Arithmetic shift left (absolute,X)
	INC $FD05,X		  ; FE 05 FD | Increment (absolute,X)
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	STZ $811E			; 9C 1E 81 | Store zero to absolute
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	BRA $F3			  ; 80 F3 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_202
; Address: $F7FA74
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_202:
	STZ $FF60,X		  ; 9E 60 FF | Store zero to absolute,X
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_203
; Address: $F7FA8A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_203:
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BNE $38			  ; D0 38 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	INC $FE0A,X		  ; FE 0A FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_205
; Address: $F7FAB5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_205:
	JSR $0001			; 20 01 00 | Jump to subroutine
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C3			 ; 42 C3 | Reserved instruction
	ROL $1E0D,X		  ; 3E 0D 1E | Rotate left (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	ASL $72			  ; 06 72 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_206
; Address: $F7FAD4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_206:
	REP #$3C			 ; C2 3C | Reset processor status bits
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	CMP ($1F,X)		  ; C1 1F | Compare accumulator ((zero page,X))
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_207
; Address: $F7FAFE
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_207:
	BRA $80			  ; 80 80 | Branch always
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	INC $FE34,X		  ; FE 34 FE | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	DEC $BAAA,X		  ; DE AA BA | Decrement (absolute,X)
	STA ($B1),Y		  ; 91 B1 | Store accumulator to (zero page),Y
	AND $39B9,Y		  ; 39 B9 39 | Logical AND with accumulator (absolute,Y)
	ADC $4141,Y		  ; 79 41 41 | Add with carry (absolute,Y)
	WDM #$C3			 ; 42 C3 | Reserved instruction
	INC $2C			  ; E6 2C | Increment (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $0E			  ; 70 0E | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	ROL $3CC2,X		  ; 3E C2 3C | Rotate left (absolute,X)
	ORA $FC14,Y		  ; 19 14 FC | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_208
; Address: $F7FB4A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_208:
	JSR $1BF8			; 20 F8 1B | Jump to subroutine
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BIT $3E			  ; 24 3E | Test bits in accumulator (zero page)
	BIT $6A36			; 2C 36 6A | Test bits in accumulator (absolute)
	INC $BDE3,X		  ; FE E3 BD | Increment (absolute,X)
	ADC ($28,X)		  ; 61 28 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_209
; Address: $F7FB71
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_209:
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	LDY $7E4C,X		  ; BC 4C 7E | Load from absolute,X into Y register
	STX $0000			; 8E 00 00 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $E0			  ; 30 E0 | Game work RAM access
	BCS $40			  ; B0 40 | Branch if carry set
	INX				  ; E8 | Increment X register
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	INC $FD0D,X		  ; FE 0D FD | Increment (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_20B
; Address: $F7FC0A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_20B:
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $FD07,X		  ; 1E 07 FD | Arithmetic shift left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $28			  ; 80 28 | Branch always
	BMI $4B			  ; 30 4B | Branch if negative
	CPY $E624			; CC 24 E6 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_20C
; Address: $F7FC2A
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_20C:
	JSR $34E2			; 20 E2 34 | Jump to subroutine
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $18			  ; E6 18 | Increment (zero page)
	SEP #$1C			 ; E2 1C | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	INC $7000,X		  ; FE 00 70 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $E0			  ; 06 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	BMI $18			  ; 30 18 | Branch if negative
	BPL $18			  ; 10 18 | Branch if positive
	BPL $3E			  ; 10 3E | Branch if positive
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	ASL $01F1			; 0E F1 01 | Arithmetic shift left (absolute)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 FF 00 | Load from absolute long,X into accumulator
	LDA $40F9,Y		  ; B9 F9 40 | Load from absolute,Y into accumulator
	RTI				  ; 40 | Return from interrupt
	STY $03FC			; 8C FC 03 | Store Y register to absolute address
	ADC $C006,Y		  ; 79 06 C0 | Add with carry (absolute,Y)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BNE $38			  ; D0 38 | Branch if not equal
	BEQ $18			  ; F0 18 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_20D
; Address: $F7FCA9
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_20D:
	STZ $CCB8			; 9C B8 CC | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $CE94			; 4C 94 CE | Jump to address
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BVS $B0			  ; 70 B0 | Branch if overflow set
	BEQ $30			  ; F0 30 | Branch if equal
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FF36,X		  ; FE 36 FF | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	ROL $21C1,X		  ; 3E C1 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_20E
; Address: $F7FCD1
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_20E:
	JSR $0102			; 20 02 01 | Jump to subroutine
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	INC $3D00,X		  ; FE 00 3D | Increment (absolute,X)
	ROL $3C03,X		  ; 3E 03 3C | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CMP $A4B9,Y		  ; D9 B9 A4 | Compare accumulator (absolute,Y)
	ROR $C13F,X		  ; 7E 3F C1 | Rotate right (absolute,X)
	STA				  ; 9F FF 1F FF | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	SBC $FC06,Y		  ; F9 06 FC | Subtract with carry (absolute,Y)
	INC $8001,X		  ; FE 01 80 | Increment (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_20F
; Address: $F7FD06
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_20F:
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	BMI $58			  ; 30 58 | Branch if negative
	BCS $D8			  ; B0 D8 | Branch if carry set
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_211
; Address: $F7FD1F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_211:
	JSR $7F87			; 20 87 7F | Jump to subroutine
	ORA $06FD			; 0D FD 06 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_212
; Address: $F7FD40
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_212:
	LDA				  ; BF C1 FE 81 | Load from absolute long,X into accumulator
	INC $1F			  ; E6 1F | Increment (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	ROR $C36E			; 6E 6E C3 | Rotate right (absolute)
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_213
; Address: $F7FD5A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_213:
	SEI				  ; 78 | Set interrupt disable flag
	INC $FF11			; EE 11 FF | Increment (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_214
; Address: $F7FD6A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_214:
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ROR $7AB7,X		  ; 7E B7 7A | Rotate right (absolute,X)
	CMP $BA			  ; C5 BA | Compare accumulator (zero page)
	SEP #$BC			 ; E2 BC | Set processor status bits
	LDX #$DC			 ; A2 DC | Load immediate value into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $989C			; 9C 9C 98 | Store zero to absolute
	STZ $DED8			; 9C D8 DE | Store zero to absolute
	BCS $BE			  ; B0 BE | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	BMI $9C			  ; 30 9C | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_216
; Address: $F7FDDD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_216:
	JSR $40BE			; 20 BE 40 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL $0E0C,X		  ; 1E 0C 0E | Arithmetic shift left (absolute,X)
	ASL $8E8C			; 0E 8C 8E | Arithmetic shift left (absolute)
	DEC $5C5A,X		  ; DE 5A 5C | Decrement (absolute,X)
	SBC $F17E,Y		  ; F9 7E F1 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_217
; Address: $F7FDEF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_217:
	ROR $E01E,X		  ; 7E 1E E0 | Game work RAM access
	ASL $0EF0			; 0E F0 0E | Arithmetic shift left (absolute)
	BEQ $8E			  ; F0 8E | Branch if equal
	BVS $DE			  ; 70 DE | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_218
; Address: $F7FDF9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_218:
	JSR $205E			; 20 5E 20 | Jump to subroutine
	BMI $1F			  ; 30 1F | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	DEC $14			  ; C6 14 | Decrement (zero page)
	INC $FC08			; EE 08 FC | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $38			  ; F0 38 | Branch if equal
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	LDX $C6C1,Y		  ; BE C1 C6 | Load from absolute,Y into X register
	ASL $1807			; 0E 07 18 | Arithmetic shift left (absolute)
	ROL $C001,X		  ; 3E 01 C0 | Rotate left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	WDM #$48			 ; 42 48 | Reserved instruction
	TSX				  ; BA | Transfer stack pointer to X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LDY $0C38,X		  ; BC 38 0C | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BEQ $1E			  ; F0 1E | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CLV				  ; B8 | Clear overflow flag
	JMP $8450			; 4C 50 84 | Jump to address
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_219
; Address: $F7FED5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_219:
	BVS $78			  ; 70 78 | Branch if overflow set
	BCS $38			  ; B0 38 | Branch if carry set
	BMI $18			  ; 30 18 | Branch if negative
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INC $CAC1,X		  ; FE C1 CA | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $C001,X		  ; 3E 01 C0 | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ASL $0CFC,X		  ; 1E FC 0C | Arithmetic shift left (absolute,X)
	BEQ $1E			  ; F0 1E | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_21A
; Address: $F7FF25
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_21A:
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BCS $20			  ; B0 20 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $47			  ; 06 47 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	AND $387D,Y		  ; 39 7D 38 | Logical AND with accumulator (absolute,Y)
	ORA $0304			; 0D 04 03 | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	AND $7D			  ; 25 7D | Logical AND with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6E_DmaFunction_21B
; Address: $F7FF7C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6E_DmaFunction_21B:
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($7E),Y		  ; B1 7E | Load from (zero page),Y into accumulator
	EOR $BA32			; 4D 32 BA | Exclusive OR with accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	EOR #$4A			 ; 49 4A | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	EOR #$06			 ; 49 06 | Exclusive OR with accumulator (immediate)
	JMP $00BF			; 4C BF 00 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $86			  ; 06 86 | Arithmetic shift left (zero page)
	STA $C9			  ; 85 C9 | Store accumulator to zero page
	DEX				  ; CA | Decrement X register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	DEC $C8			  ; C6 C8 | Decrement (zero page)
	SBC $00F0			; ED F0 00 | Subtract with carry (absolute)
