;==============================================================================
; Dragon Quest III - Bank $14
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $CA0000-$CA7FFF
; Instructions: 9515
; Bytes: 32771
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_14"

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_000
; Address: $CA8010
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_000:
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	PHX				  ; DA | Push X register to stack
	STY $0601			; 8C 01 06 | Store Y register to absolute address
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $000502		  ; 8F 02 05 00 | Update graphics data
	LSR $03			  ; 46 03 | Logical shift right (zero page)
	ORA $3B04			; 0D 04 3B | Logical OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_001
; Address: $CA807E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_001:
	STZ $0704			; 9C 04 07 | Store zero to absolute
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	LDA ($05,X)		  ; A1 05 | Read graphics status
	STZ $06			  ; 64 06 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	LDA #$06			 ; A9 06 | Read graphics status
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	ORA $2C			  ; 05 2C | Logical OR with accumulator (zero page)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_002
; Address: $CA80FC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_002:
	BRA $04			  ; 80 04 | Branch always
	STZ $01			  ; 64 01 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	CPX $05			  ; E4 05 | Compare X register (zero page)
	ORA #$60			 ; 09 60 | Logical OR with accumulator (immediate)
	ASL $E0			  ; 06 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BVC $07			  ; 50 07 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_003
; Address: $CA811E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_003:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVS $07			  ; 70 07 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_004
; Address: $CA812B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_004:
	ORA $0780			; 0D 80 07 | Logical OR with accumulator (absolute)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	ASL $0874			; 0E 74 08 | Arithmetic shift left (absolute)
	BCC $01			  ; 90 01 | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLV				  ; B8 | Clear overflow flag
	BPL $BC			  ; 10 BC | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $00A4			; 0D A4 00 | Logical OR with accumulator (absolute)
	LDY $0D			  ; A4 0D | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_005
; Address: $CA8156
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_005:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY $0D			  ; C4 0D | Compare Y register (zero page)
	STZ $01			  ; 64 01 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	BPL $14			  ; 10 14 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	CPX $10			  ; E4 10 | Compare X register (zero page)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	BVS $11			  ; 70 11 | Branch if overflow set
	ORA $118C,Y		  ; 19 8C 11 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA ($28),Y		  ; 11 28 | Logical OR with accumulator ((zero page),Y)
	LDY $0411,X		  ; BC 11 04 | Load from absolute,X into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	WDM #$76			 ; 42 76 | Reserved instruction
	SBC $070E			; ED 0E 07 | Subtract with carry (absolute)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	SBC $060D			; ED 0D 06 | Subtract with carry (absolute)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	SBC $060C			; ED 0C 06 | Subtract with carry (absolute)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	SBC $0909			; ED 09 09 | Subtract with carry (absolute)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ROL $ED77			; 2E 77 ED | Rotate left (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BVS $77			  ; 70 77 | Branch if overflow set
	SBC $0A0B			; ED 0B 0A | Subtract with carry (absolute)
	SBC $090C			; ED 0C 09 | Subtract with carry (absolute)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ROL $ED78,X		  ; 3E 78 ED | Rotate left (absolute,X)
	ORA $0701			; 0D 01 07 | Logical OR with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_006
; Address: $CA8203
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_006:
	SEI				  ; 78 | Set interrupt disable flag
	SBC $100C			; ED 0C 10 | Subtract with carry (absolute)
	SBC #$78			 ; E9 78 | Subtract with carry (immediate)
	SBC $120A			; ED 0A 12 | Subtract with carry (absolute)
	ADC $0BED,Y		  ; 79 ED 0B | Add with carry (absolute,Y)
	ADC $0BED,Y		  ; 79 ED 0B | Add with carry (absolute,Y)
	LSR $7A			  ; 46 7A | Logical shift right (zero page)
	SBC $0F0C			; ED 0C 0F | Subtract with carry (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	SBC $0809			; ED 09 08 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR $ED7B			; 4E 7B ED | Logical shift right (absolute)
	STX $7B			  ; 86 7B | Store X register to zero page
	SBC $150C			; ED 0C 15 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC $0F0B			; ED 0B 0F | Subtract with carry (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	LDA $ED7C,X		  ; BD 7C ED | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ROL $ED7D			; 2E 7D ED | Rotate left (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	JMP $1EED7D		  ; 5C 7D ED 1E | Jump to address long
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	STA $14ED7D		  ; 8F 7D ED 14 | Update graphics data
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ADC $14ED,X		  ; 7D ED 14 | Add with carry (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ROR $11ED,X		  ; 7E ED 11 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	LDA $01ED7E		  ; AF 7E ED 01 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $7E			  ; E6 7E | Increment (zero page)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	SBC #$7E			 ; E9 7E | Subtract with carry (immediate)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	CPX $ED7E			; EC 7E ED | Compare X register (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $01ED,X		  ; 7E ED 01 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $02ED,X		  ; 7E ED 02 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $02ED,X		  ; 7E ED 02 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ROR $02ED,X		  ; 7E ED 02 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_007
; Address: $CA82CC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_007:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $02ED,X		  ; 7E ED 02 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ASL $ED7F			; 0E 7F ED | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA $ED7F,X		  ; 1D 7F ED | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_008
; Address: $CA8310
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_008:
	JSL $02ED7F		  ; 22 7F ED 02 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	BIT $ED7F			; 2C 7F ED | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($7F),Y		  ; 31 7F | Logical AND with accumulator ((zero page),Y)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	EOR $ED7F,Y		  ; 59 7F ED | Exclusive OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $ED7F,X		  ; 5E 7F ED | Logical shift right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ADC $ED7F			; 6D 7F ED | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	STX $7F			  ; 86 7F | Store X register to zero page
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	PHB				  ; 8B | Push data bank register to stack
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	BCC $7F			  ; 90 7F | Branch if carry clear
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_009
; Address: $CA83E1
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_009:
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	STA				  ; 9F 7F ED 02 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $7F			  ; A4 7F | Load from zero page into Y register
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	LDA #$7F			 ; A9 7F | Read graphics status
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	LDX $ED7F			; AE 7F ED | Load from absolute address into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	CLV				  ; B8 | Clear overflow flag
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	LDA $ED7F,X		  ; BD 7F ED | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	CMP $7F			  ; C5 7F | Compare accumulator (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	DEX				  ; CA | Decrement X register
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	CMP $ED7F,Y		  ; D9 7F ED | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $ED7F,X		  ; DE 7F ED | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $ED7F			; ED 7F ED | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $80			  ; 10 80 | Branch if positive
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00A
; Address: $CA84DF
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ROL $ED80			; 2E 80 ED | Rotate left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $ED80,X		  ; 3D 80 ED | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $ED80,Y		  ; 59 80 ED | Exclusive OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00B
; Address: $CA853F
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00B:
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $ED80			; 6E 80 ED | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($80),Y		  ; 91 80 | Update graphics data
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 80 ED 03 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX $80			  ; A6 80 | Load from zero page into X register
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	LDA $ED80			; AD 80 ED | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00C
; Address: $CA85AE
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	REP #$80			 ; C2 80 | Reset processor status bits
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	CMP #$80			 ; C9 80 | Compare accumulator (immediate)
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	BNE $80			  ; D0 80 | Branch if not equal
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $ED80,X		  ; DE 80 ED | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $80			  ; E5 80 | Subtract with carry (zero page)
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	CPX $ED80			; EC 80 ED | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	BRA $ED			  ; 80 ED | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $ED81,X		  ; 1D 81 ED | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $ED81,Y		  ; 39 81 ED | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $ED81			; 4E 81 ED | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00D
; Address: $CA8682
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00D:
	JMP $03ED81		  ; 5C 81 ED 03 | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $ED81,X		  ; 7D 81 ED | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT #$81			 ; 89 81 | Test bits in accumulator (immediate)
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	BCC $81			  ; 90 81 | Branch if carry clear
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $ED81,X		  ; 9E 81 ED | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($81),Y		  ; B1 81 | Read graphics status
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	CLV				  ; B8 | Clear overflow flag
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 81 ED 03 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $81			  ; C4 81 | Compare Y register (zero page)
	SBC $0103			; ED 03 01 | Subtract with carry (absolute)
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $ED81,Y		  ; D9 81 ED | Compare accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $81			  ; E6 81 | Increment (zero page)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	SBC #$81			 ; E9 81 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00E
; Address: $CA8753
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00E:
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	CPX $ED81			; EC 81 ED | Compare X register (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $38			  ; 85 38 | Update graphics data
	INX				  ; E8 | Increment X register
	BPL $51			  ; 10 51 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $39			  ; 05 39 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	AND ($39,X)		  ; 21 39 | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ASL $0208			; 0E 08 02 | Arithmetic shift left (absolute)
	AND $12E8,Y		  ; 39 E8 12 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND $13E8,Y		  ; 39 E8 13 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	DEC $39			  ; C6 39 | Decrement (zero page)
	INX				  ; E8 | Increment X register
	ASL $0002			; 0E 02 00 | Arithmetic shift left (absolute)
	BPL $3A			  ; 10 3A | Branch if positive
	INX				  ; E8 | Increment X register
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $0002			; 0E 02 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_00F
; Address: $CA87BD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_00F:
	JSL $12E83A		  ; 22 3A E8 12 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $E83A,Y		  ; 39 3A E8 | Logical AND with accumulator (absolute,Y)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	STA $0FE83A		  ; 8F 3A E8 0F | Update graphics data
	BIT $0D			  ; 24 0D | Test bits in accumulator (zero page)
	CPY #$3A			 ; C0 3A | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0002			; 0E 02 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	BIT $09			  ; 24 09 | Test bits in accumulator (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_010
; Address: $CA87EE
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_010:
	ORA $0914			; 0D 14 09 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	ADC $3C			  ; 65 3C | Add with carry (zero page)
	INX				  ; E8 | Increment X register
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	LDA #$3C			 ; A9 3C | Read graphics status
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $E83D,Y		  ; 19 3D E8 | Logical OR with accumulator (absolute,Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	AND $09E8,X		  ; 3D E8 09 | Logical AND with accumulator (absolute,X)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	AND $22E8,X		  ; 3D E8 22 | Logical AND with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	BPL $0D			  ; 10 0D | Branch if positive
	DEX				  ; CA | Decrement X register
	AND $06E8,X		  ; 3D E8 06 | Logical AND with accumulator (absolute,X)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ROL $03E8,X		  ; 3E E8 03 | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $04E8,X		  ; 3E E8 04 | Rotate left (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ROL $06E8,X		  ; 3E E8 06 | Rotate left (absolute,X)
	ROL $33E8,X		  ; 3E E8 33 | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CMP $E83E,X		  ; DD 3E E8 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0208			; 0D 08 02 | Logical OR with accumulator (absolute)
	STY $E83F			; 8C 3F E8 | Store Y register to absolute address
	EOR #$0A			 ; 49 0A | Exclusive OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_011
; Address: $CA8885
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_011:
	INX				  ; E8 | Increment X register
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	LDX $E840,Y		  ; BE 40 E8 | Load from absolute,Y into X register
	ORA $0E0F			; 0D 0F 0E | Logical OR with accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	AND $08			  ; 25 08 | Logical AND with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	ASL $062D,X		  ; 1E 2D 06 | Arithmetic shift left (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	LSR $E841,X		  ; 5E 41 E8 | Logical shift right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR ($E8,X)		  ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $020C			; 0D 0C 02 | Logical OR with accumulator (absolute)
	SBC $E841,X		  ; FD 41 E8 | Subtract with carry (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	WDM #$E8			 ; 42 E8 | Reserved instruction
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	BIT #$42			 ; 89 42 | Hardware register operation
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	WDM #$E8			 ; 42 E8 | Reserved instruction
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	WDM #$E8			 ; 42 E8 | Reserved instruction
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BMI $43			  ; 30 43 | Branch if negative
	INX				  ; E8 | Increment X register
	AND $110B			; 2D 0B 11 | Logical AND with accumulator (absolute)
	ADC #$44			 ; 69 44 | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR $E8			  ; 45 E8 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_012
; Address: $CA8904
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_012:
	JSL $0F0D2F		  ; 22 2F 0D 0F | Jump to subroutine long
	EOR $E8			  ; 45 E8 | Exclusive OR with accumulator (zero page)
	BIT $070C			; 2C 0C 07 | Test bits in accumulator (absolute)
	EOR $E8			  ; 45 E8 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_013
; Address: $CA8918
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_013:
	ORA $020B,Y		  ; 19 0B 02 | Logical OR with accumulator (absolute,Y)
	ORA $E847,X		  ; 1D 47 E8 | Logical OR with accumulator (absolute,X)
	ASL $1028			; 0E 28 10 | Arithmetic shift left (absolute)
	LDX $47			  ; A6 47 | Load from zero page into X register
	INX				  ; E8 | Increment X register
	BIT $0853			; 2C 53 08 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	JMP $0DE849		  ; 5C 49 E8 0D | Jump to address long
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ADC ($49),Y		  ; 71 49 | Add with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	ORA ($15),Y		  ; 11 15 | Logical OR with accumulator ((zero page),Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	STA ($49),Y		  ; 91 49 | Update graphics data
	INX				  ; E8 | Increment X register
	ORA $26			  ; 05 26 | Logical OR with accumulator (zero page)
	CPY $49			  ; C4 49 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	EOR #$E8			 ; 49 E8 | Exclusive OR with accumulator (immediate)
	ORA $0F0E,Y		  ; 19 0E 0F | Logical OR with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	INX				  ; E8 | Increment X register
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	STY $4A			  ; 84 4A | Store Y register to zero page
	INX				  ; E8 | Increment X register
	BIT $0D28			; 2C 28 0D | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $4B			  ; 05 4B | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	BPL $0D			  ; 10 0D | Branch if positive
	INX				  ; E8 | Increment X register
	ASL $0208			; 0E 08 02 | Arithmetic shift left (absolute)
	JMP $0AE8			; 4C E8 0A | Jump to address
	EOR ($4C),Y		  ; 51 4C | Exclusive OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $E84C			; 6E 4C E8 | Rotate right (absolute)
	ASL $0917			; 0E 17 09 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $0BE8			; 4C E8 0B | Jump to address
	ORA $0A0D,X		  ; 1D 0D 0A | Logical OR with accumulator (absolute,X)
	JMP $0DE8			; 4C E8 0D | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_014
; Address: $CA89B0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_014:
	ASL $090C,X		  ; 1E 0C 09 | Arithmetic shift left (absolute,X)
	EOR $15E8			; 4D E8 15 | Exclusive OR with accumulator (absolute)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	INC $4D			  ; E6 4D | Increment (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($4E),Y		  ; 11 4E | Logical OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	LSR $4E			  ; 46 4E | Logical shift right (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_016
; Address: $CA89DA
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_016:
	LSR $0FE8			; 4E E8 0F | Logical shift right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	ORA $0207,Y		  ; 19 07 02 | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ROR $E84F			; 6E 4F E8 | Rotate right (absolute)
	BPL $09			  ; 10 09 | Branch if positive
	ORA $0204			; 0D 04 02 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	AND ($10,X)		  ; 21 10 | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA $0617,X		  ; 1D 17 06 | Logical OR with accumulator (absolute,X)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	STA				  ; 9F 50 E8 14 | Update graphics data
	INC				  ; 1A | Increment accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $51			  ; 06 51 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $E851			; 0E 51 E8 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_017
; Address: $CA8A4B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_017:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR ($E8),Y		  ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND ($51,X)		  ; 21 51 | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	EOR ($E8),Y		  ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
	BVC $51			  ; 50 51 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	JMP $04E851		  ; 5C 51 E8 04 | Jump to address long
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ADC ($51,X)		  ; 61 51 | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ROR $E851			; 6E 51 E8 | Rotate right (absolute)
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	EOR ($E8),Y		  ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_018
; Address: $CA8A91
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_018:
	JSL $030C0B		  ; 22 0B 0C 03 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	BCC $52			  ; 90 52 | Branch if carry clear
	INX				  ; E8 | Increment X register
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $0309			; 0D 09 03 | Logical OR with accumulator (absolute)
	LDY $E852			; AC 52 E8 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	LDA ($52),Y		  ; B1 52 | Read graphics status
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_019
; Address: $CA8AB4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_019:
	JSR $0620			; 20 20 06 | Jump to subroutine
	INX				  ; E8 | Increment X register
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	STA				  ; 9F 53 E8 01 | Update graphics data
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_01A
; Address: $CA8AD5
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_01A:
	LDX $53			  ; A6 53 | Load from zero page into X register
	INX				  ; E8 | Increment X register
	ASL $0901			; 0E 01 09 | Arithmetic shift left (absolute)
	LDA #$53			 ; A9 53 | Read graphics status
	INX				  ; E8 | Increment X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA $E853			; AD 53 E8 | Read graphics status
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BCS $53			  ; B0 53 | Branch if carry set
	INX				  ; E8 | Increment X register
	ORA $0F10,Y		  ; 19 10 0F | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ORA $0B04			; 0D 04 0B | Logical OR with accumulator (absolute)
	BPL $03			  ; 10 03 | Branch if positive
	INX				  ; E8 | Increment X register
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $030B			; 0E 0B 03 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	INX				  ; E8 | Increment X register
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL $03			  ; 26 03 | Rotate left (zero page)
	INX				  ; E8 | Increment X register
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ROL $03			  ; 26 03 | Rotate left (zero page)
	AND $E854,X		  ; 3D 54 E8 | Logical AND with accumulator (absolute,X)
	AND $0808,Y		  ; 39 08 08 | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	SBC $E854,X		  ; FD 54 E8 | Subtract with carry (absolute,X)
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $55			  ; 50 55 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	ORA $0312			; 0D 12 03 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	ASL $030B,X		  ; 1E 0B 03 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	LDX $E855			; AE 55 E8 | Load from absolute address into X register
	INX				  ; E8 | Increment X register
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_01B
; Address: $CA8B6A
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_01B:
	ASL $031E,X		  ; 1E 1E 03 | Arithmetic shift left (absolute,X)
	SBC $55			  ; E5 55 | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $031E,X		  ; 1E 1E 03 | Arithmetic shift left (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	ORA $0E29			; 0D 29 0E | Logical OR with accumulator (absolute)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	SBC ($55),Y		  ; F1 55 | Subtract with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	AND $E856			; 2D 56 E8 | Logical AND with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	ORA $0A1D,Y		  ; 19 1D 0A | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ADC ($56),Y		  ; 71 56 | Add with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	STA $56			  ; 85 56 | Update graphics data
	INX				  ; E8 | Increment X register
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $0309,X		  ; 1E 09 03 | Arithmetic shift left (absolute,X)
	SEP #$56			 ; E2 56 | Set processor status bits
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $0309,X		  ; 1E 09 03 | Arithmetic shift left (absolute,X)
	SBC $E856,X		  ; FD 56 E8 | Subtract with carry (absolute,X)
	AND $0C			  ; 25 0C | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_01C
; Address: $CA8BF5
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_01C:
	LSR $E857,X		  ; 5E 57 E8 | Logical shift right (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	INX				  ; E8 | Increment X register
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ADC $E857,Y		  ; 79 57 E8 | Add with carry (absolute,Y)
	BPL $32			  ; 10 32 | Branch if positive
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	ROR $E857,X		  ; 7E 57 E8 | Rotate right (absolute,X)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$57			 ; C9 57 | Compare accumulator (immediate)
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	ROL $58			  ; 26 58 | Rotate left (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	BVC $58			  ; 50 58 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	ROL $08			  ; 26 08 | Rotate left (zero page)
	LDY $58			  ; A4 58 | Load from zero page into Y register
	INX				  ; E8 | Increment X register
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	LDA $E858			; AD 58 E8 | Read graphics status
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	BPL $03			  ; 10 03 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $01E8,Y		  ; 59 E8 01 | Exclusive OR with accumulator (absolute,Y)
	ORA $0309			; 0D 09 03 | Logical OR with accumulator (absolute)
	AND ($59,X)		  ; 21 59 | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_01D
; Address: $CA8C78
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_01D:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $24E8,Y		  ; 59 E8 24 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	EOR $06E8,Y		  ; 59 E8 06 | Exclusive OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ORA $0306			; 0D 06 03 | Logical OR with accumulator (absolute)
	STA $06E85A		  ; 8F 5A E8 06 | Update graphics data
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	CMP ($5A,X)		  ; C1 5A | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	BNE $5A			  ; D0 5A | Branch if not equal
	INX				  ; E8 | Increment X register
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	BPL $1E			  ; 10 1E | Branch if positive
	EOR $E85B			; 4D 5B E8 | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC ($5B,X)		  ; 61 5B | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ADC $E85B,Y		  ; 79 5B E8 | Add with carry (absolute,Y)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	INC $E85B			; EE 5B E8 | Increment (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $5C			  ; 10 5C | Branch if positive
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_01F
; Address: $CA8CFA
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_01F:
	AND ($5C,X)		  ; 21 5C | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	JMP $1110E8		  ; 5C E8 10 11 | Jump to address long
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	JMP $180DE8		  ; 5C E8 0D 18 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	STA ($5C,X)		  ; 81 5C | Update graphics data
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	CPY $5C			  ; C4 5C | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	SEP #$5C			 ; E2 5C | Set processor status bits
	INX				  ; E8 | Increment X register
	BPL $06			  ; 10 06 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	EOR $07E8,X		  ; 5D E8 07 | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	EOR $07E8,X		  ; 5D E8 07 | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $21E8,X		  ; 5D E8 21 | PPU graphics register access
	ORA $0308			; 0D 08 03 | Logical OR with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	EOR $06E8,X		  ; 5D E8 06 | Exclusive OR with accumulator (absolute,X)
	ORA $030C			; 0D 0C 03 | Logical OR with accumulator (absolute)
	EOR $21E8,X		  ; 5D E8 21 | PPU graphics register access
	AND $1011,X		  ; 3D 11 10 | Logical AND with accumulator (absolute,X)
	SBC $5D			  ; E5 5D | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	AND ($44,X)		  ; 21 44 | Logical AND with accumulator ((zero page,X))
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	LDA ($5E,X)		  ; A1 5E | Read graphics status
	INX				  ; E8 | Increment X register
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	PHB				  ; 8B | Push data bank register to stack
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ORA $0003			; 0D 03 00 | Logical OR with accumulator (absolute)
	AND $60			  ; 25 60 | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	WDM #$60			 ; 42 60 | Reserved instruction

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_020
; Address: $CA8D83
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_020:
	INX				  ; E8 | Increment X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $030A			; 0E 0A 03 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_021
; Address: $CA8D8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_021:
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $E860,X		  ; 7E 60 E8 | Rotate right (absolute,X)
	ORA $1707,X		  ; 1D 07 17 | Logical OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_022
; Address: $CA8D9E
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_022:
	INX				  ; E8 | Increment X register
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ADC ($E8,X)		  ; 61 E8 | Add with carry ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $033D,X		  ; 1E 3D 03 | Arithmetic shift left (absolute,X)
	AND $61			  ; 25 61 | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $033D,X		  ; 1E 3D 03 | Arithmetic shift left (absolute,X)
	BIT $E861			; 2C 61 E8 | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $0309,X		  ; 1E 09 03 | Arithmetic shift left (absolute,X)
	BMI $61			  ; 30 61 | Branch if negative
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0308			; 0E 08 03 | Arithmetic shift left (absolute)
	ADC ($E8,X)		  ; 61 E8 | Add with carry ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $0A			  ; 10 0A | Branch if positive
	ADC $E861,Y		  ; 79 61 E8 | Add with carry (absolute,Y)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BRA $61			  ; 80 61 | Branch always
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($E8,X)		  ; 61 E8 | Add with carry ((zero page,X))
	ASL $031C			; 0E 1C 03 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	BPL $62			  ; 10 62 | Branch if positive
	INX				  ; E8 | Increment X register
	ORA $1511,X		  ; 1D 11 15 | Logical OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	ASL $0309,X		  ; 1E 09 03 | Arithmetic shift left (absolute,X)
	STA $E862,X		  ; 9D 62 E8 | Update graphics data
	ASL $0309,X		  ; 1E 09 03 | Arithmetic shift left (absolute,X)
	LDY $E862			; AC 62 E8 | Load from absolute address into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_023
; Address: $CA8E26
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_023:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	LDA $E862,X		  ; BD 62 E8 | Read graphics status
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	ORA $0A14,Y		  ; 19 14 0A | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_024
; Address: $CA8E6E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_024:
	JSR $0B04			; 20 04 0B | Jump to subroutine
	BPL $03			  ; 10 03 | Branch if positive
	STA $E863			; 8D 63 E8 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA $E863,Y		  ; B9 63 E8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $E8			  ; 64 E8 | Store zero to zero page
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STX $E864			; 8E 64 E8 | Store X register to absolute address
	STZ $E8			  ; 64 E8 | Store zero to zero page
	INC				  ; 1A | Increment accumulator
	BPL $17			  ; 10 17 | Branch if positive
	STZ $E8			  ; 64 E8 | Store zero to zero page
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	PHX				  ; DA | Push X register to stack
	STZ $E8			  ; 64 E8 | Store zero to zero page
	BPL $3D			  ; 10 3D | Branch if positive
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ADC $E8			  ; 65 E8 | Add with carry (zero page)
	ORA $1D2B			; 0D 2B 1D | Logical OR with accumulator (absolute)
	ADC $E8			  ; 65 E8 | Add with carry (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $0317,X		  ; 1E 17 03 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_025
; Address: $CA8EC6
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_025:
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	BPL $1A			  ; 10 1A | Branch if positive
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	TSX				  ; BA | Transfer stack pointer to X register
	ROR $E8			  ; 66 E8 | Rotate right (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($E867)		  ; 6C 67 E8 | Jump to address (absolute indirect)
	BPL $10			  ; 10 10 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	DEC $E868,X		  ; DE 68 E8 | Decrement (absolute,X)
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	ASL $0809			; 0E 09 08 | Arithmetic shift left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	INX				  ; E8 | Increment X register
	ASL $0722			; 0E 22 07 | Arithmetic shift left (absolute)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	BIT #$6A			 ; 89 6A | Test bits in accumulator (immediate)
	INX				  ; E8 | Increment X register
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_027
; Address: $CA8F3E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_027:
	JSL $08090A		  ; 22 0A 09 08 | Jump to subroutine long
	ADC ($6C,X)		  ; 61 6C | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_028
; Address: $CA8F47
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_028:
	JSL $080909		  ; 22 09 09 08 | Jump to subroutine long
	WDM #$6D			 ; 42 6D | Reserved instruction
	INX				  ; E8 | Increment X register
	ASL $0809			; 0E 09 08 | Arithmetic shift left (absolute)
	ASL $6E			  ; 06 6E | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_029
; Address: $CA8F58
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_029:
	BPL $10			  ; 10 10 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $03E8			; 6E E8 03 | Rotate right (absolute)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $04E8			; 6E E8 04 | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $25E8			; 6E E8 25 | Rotate right (absolute)
	ROL $0808			; 2E 08 08 | Rotate left (absolute)
	STY $6E			  ; 84 6E | Store Y register to zero page
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	INX				  ; E8 | Increment X register
	BPL $80			  ; 10 80 | Branch if positive
	ORA $4400			; 0D 00 44 | Logical OR with accumulator (absolute)
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BPL $10			  ; 10 10 | Branch if positive
	ASL $3600			; 0E 00 36 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	ASL $8900			; 0E 00 89 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	CPX #$72			 ; E0 72 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02A
; Address: $CA8FC1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02A:
	JSL $04E873		  ; 22 73 E8 04 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	STZ $73			  ; 64 73 | Store zero to zero page
	INX				  ; E8 | Increment X register
	STA $73			  ; 85 73 | Update graphics data
	INX				  ; E8 | Increment X register
	LDX $73			  ; A6 73 | Load from zero page into X register
	INX				  ; E8 | Increment X register
	CMP ($73,X)		  ; C1 73 | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	AND $E874			; 2D 74 E8 | Logical AND with accumulator (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02B
; Address: $CA9026
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02B:
	INX				  ; E8 | Increment X register
	BPL $40			  ; 10 40 | Branch if positive
	EOR #$75			 ; 49 75 | Exclusive OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02C
; Address: $CA9039
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02C:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ADC $10E8,Y		  ; 79 E8 10 | Add with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	CPY $79			  ; C4 79 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $10E8,Y		  ; 79 E8 10 | Add with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	EOR $7A			  ; 45 7A | Exclusive OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STZ $7A			  ; 64 7A | Store zero to zero page
	INX				  ; E8 | Increment X register
	BPL $19			  ; 10 19 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	AND #$15			 ; 29 15 | Logical AND with accumulator (immediate)
	ASL $001A			; 0E 1A 00 | Arithmetic shift left (absolute)
	STY $E87A			; 8C 7A E8 | Store Y register to absolute address
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	BIT $7C			  ; 24 7C | Test bits in accumulator (zero page)
	INX				  ; E8 | Increment X register
	STA ($03),Y		  ; 91 03 | Update graphics data
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	ASL $A5			  ; 06 A5 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BCC $0B			  ; 90 0B | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02D
; Address: $CA90F3
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02D:
	BEQ $0D			  ; F0 0D | Branch if equal
	STA ($01,X)		  ; 81 01 | Update graphics data
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	BPL $2D			  ; 10 2D | Branch if positive
	BPL $FD			  ; 10 FD | Branch if positive
	CPY $13			  ; C4 13 | Compare Y register (zero page)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SBC $C4			  ; E5 C4 | Subtract with carry (zero page)
	ASL $E51C,X		  ; 1E 1C E5 | Arithmetic shift left (absolute,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BVC $01			  ; 50 01 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CMP $D318			; CD 18 D3 | Compare accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$1A			 ; A0 1A | Load immediate value into Y register
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	ORA ($1D),Y		  ; 11 1D | Logical OR with accumulator ((zero page),Y)
	STZ $0001			; 9C 01 00 | Store zero to absolute
	LDA $221E			; AD 1E 22 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02E
; Address: $CA9156
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02E:
	JSR $0299			; 20 99 02 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $83			  ; 24 83 | Test bits in accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $2A			  ; 64 2A | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BIT $01F5			; 2C F5 01 | Test bits in accumulator (absolute)
	AND $CE2E			; 2D 2E CE | Logical AND with accumulator (absolute)
	BMI $3F			  ; 30 3F | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	EOR $0001,Y		  ; 59 01 00 | Exclusive OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7338,X		  ; 3D 38 73 | Logical AND with accumulator (absolute,X)
	BCS $3A			  ; B0 3A | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	ADC ($3E),Y		  ; 71 3E | Add with carry ((zero page),Y)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR ($46,X)		  ; 41 46 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $42			  ; 90 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_02F
; Address: $CA91D5
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_02F:
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	EOR $4844,Y		  ; 59 44 48 | Exclusive OR with accumulator (absolute,Y)
	LDA ($46,X)		  ; A1 46 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	EOR #$76			 ; 49 76 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($4B,X)		  ; 21 4B | Logical AND with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SBC $384D,Y		  ; F9 4D 38 | Subtract with carry (absolute,Y)
	AND ($50),Y		  ; 31 50 | Logical AND with accumulator ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	STA ($01,X)		  ; 81 01 | Update graphics data
	JMP $011C54		  ; 5C 54 1C 01 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	STA ($01,X)		  ; 81 01 | Update graphics data
	SBC $DA56,Y		  ; F9 56 DA | Subtract with carry (absolute,Y)
	EOR $01F1,Y		  ; 59 F1 01 | Exclusive OR with accumulator (absolute,Y)
	CPY $5B			  ; C4 5B | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	EOR $0209,X		  ; 5D 09 02 | Exclusive OR with accumulator (absolute,X)
	ORA ($5F),Y		  ; 11 5F | Logical OR with accumulator ((zero page),Y)
	EOR $0001,X		  ; 5D 01 00 | Exclusive OR with accumulator (absolute,X)
	ROR $6660			; 6E 60 66 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($5D,X)		  ; 61 5D | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($63),Y		  ; 31 63 | Logical AND with accumulator ((zero page),Y)
	STZ $01			  ; 64 01 | Store zero to zero page
	STZ $D3			  ; 64 D3 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ADC $D0			  ; 65 D0 | Add with carry (zero page)
	SEC				  ; 38 | Set carry flag
	ROR $05			  ; 66 05 | Rotate right (zero page)
	AND $0766,X		  ; 3D 66 07 | Logical AND with accumulator (absolute,X)
	ROR $05			  ; 66 05 | Rotate right (zero page)
	EOR #$66			 ; 49 66 | Exclusive OR with accumulator (immediate)
	ROR $03			  ; 66 03 | Rotate right (zero page)
	LSR $2C66			; 4E 66 2C | Logical shift right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR $4D			  ; 66 4D | Rotate right (zero page)
	ROR $19			  ; 66 19 | Rotate right (zero page)
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	SBC $1966,Y		  ; F9 66 19 | Subtract with carry (absolute,Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_030
; Address: $CA92C3
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_030:
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ROR $0667,X		  ; 7E 67 06 | Rotate right (absolute,X)
	STY $67			  ; 84 67 | Store Y register to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BCC $67			  ; 90 67 | Branch if carry clear
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $0767			; 9C 67 07 | Store zero to absolute
	BNE $00			  ; D0 00 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CMP $4D69,Y		  ; D9 69 4D | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $6B			  ; 26 6B | Rotate left (zero page)
	ORA $3B6C,Y		  ; 19 6C 3B | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $011F			; 6D 1F 01 | Add with carry (absolute)
	ROR $0107			; 6E 07 01 | Rotate right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ADC $01			  ; 65 01 | Add with carry (zero page)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	STA				  ; 9F 71 D3 00 | Update graphics data
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	TSX				  ; BA | Transfer stack pointer to X register
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	STA				  ; 9F 00 00 00 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $0000			; CD 00 00 | Compare accumulator (absolute)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_031
; Address: $CA9394
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_031:
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $015E,Y		  ; 79 5E 01 | Add with carry (absolute,Y)
	CMP $7A			  ; C5 7A | Compare accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $9D7C,Y		  ; 19 7C 9D | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $00B0,X		  ; 7D B0 00 | Add with carry (absolute,X)
	ROR $009F,X		  ; 7E 9F 00 | Rotate right (absolute,X)
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_032
; Address: $CA93CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_032:
	JSL $000A80		  ; 22 80 0A 00 | Jump to subroutine long
	BIT $8480			; 2C 80 84 | Test bits in accumulator (absolute)
	BCS $80			  ; B0 80 | Branch if carry set

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_033
; Address: $CA93DB
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_033:
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	LDA $AA80,X		  ; BD 80 AA | Read graphics status
	STA ($35,X)		  ; 81 35 | Update graphics data
	STZ $8D81			; 9C 81 8D | Store zero to absolute
	AND #$82			 ; 29 82 | Logical AND with accumulator (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $AA84,X		  ; 9E 84 AA | Store zero to absolute,X
	PHA				  ; 48 | Push accumulator to stack
	STA $21			  ; 85 21 | PPU graphics register access
	ADC #$85			 ; 69 85 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($86),Y		  ; 11 86 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $87			  ; 86 87 | Store X register to zero page
	TAX				  ; AA | Transfer accumulator to X register
	BMI $88			  ; 30 88 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	EOR $0000,Y		  ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
	ORA ($89),Y		  ; 11 89 | Logical OR with accumulator ((zero page),Y)
	JMP $0789			; 4C 89 07 | Jump to address
	BIT #$60			 ; 89 60 | Test bits in accumulator (immediate)
	BIT #$73			 ; 89 73 | Test bits in accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0008			; 0D 08 00 | Logical OR with accumulator (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ASL $006C			; 0E 6C 00 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_034
; Address: $CA946C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_034:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY $B405			; CC 05 B4 | Compare Y register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	BPL $80			  ; 10 80 | Branch if positive
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	CMP $37			  ; C5 37 | Compare accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA ($40),Y		  ; 11 40 | Logical OR with accumulator ((zero page),Y)
	BCS $01			  ; B0 01 | Branch if carry set
	BEQ $0D			  ; F0 0D | Branch if equal
	BPL $02			  ; 10 02 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive
	BVS $12			  ; 70 12 | Branch if overflow set
	LDY $C012			; AC 12 C0 | Load from absolute address into Y register
	JMP ($4417)		  ; 6C 17 44 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BCS $1C			  ; B0 1C | Branch if carry set

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_035
; Address: $CA94B3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_035:
	LDY $0003,X		  ; BC 03 00 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	JMP ($B820)		  ; 6C 20 B8 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $2724,Y		  ; 19 24 27 | Logical OR with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $EC			  ; 30 EC | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDY $BC3D			; AC 3D BC | Load from absolute address into Y register
	ORA $4068,X		  ; 1D 68 40 | Logical OR with accumulator (absolute,X)
	CPX $08			  ; E4 08 | Compare X register (zero page)
	ASL $494C,X		  ; 1E 4C 49 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_038
; Address: $CA9508
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_038:
	JSR $6254			; 20 54 62 | Jump to subroutine
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	AND ($18,X)		  ; 21 18 | Logical AND with accumulator ((zero page,X))
	ADC #$94			 ; 69 94 | Add with carry (immediate)
	AND ($AC,X)		  ; 21 AC | Logical AND with accumulator ((zero page,X))
	ADC $04A8			; 6D A8 04 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_039
; Address: $CA9520
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_039:
	JSL $707254		  ; 22 54 72 70 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BIT $CC			  ; 24 CC | Test bits in accumulator (zero page)
	BIT $0005			; 2C 05 00 | Test bits in accumulator (absolute)
	AND $F8			  ; 25 F8 | Logical AND with accumulator (zero page)
	STA ($BC,X)		  ; 81 BC | Update graphics data
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND $B4			  ; 25 B4 | Logical AND with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack
	CPY $0004			; CC 04 00 | Compare Y register (absolute)
	ROL $80			  ; 26 80 | Rotate left (zero page)
	BCC $1C			  ; 90 1C | Branch if carry clear
	STZ $B494			; 9C 94 B4 | Store zero to absolute
	PLP				  ; 28 | Pull processor status from stack
	BVC $9C			  ; 50 9C | Branch if overflow clear
	JMP ($0003)		  ; 6C 03 00 | Jump to address (absolute indirect)
	AND #$BC			 ; 29 BC | Logical AND with accumulator (immediate)
	STA				  ; 9F 4C 04 00 | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_03A
; Address: $CA956A
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_03A:
	LDY $84			  ; A4 84 | Load from zero page into Y register
	STY $2CA7			; 8C A7 2C | Store Y register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $ADB8			; 2C B8 AD | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $B80C			; 2D 0C B8 | Logical AND with accumulator (absolute)
	ROL $BC40			; 2E 40 BC | Rotate left (absolute)
	CPY $0005			; CC 05 00 | Compare Y register (absolute)
	REP #$A4			 ; C2 A4 | Reset processor status bits
	BMI $B0			  ; 30 B0 | Branch if negative
	DEC $1C			  ; C6 1C | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND ($CC),Y		  ; 31 CC | Logical AND with accumulator ((zero page),Y)
	DEC $0648			; CE 48 06 | Decrement (absolute)
	BVS $06			  ; 70 06 | Branch if overflow set
	STY $DB			  ; 84 DB | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	CPX #$9C			 ; E0 9C | Compare X register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $90			  ; E4 90 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	JMP $0009			; 4C 09 00 | Jump to address
	STY $F1			  ; 84 F1 | Store Y register to zero page
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	STZ $F9			  ; 64 F9 | Store zero to zero page
	BMI $05			  ; 30 05 | Branch if negative
	AND $FE94,Y		  ; 39 94 FE | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL $7D			  ; 06 7D | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STY $0B			  ; 84 0B | Store Y register to zero page
	ADC $0006,X		  ; 7D 06 00 | Add with carry (absolute,X)
	CMP $0002,X		  ; DD 02 00 | Compare accumulator (absolute,X)
	AND $14DC,X		  ; 3D DC 14 | Logical AND with accumulator (absolute,X)
	CMP $0002			; CD 02 00 | Compare accumulator (absolute)
	ROL $17A8,X		  ; 3E A8 17 | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $000D,Y		  ; 19 0D 00 | Logical OR with accumulator (absolute,Y)
	EOR ($B4,X)		  ; 41 B4 | Exclusive OR with accumulator ((zero page,X))
	ORA $000D,Y		  ; 19 0D 00 | Logical OR with accumulator (absolute,Y)
	WDM #$C0			 ; 42 C0 | Reserved instruction
	ORA $0009,Y		  ; 19 09 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_03B
; Address: $CA9631
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_03B:
	INY				  ; C8 | Increment Y register
	ORA $0009,Y		  ; 19 09 00 | Logical OR with accumulator (absolute,Y)
	BNE $19			  ; D0 19 | Branch if not equal
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	EOR $D8			  ; 45 D8 | Exclusive OR with accumulator (zero page)
	ORA $005D,Y		  ; 19 5D 00 | Logical OR with accumulator (absolute,Y)
	LSR $34			  ; 46 34 | Logical shift right (zero page)
	INC				  ; 1A | Increment accumulator
	LDA $0000			; AD 00 00 | Read graphics status
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR #$68			 ; 49 68 | Exclusive OR with accumulator (immediate)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $451B			; AC 1B 45 | Load from absolute address into Y register
	BEQ $1B			  ; F0 1B | Branch if equal
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	JMP $1C34			; 4C 34 1C | Jump to address
	EOR $1C68			; 4D 68 1C | Exclusive OR with accumulator (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $1CAC			; 4E AC 1C | Logical shift right (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	EOR ($CC),Y		  ; 51 CC | Exclusive OR with accumulator ((zero page),Y)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BEQ $1C			  ; F0 1C | Branch if equal
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $000D,X		  ; 1D 0D 00 | Logical OR with accumulator (absolute,X)
	ORA $0015,X		  ; 1D 15 00 | Logical OR with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_03C
; Address: $CA96D9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_03C:
	JSR $0D1D			; 20 1D 0D | Jump to subroutine
	BIT $811D			; 2C 1D 81 | Test bits in accumulator (absolute)
	JMP $011FAC		  ; 5C AC 1F 01 | Jump to address long
	EOR $21AC,X		  ; 5D AC 21 | PPU graphics register access
	CMP $0001,Y		  ; D9 01 00 | Compare accumulator (absolute,Y)
	LSR $2384,X		  ; 5E 84 23 | Logical shift right (absolute,X)
	STA $0002			; 8D 02 00 | Update graphics data
	BPL $26			  ; 10 26 | Branch if positive
	CMP $0001			; CD 01 00 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_03E
; Address: $CA970B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_03E:
	SBC $0001			; ED 01 00 | Subtract with carry (absolute)
	ADC ($C8,X)		  ; 61 C8 | Add with carry ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	AND $0001,Y		  ; 39 01 00 | Logical AND with accumulator (absolute,Y)
	AND $0195			; 2D 95 01 | Logical AND with accumulator (absolute)
	STZ $94			  ; 64 94 | Store zero to zero page
	ROL $01CD			; 2E CD 01 | Rotate left (absolute)
	ADC $60			  ; 65 60 | Add with carry (zero page)
	BMI $BD			  ; 30 BD | Branch if negative
	ROR $1C			  ; 66 1C | Rotate right (zero page)
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($01),Y		  ; D1 01 | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ADC #$34			 ; 69 34 | Add with carry (immediate)
	STA $0001			; 8D 01 00 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	CPY #$36			 ; C0 36 | Compare Y register (immediate)
	STA $01			  ; 85 01 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_03F
; Address: $CA9762
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_03F:
	SEC				  ; 38 | Set carry flag
	ORA $0002,Y		  ; 19 02 00 | Logical OR with accumulator (absolute,Y)
	JMP ($3A5C)		  ; 6C 5C 3A | Jump to address (absolute indirect)
	LDA $0001,X		  ; BD 01 00 | Read graphics status
	ADC $3C18			; 6D 18 3C | Add with carry (absolute)
	BIT #$02			 ; 89 02 | Test bits in accumulator (immediate)
	ROR $3EA0			; 6E A0 3E | Rotate right (absolute)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	CPX $3F			  ; E4 3F | Compare X register (zero page)
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	BVS $4C			  ; 70 4C | Branch if overflow set
	WDM #$91			 ; 42 91 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($DC),Y		  ; 71 DC | Add with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	CPX #$45			 ; E0 45 | Compare X register (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LSR $C5			  ; 46 C5 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $1547			; CC 47 15 | Compare Y register (absolute)
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	STA $0001,X		  ; 9D 01 00 | Update graphics data
	EOR #$5D			 ; 49 5D | Exclusive OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_040
; Address: $CA97CA
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_040:
	EOR #$A9			 ; 49 A9 | Exclusive OR with accumulator (immediate)
	ADC $4A80,Y		  ; 79 80 4A | Add with carry (absolute,Y)
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	CPY $4D			  ; C4 4D | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	BVC $01			  ; 50 01 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ADC $527C,X		  ; 7D 7C 52 | Add with carry (absolute,X)
	AND $0003,Y		  ; 39 03 00 | Logical AND with accumulator (absolute,Y)
	ROR $55B4,X		  ; 7E B4 55 | Rotate right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	EOR $01BD,Y		  ; 59 BD 01 | Exclusive OR with accumulator (absolute,Y)
	BRA $04			  ; 80 04 | Branch always
	STA ($98,X)		  ; 81 98 | Update graphics data
	EOR $03C1,X		  ; 5D C1 03 | Exclusive OR with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($85,X)		  ; 61 85 | Add with carry ((zero page,X))
	ADC ($15,X)		  ; 61 15 | Add with carry ((zero page,X))
	STY $F0			  ; 84 F0 | Store Y register to zero page
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	STY $30			  ; 84 30 | Store Y register to zero page
	ADC $49			  ; 65 49 | Add with carry (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $78			  ; 84 78 | Store Y register to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_041
; Address: $CA983B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_041:
	EOR ($07),Y		  ; 51 07 | Exclusive OR with accumulator ((zero page),Y)
	STY $C8			  ; 84 C8 | Store Y register to zero page
	AND ($06),Y		  ; 31 06 | Logical AND with accumulator ((zero page),Y)
	STA $F8			  ; 85 F8 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	LDA $00			  ; A5 00 | Read graphics status
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	EOR $F200,Y		  ; 59 00 F2 | Exclusive OR with accumulator (absolute,Y)
	STA ($ED,X)		  ; 81 ED | Update graphics data
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	EOR $8C00,Y		  ; 59 00 8C | Exclusive OR with accumulator (absolute,Y)
	STY $ED			  ; 84 ED | Store Y register to zero page
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	ROL $87			  ; 26 87 | Rotate left (zero page)
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_042
; Address: $CA988C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_042:
	SBC $7C			  ; E5 7C | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BIT $7D			  ; 24 7D | Test bits in accumulator (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 7D E8 08 | Update graphics data
	ROR $10E8,X		  ; 7E E8 10 | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	ROR $10E8,X		  ; 7E E8 10 | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	STZ $E87F			; 9C 7F E8 | Store zero to absolute
	BPL $06			  ; 10 06 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_044
; Address: $CA98CE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_044:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($E8,X)		  ; 81 E8 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX $E882,Y		  ; BE 82 E8 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $E8			  ; 84 E8 | Store Y register to zero page
	ASL $090E			; 0E 0E 09 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ADC ($84),Y		  ; 71 84 | Add with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	STA $E8			  ; 85 E8 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_045
; Address: $CA98FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_045:
	JSR $0010			; 20 10 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	STX $E8			  ; 86 E8 | Store X register to zero page
	BMI $0E			  ; 30 0E | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BMI $87			  ; 30 87 | Branch if negative
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_046
; Address: $CA990D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_046:
	JSR $0809			; 20 09 08 | Jump to subroutine
	BIT $000A			; 2C 0A 00 | Test bits in accumulator (absolute)
	STA $E888,X		  ; 9D 88 E8 | Update graphics data
	JMP $0004			; 4C 04 00 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $E889,X		  ; 9E 89 E8 | Store zero to absolute,X
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_047
; Address: $CA9925
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_047:
	LDY #$8D			 ; A0 8D | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	BPL $13			  ; 10 13 | Branch if positive
	ASL $E88E,X		  ; 1E 8E E8 | Arithmetic shift left (absolute,X)
	BPL $03			  ; 10 03 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEX				  ; CA | Decrement X register
	BCC $E8			  ; 90 E8 | Branch if carry clear
	BPL $0D			  ; 10 0D | Branch if positive
	STA ($E8),Y		  ; 91 E8 | Update graphics data
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $5000			; 0D 00 50 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	ORA $0622,Y		  ; 19 22 06 | Logical OR with accumulator (absolute,Y)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	INX				  ; E8 | Increment X register
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $2A00			; 0D 00 2A | Logical OR with accumulator (absolute)
	STA $25E8,Y		  ; 99 E8 25 | Update graphics data
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	AND $9C			  ; 25 9C | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0500			; 0D 00 05 | Logical OR with accumulator (absolute)
	STA				  ; 9F E8 30 28 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	BEQ $A2			  ; F0 A2 | Branch if equal
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $D000			; 0D 00 D0 | Logical OR with accumulator (absolute)
	LDX $E8			  ; A6 E8 | Load from zero page into X register
	BMI $28			  ; 30 28 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_048
; Address: $CA999F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_048:
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $2200			; 0D 00 22 | Logical OR with accumulator (absolute)
	LDA $100AE8		  ; AF E8 0A 10 | Read graphics status
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $C000			; 0D 00 C0 | Logical OR with accumulator (absolute)
	LDA $0807E8		  ; AF E8 07 08 | Read graphics status
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $4700			; 0D 00 47 | Logical OR with accumulator (absolute)
	BCS $E8			  ; B0 E8 | Branch if carry set
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $7900			; 0D 00 79 | Logical OR with accumulator (absolute)
	BCS $E8			  ; B0 E8 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $C000			; 0D 00 C0 | Logical OR with accumulator (absolute)
	BCS $E8			  ; B0 E8 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $FA00			; 0D 00 FA | Logical OR with accumulator (absolute)
	BCS $E8			  ; B0 E8 | Branch if carry set
	BPL $07			  ; 10 07 | Branch if positive
	ORA $4600			; 0D 00 46 | Logical OR with accumulator (absolute)
	LDA ($E8),Y		  ; B1 E8 | Read graphics status
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BPL $07			  ; 10 07 | Branch if positive
	ORA $1F00			; 0D 00 1F | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $F100			; 0D 00 F1 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $F800			; 0D 00 F8 | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_049
; Address: $CA9A09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_049:
	JSL $090935		  ; 22 35 09 09 | Jump to subroutine long
	ASL $FF00			; 0E 00 FF | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04A
; Address: $CA9A12
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04A:
	JSL $080936		  ; 22 36 09 08 | Jump to subroutine long
	ASL $3300			; 0E 00 33 | Arithmetic shift left (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04B
; Address: $CA9A1E
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04B:
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	LDX $12E8,Y		  ; BE E8 12 | Load from absolute,Y into X register
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $7D00			; 0E 00 7D | Arithmetic shift left (absolute)
	LDA				  ; BF E8 08 0F | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $D400			; 0E 00 D4 | Arithmetic shift left (absolute)
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	ORA $0E06			; 0D 06 0E | Logical OR with accumulator (absolute)
	CMP ($E8,X)		  ; C1 E8 | Compare accumulator ((zero page,X))
	ORA $0E06			; 0D 06 0E | Logical OR with accumulator (absolute)
	CPY $C1			  ; C4 C1 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $5200			; 0E 00 52 | Arithmetic shift left (absolute)
	REP #$E8			 ; C2 E8 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $9300			; 0E 00 93 | Arithmetic shift left (absolute)
	REP #$E8			 ; C2 E8 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $DD00			; 0E 00 DD | Arithmetic shift left (absolute)
	REP #$E8			 ; C2 E8 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $2200			; 0E 00 22 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL $4400			; 0E 00 44 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ASL $9100			; 0E 00 91 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04C
; Address: $CA9A89
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04C:
	JSR $0E09			; 20 09 0E | Jump to subroutine
	INX				  ; E8 | Increment X register
	BIT $31			  ; 24 31 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $2800			; 0E 00 28 | Arithmetic shift left (absolute)
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $DD00			; 0E 00 DD | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04D
; Address: $CA9AA0
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04D:
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $3200			; 0E 00 32 | Arithmetic shift left (absolute)
	CMP $E8			  ; C5 E8 | Compare accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	LDA $C5			  ; A5 C5 | Read graphics status
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL $EA00			; 0E 00 EA | Arithmetic shift left (absolute)
	DEC $E8			  ; C6 E8 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	ORA $0318,Y		  ; 19 18 03 | Logical OR with accumulator (absolute,Y)
	ASL $9700			; 0E 00 97 | Arithmetic shift left (absolute)
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL $7A00			; 0E 00 7A | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ADC $E8CB,X		  ; 7D CB E8 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $0FE8			; CC E8 0F | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $8400			; 0E 00 84 | Arithmetic shift left (absolute)
	CMP $1DE8			; CD E8 1D | Compare accumulator (absolute)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ASL $7B00			; 0E 00 7B | Arithmetic shift left (absolute)
	DEC $20E8			; CE E8 20 | Decrement (absolute)
	BIT $05			  ; 24 05 | Test bits in accumulator (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PLB				  ; AB | Pull data bank register from stack
	BNE $E8			  ; D0 E8 | Branch if not equal
	AND #$21			 ; 29 21 | PPU graphics register access
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $8500			; 0E 00 85 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	BIT $0521			; 2C 21 05 | Test bits in accumulator (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BCS $D4			  ; B0 D4 | Branch if carry set

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04E
; Address: $CA9B16
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04E:
	INX				  ; E8 | Increment X register
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $BF00			; 0E 00 BF | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL $9800			; 0E 00 98 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	ROL $3B			  ; 26 3B | Rotate left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	LDA $D8			  ; A5 D8 | Read graphics status
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_04F
; Address: $CA9B3C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_04F:
	JSL $0F0506		  ; 22 06 05 0F | Jump to subroutine long
	INC $E0			  ; E6 E0 | Game work RAM access
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_050
; Address: $CA9B45
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_050:
	JSR $0606			; 20 06 06 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	SEP #$E8			 ; E2 E8 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	ASL $000F,X		  ; 1E 0F 00 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL $000F,X		  ; 1E 0F 00 | Arithmetic shift left (absolute,X)
	ORA $E8E4			; 0D E4 E8 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $000F,X		  ; 1E 0F 00 | Arithmetic shift left (absolute,X)
	CPY $E8E4			; CC E4 E8 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $000F,X		  ; 1E 0F 00 | Arithmetic shift left (absolute,X)
	SBC $E8E4,X		  ; FD E4 E8 | Subtract with carry (absolute,X)
	BPL $18			  ; 10 18 | Branch if positive
	ORA $0F0B,X		  ; 1D 0B 0F | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	BPL $18			  ; 10 18 | Branch if positive
	ORA $0F0B,X		  ; 1D 0B 0F | Logical OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	BPL $18			  ; 10 18 | Branch if positive
	ORA $0F0B,X		  ; 1D 0B 0F | Logical OR with accumulator (absolute,X)
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	BPL $18			  ; 10 18 | Branch if positive
	ORA $0F0B,X		  ; 1D 0B 0F | Logical OR with accumulator (absolute,X)
	INC $E8			  ; E6 E8 | Increment (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BNE $E6			  ; D0 E6 | Branch if not equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_051
; Address: $CA9B9E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_051:
	JSR $072C			; 20 2C 07 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC #$E8			 ; E9 E8 | Subtract with carry (immediate)
	ORA $0909			; 0D 09 09 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	SBC $E8EC,Y		  ; F9 EC E8 | Subtract with carry (absolute,Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $0DE8			; ED E8 0D | Subtract with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	INC $0DE8			; EE E8 0D | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	INC $07E8			; EE E8 07 | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	INC $EF			  ; E6 EF | Increment (zero page)
	INX				  ; E8 | Increment X register
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	AND ($F0),Y		  ; 31 F0 | Logical AND with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BEQ $E8			  ; F0 E8 | Branch if equal
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	DEC $E8F0			; CE F0 E8 | Decrement (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BEQ $E8			  ; F0 E8 | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_052
; Address: $CA9C13
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_052:
	AND ($30,X)		  ; 21 30 | Logical AND with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	EOR $F1			  ; 45 F1 | Exclusive OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA $E8F6,Y		  ; 19 F6 E8 | Logical OR with accumulator (absolute,Y)
	ORA $0909			; 0D 09 09 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0EE8,Y		  ; F9 E8 0E | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	JMP $0AE8FA		  ; 5C FA E8 0A | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	AND #$FB			 ; 29 FB | Logical AND with accumulator (immediate)
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	BMI $FC			  ; 30 FC | Branch if negative
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL $21			  ; 06 21 | PPU graphics register access
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	ROR $E8FC			; 6E FC E8 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $21			  ; 06 21 | PPU graphics register access
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL $21			  ; 06 21 | PPU graphics register access
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	CMP $E8FC,X		  ; DD FC E8 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_053
; Address: $CA9C89
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_053:
	ASL $21			  ; 06 21 | PPU graphics register access
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	SBC $27E8,X		  ; FD E8 27 | Subtract with carry (absolute,X)
	AND $0707			; 2D 07 07 | Logical AND with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	LSR $FD			  ; 46 FD | Logical shift right (zero page)
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	AND $0707			; 2D 07 07 | Logical AND with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ORA $0909			; 0D 09 09 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $E9			  ; 05 E9 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	CMP ($05),Y		  ; D1 05 | Compare accumulator ((zero page),Y)
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	ASL $E9			  ; 06 E9 | Arithmetic shift left (zero page)
	ASL $080D			; 0E 0D 08 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ADC $E906,X		  ; 7D 06 E9 | Add with carry (absolute,X)
	ORA $090A,X		  ; 1D 0A 09 | Logical OR with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	SBC #$15			 ; E9 15 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	LDX #$08			 ; A2 08 | Load immediate value into X register
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0010			; 0D 10 00 | Logical OR with accumulator (absolute)
	ORA #$E9			 ; 09 E9 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0010			; 0D 10 00 | Logical OR with accumulator (absolute)
	DEC $E909,X		  ; DE 09 E9 | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0010			; 0D 10 00 | Logical OR with accumulator (absolute)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0010			; 0D 10 00 | Logical OR with accumulator (absolute)
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_054
; Address: $CA9CFC
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_054:
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	BPL $23			  ; 10 23 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	BPL $23			  ; 10 23 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	ASL $0806			; 0E 06 08 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SBC #$25			 ; E9 25 | Subtract with carry (immediate)
	ROL $0808			; 2E 08 08 | Rotate left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SBC #$22			 ; E9 22 | Subtract with carry (immediate)
	ORA $10			  ; 05 10 | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($E9),Y		  ; 11 E9 | Logical OR with accumulator ((zero page),Y)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	BEQ $14			  ; F0 14 | Branch if equal
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	SBC #$1B			 ; E9 1B | Subtract with carry (immediate)
	SBC ($18),Y		  ; F1 18 | Subtract with carry ((zero page),Y)
	SBC #$1E			 ; E9 1E | Subtract with carry (immediate)
	STA ($19),Y		  ; 91 19 | Update graphics data
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA ($1A,X)		  ; 81 1A | Update graphics data
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	CPY $E91A			; CC 1A E9 | Compare Y register (absolute)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	SBC #$26			 ; E9 26 | Subtract with carry (immediate)
	BPL $12			  ; 10 12 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC #$26			 ; E9 26 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_055
; Address: $CA9DA2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_055:
	BPL $12			  ; 10 12 | Branch if positive
	AND ($E9,X)		  ; 21 E9 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0B08			; 0D 08 0B | Logical OR with accumulator (absolute)
	AND $E9			  ; 25 E9 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0B07			; 0E 07 0B | Arithmetic shift left (absolute)
	STA				  ; 9F 25 E9 08 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	AND $E9			  ; 25 E9 | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $E926,Y		  ; 19 26 E9 | Logical OR with accumulator (absolute,Y)
	BMI $05			  ; 30 05 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ROL $E9			  ; 26 E9 | Rotate left (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	AND #$E9			 ; 29 E9 | Logical AND with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	BIT $05E9			; 2C E9 05 | Test bits in accumulator (absolute)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BPL $2D			  ; 10 2D | Branch if positive
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	AND $07E9			; 2D E9 07 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	AND $16E9			; 2D E9 16 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_057
; Address: $CA9E0C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_057:
	JSL $120806		  ; 22 06 08 12 | Jump to subroutine long
	TSX				  ; BA | Transfer stack pointer to X register
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_059
; Address: $CA9E1E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_059:
	JSL $120806		  ; 22 06 08 12 | Jump to subroutine long
	CPX $32			  ; E4 32 | Compare X register (zero page)
	SBC #$23			 ; E9 23 | Subtract with carry (immediate)
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	SBC #$25			 ; E9 25 | Subtract with carry (immediate)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	CMP $E936			; CD 36 E9 | Compare accumulator (absolute)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05A
; Address: $CA9E3E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05A:
	ROR $E939,X		  ; 7E 39 E9 | Rotate right (absolute,X)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $E939,Y		  ; D9 39 E9 | Compare accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $3A			  ; 30 3A | Branch if negative
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	STA $0DE93A		  ; 8F 3A E9 0D | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC #$25			 ; E9 25 | Subtract with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	CPX #$3B			 ; E0 3B | Compare X register (immediate)
	SBC #$27			 ; E9 27 | Subtract with carry (immediate)
	EOR ($06,X)		  ; 41 06 | Exclusive OR with accumulator ((zero page,X))
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	SBC #$21			 ; E9 21 | PPU graphics register access
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	SBC #$23			 ; E9 23 | Subtract with carry (immediate)
	ROL $05			  ; 26 05 | Rotate left (zero page)
	CPY $46			  ; C4 46 | Compare Y register (zero page)
	SBC #$22			 ; E9 22 | Subtract with carry (immediate)
	BIT $0F09			; 2C 09 0F | Test bits in accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	SBC #$22			 ; E9 22 | Subtract with carry (immediate)
	BMI $09			  ; 30 09 | Branch if negative
	JMP $0EE9			; 4C E9 0E | Jump to address
	ORA $0506			; 0D 06 05 | Logical OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	BVC $E9			  ; 50 E9 | Branch if overflow clear
	BPL $0E			  ; 10 0E | Branch if positive
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	EOR ($E9),Y		  ; 51 E9 | Exclusive OR with accumulator ((zero page),Y)
	AND $033E			; 2D 3E 03 | Logical AND with accumulator (absolute)
	CMP $E951,X		  ; DD 51 E9 | Compare accumulator (absolute,X)
	AND $033F			; 2D 3F 03 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05B
; Address: $CA9EC6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05B:
	EOR $05E9,Y		  ; 59 E9 05 | Exclusive OR with accumulator (absolute,Y)
	ASL $0A09			; 0E 09 0A | Arithmetic shift left (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05C
; Address: $CA9ED0
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05C:
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 60 E9 07 | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND $E961			; 2D 61 E9 | Logical AND with accumulator (absolute)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ADC ($E9,X)		  ; 61 E9 | Add with carry ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ADC ($E9,X)		  ; 61 E9 | Add with carry ((zero page,X))
	AND $2B			  ; 25 2B | Logical AND with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ADC $E9			  ; 65 E9 | Add with carry (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	BIT #$6A			 ; 89 6A | Test bits in accumulator (immediate)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	STZ $E96A,X		  ; 9E 6A E9 | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ROR				  ; 6A | Rotate right (accumulator)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ORA $0B08,Y		  ; 19 08 0B | Logical OR with accumulator (absolute,Y)
	ROL $E96B			; 2E 6B E9 | Rotate left (absolute)
	ORA $0B08,Y		  ; 19 08 0B | Logical OR with accumulator (absolute,Y)
	JMP ($18E9)		  ; 6C E9 18 | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ADC $18E9			; 6D E9 18 | Add with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ROR $24E9			; 6E E9 24 | Rotate right (absolute)
	ROL $06			  ; 26 06 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05D
; Address: $CA9F5E
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05D:
	STZ $E96F,X		  ; 9E 6F E9 | Store zero to absolute,X
	ROL $26			  ; 26 26 | Rotate left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	LDY #$73			 ; A0 73 | Load immediate value into Y register
	SBC #$2C			 ; E9 2C | Subtract with carry (immediate)
	CPY $E976			; CC 76 E9 | Compare Y register (absolute)
	ROL $0238			; 2E 38 02 | Rotate left (absolute)
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	SBC #$21			 ; E9 21 | PPU graphics register access
	WDM #$08			 ; 42 08 | Reserved instruction
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	SBC #$21			 ; E9 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	STX $E9			  ; 86 E9 | Store X register to zero page
	BIT $37			  ; 24 37 | Test bits in accumulator (zero page)
	BPL $19			  ; 10 19 | Branch if positive
	CMP #$8A			 ; C9 8A | Compare accumulator (immediate)
	SBC #$26			 ; E9 26 | Subtract with carry (immediate)
	SEC				  ; 38 | Set carry flag
	ORA $A100,Y		  ; 19 00 A1 | Logical OR with accumulator (absolute,Y)
	STA $0605E9		  ; 8F E9 05 06 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ORA $6600,Y		  ; 19 00 66 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA $8800,Y		  ; 19 00 88 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA $A800,Y		  ; 19 00 A8 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA $D800,Y		  ; 19 00 D8 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $F600,Y		  ; 19 00 F6 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $0E00,Y		  ; 19 00 0E | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $4300,Y		  ; 19 00 43 | Logical OR with accumulator (absolute,Y)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $7100,Y		  ; 19 00 71 | Logical OR with accumulator (absolute,Y)
	SBC #$0E			 ; E9 0E | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05E
; Address: $CA9FF2
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05E:
	ORA ($18),Y		  ; 11 18 | Logical OR with accumulator ((zero page),Y)
	ORA $9A00,Y		  ; 19 00 9A | Logical OR with accumulator (absolute,Y)
	SBC #$0E			 ; E9 0E | Subtract with carry (immediate)
	ORA ($18),Y		  ; 11 18 | Logical OR with accumulator ((zero page),Y)
	ORA $5A00,Y		  ; 19 00 5A | Logical OR with accumulator (absolute,Y)
	SBC #$32			 ; E9 32 | Subtract with carry (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	SBC #$33			 ; E9 33 | Subtract with carry (immediate)
	INC				  ; 1A | Increment accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$24			 ; 09 24 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $05E9,X		  ; 9D E9 05 | Update graphics data
	ORA #$24			 ; 09 24 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $05E9,X		  ; 9D E9 05 | Update graphics data
	ORA #$24			 ; 09 24 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ROL $9E			  ; 26 9E | Rotate left (zero page)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ORA #$24			 ; 09 24 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STZ $0DE9,X		  ; 9E E9 0D | Store zero to absolute,X
	BPL $2B			  ; 10 2B | Branch if positive
	INC				  ; 1A | Increment accumulator
	ADC $E99E			; 6D 9E E9 | Add with carry (absolute)
	ORA $2B10			; 0D 10 2B | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $E99F			; 2E 9F E9 | Rotate left (absolute)
	ORA $2B10			; 0D 10 2B | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	SBC #$9F			 ; E9 9F | Subtract with carry (immediate)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	BPL $2B			  ; 10 2B | Branch if positive
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack
	LDY #$E9			 ; A0 E9 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_05F
; Address: $CAA05D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_05F:
	JSR $092C			; 20 2C 09 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	LDY #$E9			 ; A0 E9 | Load immediate value into Y register
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	SBC $A3			  ; E5 A3 | Subtract with carry (zero page)
	SBC #$35			 ; E9 35 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_060
; Address: $CAA073
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_060:
	INC				  ; 1A | Increment accumulator
	CMP $A6			  ; C5 A6 | Compare accumulator (zero page)
	SBC #$35			 ; E9 35 | Subtract with carry (immediate)
	BIT $0408			; 2C 08 04 | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PLB				  ; AB | Pull data bank register from stack
	SBC #$23			 ; E9 23 | Subtract with carry (immediate)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	LDA $3323E9		  ; AF E9 23 33 | Read graphics status
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	AND ($B4),Y		  ; 31 B4 | Logical AND with accumulator ((zero page),Y)
	SBC #$2A			 ; E9 2A | Subtract with carry (immediate)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	SBC #$35			 ; E9 35 | Subtract with carry (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ADC $E9C0,Y		  ; 79 C0 E9 | Add with carry (absolute,Y)
	ORA $080A			; 0D 0A 08 | Logical OR with accumulator (absolute)
	SBC #$C0			 ; E9 C0 | Subtract with carry (immediate)
	SBC #$0E			 ; E9 0E | Subtract with carry (immediate)
	ORA $0708			; 0D 08 07 | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	CMP ($E9,X)		  ; C1 E9 | Compare accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	AND ($1C,X)		  ; 21 1C | Logical AND with accumulator ((zero page,X))
	LSR $C2			  ; 46 C2 | Logical shift right (zero page)
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	AND ($1C,X)		  ; 21 1C | Logical AND with accumulator ((zero page,X))
	REP #$E9			 ; C2 E9 | Reset processor status bits
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	AND ($1C,X)		  ; 21 1C | Logical AND with accumulator ((zero page,X))
	REP #$E9			 ; C2 E9 | Reset processor status bits
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	AND ($1C,X)		  ; 21 1C | Logical AND with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	REP #$E9			 ; C2 E9 | Reset processor status bits
	ORA $180C			; 0D 0C 18 | Logical OR with accumulator (absolute)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_061
; Address: $CAA0FC
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_061:
	BIT $E9C3			; 2C C3 E9 | Test bits in accumulator (absolute)
	ORA $180C			; 0D 0C 18 | Logical OR with accumulator (absolute)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	CPY $E9			  ; C4 E9 | Compare Y register (zero page)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ADC #$C4			 ; 69 C4 | Add with carry (immediate)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	LDA $E9C4			; AD C4 E9 | Read graphics status
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	PEA #$E9C4		   ; F4 C4 E9 | Push effective address to stack
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	AND ($C5,X)		  ; 21 C5 | Logical AND with accumulator ((zero page,X))
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $5C00,X		  ; 1D 00 5C | Logical OR with accumulator (absolute,X)
	CMP $E9			  ; C5 E9 | Compare accumulator (zero page)
	ORA $2500,X		  ; 1D 00 25 | Logical OR with accumulator (absolute,X)
	DEC $E9			  ; C6 E9 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $3100,X		  ; 1D 00 31 | Logical OR with accumulator (absolute,X)
	SBC #$0C			 ; E9 0C | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)
	STA $E9C7,X		  ; 9D C7 E9 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $2000,X		  ; 1D 00 20 | Logical OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $A500,X		  ; 1D 00 A5 | Logical OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	ASL $0608			; 0E 08 06 | Arithmetic shift left (absolute)
	ORA $3500,X		  ; 1D 00 35 | Logical OR with accumulator (absolute,X)
	CMP #$E9			 ; C9 E9 | Compare accumulator (immediate)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	CMP $E9C9			; CD C9 E9 | Compare accumulator (absolute)
	ORA $0914			; 0D 14 09 | Logical OR with accumulator (absolute)
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_062
; Address: $CAA184
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_062:
	DEX				  ; CA | Decrement X register
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $B600,X		  ; 1D 00 B6 | Logical OR with accumulator (absolute,X)
	DEX				  ; CA | Decrement X register
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0300,X		  ; 1D 00 03 | Logical OR with accumulator (absolute,X)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $7400,X		  ; 1D 00 74 | Logical OR with accumulator (absolute,X)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $B400,X		  ; 1D 00 B4 | Logical OR with accumulator (absolute,X)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)
	CPY $08E9			; CC E9 08 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $5D00,X		  ; 1D 00 5D | Logical OR with accumulator (absolute,X)
	CPY $0AE9			; CC E9 0A | Compare Y register (absolute)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	BNE $CC			  ; D0 CC | Branch if not equal
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	EOR ($CD,X)		  ; 41 CD | Exclusive OR with accumulator ((zero page,X))
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	BNE $CD			  ; D0 CD | Branch if not equal
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $5000,X		  ; 1D 00 50 | Logical OR with accumulator (absolute,X)
	DEC $0CE9			; CE E9 0C | Decrement (absolute)
	ASL $0809			; 0E 09 08 | Arithmetic shift left (absolute)
	ORA $DB00,X		  ; 1D 00 DB | Logical OR with accumulator (absolute,X)
	DEC $20E9			; CE E9 20 | Decrement (absolute)
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	ORA $8000,X		  ; 1D 00 80 | Logical OR with accumulator (absolute,X)
	SBC #$21			 ; E9 21 | PPU graphics register access
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	ORA $8400,X		  ; 1D 00 84 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_063
; Address: $CAA1FA
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_063:
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $D200,X		  ; 1D 00 D2 | Logical OR with accumulator (absolute,X)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	ORA $0707			; 0D 07 07 | Logical OR with accumulator (absolute)
	ORA $3A00,X		  ; 1D 00 3A | Logical OR with accumulator (absolute,X)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	LDY $D6			  ; A4 D6 | Load from zero page into Y register
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ORA $2000,X		  ; 1D 00 20 | Logical OR with accumulator (absolute,X)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA $1D07,X		  ; 1D 07 1D | Logical OR with accumulator (absolute,X)
	STA ($D7,X)		  ; 81 D7 | Update graphics data
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA $1D07,X		  ; 1D 07 1D | Logical OR with accumulator (absolute,X)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA $1D07,X		  ; 1D 07 1D | Logical OR with accumulator (absolute,X)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA $1D07,X		  ; 1D 07 1D | Logical OR with accumulator (absolute,X)
	STA ($D8,X)		  ; 81 D8 | Update graphics data
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_064
; Address: $CAA245
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_064:
	JSL $001D17		  ; 22 17 1D 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $06E9,Y		  ; D9 E9 06 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_066
; Address: $CAA257
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_066:
	JSL $001D17		  ; 22 17 1D 00 | Jump to subroutine long
	JMP ($E9D9)		  ; 6C D9 E9 | Jump to address (absolute indirect)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_067
; Address: $CAA260
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_067:
	JSL $001D17		  ; 22 17 1D 00 | Jump to subroutine long
	LDX $E9D9			; AE D9 E9 | Load from absolute address into X register
	AND $32			  ; 25 32 | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $001D			; 0D 1D 00 | Logical OR with accumulator (absolute)
	SBC ($D9,X)		  ; E1 D9 | Subtract with carry ((zero page,X))
	SBC #$26			 ; E9 26 | Subtract with carry (immediate)
	ORA $CE00,X		  ; 1D 00 CE | Logical OR with accumulator (absolute,X)
	CMP $07E9,X		  ; DD E9 07 | Compare accumulator (absolute,X)
	ASL $0909			; 0E 09 09 | Arithmetic shift left (absolute)
	ORA $5800,X		  ; 1D 00 58 | Logical OR with accumulator (absolute,X)
	SEP #$E9			 ; E2 E9 | Set processor status bits
	ORA $0A09			; 0D 09 0A | Logical OR with accumulator (absolute)
	ORA $C500,X		  ; 1D 00 C5 | Logical OR with accumulator (absolute,X)
	SEP #$E9			 ; E2 E9 | Set processor status bits
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $001D			; 0D 1D 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_068
; Address: $CAA291
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_068:
	ORA $E9E3,X		  ; 1D E3 E9 | Logical OR with accumulator (absolute,X)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA $7500,X		  ; 1D 00 75 | Logical OR with accumulator (absolute,X)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ASL $070A			; 0E 0A 07 | Arithmetic shift left (absolute)
	ORA $3800,X		  ; 1D 00 38 | Logical OR with accumulator (absolute,X)
	CPX $E9			  ; E4 E9 | Compare X register (zero page)
	ORA $AE00,X		  ; 1D 00 AE | Logical OR with accumulator (absolute,X)
	CPX $E9			  ; E4 E9 | Compare X register (zero page)
	ORA $AC00,X		  ; 1D 00 AC | Logical OR with accumulator (absolute,X)
	SBC $E9			  ; E5 E9 | Subtract with carry (zero page)
	ORA $C700,X		  ; 1D 00 C7 | Logical OR with accumulator (absolute,X)
	INC $E9			  ; E6 E9 | Increment (zero page)
	ORA $C000,X		  ; 1D 00 C0 | Logical OR with accumulator (absolute,X)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ORA $5B00,X		  ; 1D 00 5B | Logical OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ORA $5900,X		  ; 1D 00 59 | Logical OR with accumulator (absolute,X)
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $7400,X		  ; 1D 00 74 | Logical OR with accumulator (absolute,X)
	NOP				  ; EA | No operation
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $BF00,X		  ; 1D 00 BF | Logical OR with accumulator (absolute,X)
	NOP				  ; EA | No operation
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	AND $EB			  ; 25 EB | Logical AND with accumulator (zero page)
	SBC #$0C			 ; E9 0C | Subtract with carry (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $A500,X		  ; 1D 00 A5 | Logical OR with accumulator (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	BPL $0B			  ; 10 0B | Branch if positive
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_069
; Address: $CAA310
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_069:
	CPX $0DE9			; EC E9 0D | Compare X register (absolute)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $B700,X		  ; 1D 00 B7 | Logical OR with accumulator (absolute,X)
	CPX $0AE9			; EC E9 0A | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $4E00,X		  ; 1D 00 4E | Logical OR with accumulator (absolute,X)
	SBC $0AE9			; ED E9 0A | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06A
; Address: $CAA326
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06A:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	DEC $E9ED			; CE ED E9 | Decrement (absolute)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $A400,X		  ; 1D 00 A4 | Logical OR with accumulator (absolute,X)
	INC $0CE9			; EE E9 0C | Increment (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $1400,X		  ; 1D 00 14 | Logical OR with accumulator (absolute,X)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	BEQ $E9			  ; F0 E9 | Branch if equal
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $5500,X		  ; 1D 00 55 | Logical OR with accumulator (absolute,X)
	SBC ($E9),Y		  ; F1 E9 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $A200,X		  ; 1D 00 A2 | Logical OR with accumulator (absolute,X)
	SBC ($E9),Y		  ; F1 E9 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0200,X		  ; 1D 00 02 | Logical OR with accumulator (absolute,X)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	STY $E9F2			; 8C F2 E9 | Store Y register to absolute address
	ASL $0A13			; 0E 13 0A | Arithmetic shift left (absolute)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	ASL $0809			; 0E 09 08 | Arithmetic shift left (absolute)
	ORA $F600,X		  ; 1D 00 F6 | Logical OR with accumulator (absolute,X)
	SBC #$0C			 ; E9 0C | Subtract with carry (immediate)
	ORA $0808			; 0D 08 08 | Logical OR with accumulator (absolute)
	ORA $4500,X		  ; 1D 00 45 | Logical OR with accumulator (absolute,X)
	PEA #$08E9		   ; F4 E9 08 | Push effective address to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA $E400,X		  ; 1D 00 E4 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06B
; Address: $CAA3A0
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06B:
	PEA #$07E9		   ; F4 E9 07 | Push effective address to stack
	BPL $0A			  ; 10 0A | Branch if positive
	ORA $6500,X		  ; 1D 00 65 | Logical OR with accumulator (absolute,X)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	ASL $0809			; 0E 09 08 | Arithmetic shift left (absolute)
	ORA $DB00,X		  ; 1D 00 DB | Logical OR with accumulator (absolute,X)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	BPL $07			  ; 10 07 | Branch if positive
	ORA $0C00,X		  ; 1D 00 0C | Logical OR with accumulator (absolute,X)
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $8A00,X		  ; 1D 00 8A | Logical OR with accumulator (absolute,X)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	ORA $B800,X		  ; 1D 00 B8 | Logical OR with accumulator (absolute,X)
	SBC #$0C			 ; E9 0C | Subtract with carry (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $F200,X		  ; 1D 00 F2 | Logical OR with accumulator (absolute,X)
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $5C00,X		  ; 1D 00 5C | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $7400,X		  ; 1D 00 74 | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	ORA $A500,X		  ; 1D 00 A5 | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	ORA $E600,X		  ; 1D 00 E6 | Logical OR with accumulator (absolute,X)
	SBC $34E9,Y		  ; F9 E9 34 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $F300,X		  ; 1E 00 F3 | Arithmetic shift left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC #$34			 ; E9 34 | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $AE00,X		  ; 1E 00 AE | Arithmetic shift left (absolute,X)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06C
; Address: $CAA424
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06C:
	ASL $6600,X		  ; 1E 00 66 | Arithmetic shift left (absolute,X)
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $DA00,X		  ; 1E 00 DA | Arithmetic shift left (absolute,X)
	NOP				  ; EA | No operation
	ORA $070B			; 0D 0B 07 | Logical OR with accumulator (absolute)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ORA $EA			  ; 05 EA | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $7700,X		  ; 1E 00 77 | Arithmetic shift left (absolute,X)
	ORA $EA			  ; 05 EA | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $A000,X		  ; 1E 00 A0 | Arithmetic shift left (absolute,X)
	ORA $EA			  ; 05 EA | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $D000,X		  ; 1E 00 D0 | Arithmetic shift left (absolute,X)
	ORA $EA			  ; 05 EA | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL $2900,X		  ; 1E 00 29 | Arithmetic shift left (absolute,X)
	ASL $EA			  ; 06 EA | Arithmetic shift left (zero page)
	ORA $1E21,X		  ; 1D 21 1E | Logical OR with accumulator (absolute,X)
	STA $EA06			; 8D 06 EA | Update graphics data
	ORA $1E21,X		  ; 1D 21 1E | Logical OR with accumulator (absolute,X)
	ASL $EA			  ; 06 EA | Arithmetic shift left (zero page)
	ORA $1E21,X		  ; 1D 21 1E | Logical OR with accumulator (absolute,X)
	ASL $EA			  ; 06 EA | Arithmetic shift left (zero page)
	ORA $1E21,X		  ; 1D 21 1E | Logical OR with accumulator (absolute,X)
	BPL $07			  ; 10 07 | Branch if positive
	NOP				  ; EA | No operation
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	NOP				  ; EA | No operation
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	EOR $EA07,X		  ; 5D 07 EA | Exclusive OR with accumulator (absolute,X)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	STX $07			  ; 86 07 | Store X register to zero page
	NOP				  ; EA | No operation
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	NOP				  ; EA | No operation
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06D
; Address: $CAA4A9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06D:
	PHP				  ; 08 | Push processor status to stack
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	SEP #$07			 ; E2 07 | Set processor status bits
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	NOP				  ; EA | No operation
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDY $EA0F			; AC 0F EA | Load from absolute address into Y register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	INC $EA0F,X		  ; FE 0F EA | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	BMI $10			  ; 30 10 | Branch if negative
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ADC ($10),Y		  ; 71 10 | Add with carry ((zero page),Y)
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BPL $EA			  ; 10 EA | Branch if positive
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06E
; Address: $CAA4F3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06E:
	JSR $2E00			; 20 00 2E | Jump to subroutine
	ORA ($EA),Y		  ; 11 EA | Logical OR with accumulator ((zero page),Y)
	ASL $0814			; 0E 14 08 | Arithmetic shift left (absolute)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA ($EA),Y		  ; 11 EA | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_06F
; Address: $CAA505
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_06F:
	JSR $2200			; 20 00 22 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_070
; Address: $CAA50E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_070:
	JSR $4700			; 20 00 47 | Jump to subroutine
	NOP				  ; EA | No operation
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_073
; Address: $CAA520
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_073:
	JSR $CD00			; 20 00 CD | Jump to subroutine
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA $0B0A			; 0D 0A 0B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_074
; Address: $CAA529
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_074:
	JSR $A600			; 20 00 A6 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A09			; 0E 09 0A | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_076
; Address: $CAA53B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_076:
	JSR $8600			; 20 00 86 | Jump to subroutine
	NOP				  ; EA | No operation
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_077
; Address: $CAA544
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_077:
	JSR $CC00			; 20 00 CC | Jump to subroutine
	NOP				  ; EA | No operation
	ROL $2F			  ; 26 2F | Rotate left (zero page)
	BPL $20			  ; 10 20 | Branch if positive
	NOP				  ; EA | No operation
	ROL $35			  ; 26 35 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_078
; Address: $CAA556
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_078:
	JSR $E300			; 20 00 E3 | Jump to subroutine
	ORA $16EA,Y		  ; 19 EA 16 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_079
; Address: $CAA565
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_079:
	JSL $200A08		  ; 22 08 0A 20 | Jump to subroutine long
	BVS $1F			  ; 70 1F | Branch if overflow set
	NOP				  ; EA | No operation
	BPL $08			  ; 10 08 | Branch if positive
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA #$21			 ; 09 21 | PPU graphics register access
	NOP				  ; EA | No operation
	ORA $0712			; 0D 12 07 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_07A
; Address: $CAA57A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_07A:
	JSR $3600			; 20 00 36 | Jump to subroutine
	AND ($EA,X)		  ; 21 EA | Logical AND with accumulator ((zero page,X))
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_07B
; Address: $CAA583
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_07B:
	JSR $D100			; 20 00 D1 | Jump to subroutine
	AND ($EA,X)		  ; 21 EA | Logical AND with accumulator ((zero page,X))
	ORA $090D			; 0D 0D 09 | Logical OR with accumulator (absolute)
	ASL $0020			; 0E 20 00 | Arithmetic shift left (absolute)
	AND ($EA,X)		  ; 21 EA | Logical AND with accumulator ((zero page,X))
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_081
; Address: $CAA5A7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_081:
	JSR $0800			; 20 00 08 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL $0A07			; 0E 07 0A | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_082
; Address: $CAA5B0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_082:
	JSR $4600			; 20 00 46 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $0CEA23		  ; 8F 23 EA 0C | Update graphics data
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_083
; Address: $CAA5C2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_083:
	JSR $0300			; 20 00 03 | Jump to subroutine
	BIT $EA			  ; 24 EA | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	BIT $EA			  ; 24 EA | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_084
; Address: $CAA5D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_084:
	JSR $DE00			; 20 00 DE | Jump to subroutine
	BIT $EA			  ; 24 EA | Test bits in accumulator (zero page)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_085
; Address: $CAA5DD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_085:
	JSR $4E00			; 20 00 4E | Jump to subroutine
	AND $EA			  ; 25 EA | Logical AND with accumulator (zero page)
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $20			  ; 10 20 | Branch if positive
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	BIT $1D			  ; 24 1D | Test bits in accumulator (zero page)
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	AND #$EA			 ; 29 EA | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_087
; Address: $CAA5F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_087:
	JSR $0900			; 20 00 09 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $20			  ; 10 20 | Branch if positive
	BCS $2C			  ; B0 2C | Branch if carry set
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_088
; Address: $CAA60A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_088:
	JSR $F500			; 20 00 F5 | Jump to subroutine
	BIT $0DEA			; 2C EA 0D | Test bits in accumulator (absolute)
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_089
; Address: $CAA613
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_089:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	AND $11EA			; 2D EA 11 | Logical AND with accumulator (absolute)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_08B
; Address: $CAA625
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_08B:
	JSR $5C00			; 20 00 5C | Jump to subroutine
	NOP				  ; EA | No operation
	ROL $2D			  ; 26 2D | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_08C
; Address: $CAA62E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_08C:
	JSR $6F00			; 20 00 6F | Jump to subroutine
	NOP				  ; EA | No operation
	ROL $2C			  ; 26 2C | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_08E
; Address: $CAA640
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_08E:
	JSR $6700			; 20 00 67 | Jump to subroutine
	NOP				  ; EA | No operation
	ORA $0615			; 0D 15 06 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_08F
; Address: $CAA649
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_08F:
	JSR $E300			; 20 00 E3 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_090
; Address: $CAA652
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_090:
	JSR $BD00			; 20 00 BD | Jump to subroutine
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_091
; Address: $CAA65B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_091:
	JSR $E700			; 20 00 E7 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	AND $36			  ; 25 36 | Logical AND with accumulator (zero page)
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_092
; Address: $CAA66D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_092:
	JSR $7400			; 20 00 74 | Jump to subroutine
	NOP				  ; EA | No operation
	ASL $032D,X		  ; 1E 2D 03 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ADC $EA39,Y		  ; 79 39 EA | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_093
; Address: $CAA685
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_093:
	JSR $1404			; 20 04 14 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPX #$3B			 ; E0 3B | Compare X register (immediate)
	NOP				  ; EA | No operation
	ASL $1603,X		  ; 1E 03 16 | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	ASL $0C2F,X		  ; 1E 2F 0C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_094
; Address: $CAA69A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_094:
	JSL $3E0A00		  ; 22 00 0A 3E | Jump to subroutine long
	NOP				  ; EA | No operation
	BIT $0D0D			; 2C 0D 0D | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_097
; Address: $CAA6B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_097:
	JSL $43F400		  ; 22 00 F4 43 | Jump to subroutine long
	NOP				  ; EA | No operation
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ORA $45			  ; 05 45 | Logical OR with accumulator (zero page)
	NOP				  ; EA | No operation
	ORA $0707,Y		  ; 19 07 07 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_098
; Address: $CAA6C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_098:
	JSL $45FF00		  ; 22 00 FF 45 | Jump to subroutine long
	NOP				  ; EA | No operation
	ORA $070B,Y		  ; 19 0B 07 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_099
; Address: $CAA6D0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_099:
	JSL $472D00		  ; 22 00 2D 47 | Jump to subroutine long
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09A
; Address: $CAA6D9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09A:
	JSL $478000		  ; 22 00 80 47 | Jump to subroutine long
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA $0A0A			; 0D 0A 0A | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09B
; Address: $CAA6E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09B:
	JSL $47C800		  ; 22 00 C8 47 | Jump to subroutine long
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09C
; Address: $CAA6EB
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09C:
	JSL $480800		  ; 22 00 08 48 | Jump to subroutine long
	NOP				  ; EA | No operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $23			  ; 05 23 | Logical OR with accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	NOP				  ; EA | No operation
	ORA $0708,Y		  ; 19 08 07 | Logical OR with accumulator (absolute,Y)
	CMP $EA49,Y		  ; D9 49 EA | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA $0407,X		  ; 1D 07 04 | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	NOP				  ; EA | No operation
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ASL $23			  ; 06 23 | Arithmetic shift left (zero page)
	ORA ($4D,X)		  ; 01 4D | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	LSR $0EEA			; 4E EA 0E | Logical shift right (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	EOR $EA4F			; 4D 4F EA | Exclusive OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09D
; Address: $CAA72F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09D:
	AND #$4E			 ; 29 4E | Logical AND with accumulator (immediate)
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	NOP				  ; EA | No operation
	LSR $0506			; 4E 06 05 | Logical shift right (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation
	ORA $0527,Y		  ; 19 27 05 | Logical OR with accumulator (absolute,Y)
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	ROL $57			  ; 26 57 | Rotate left (zero page)
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	ORA $24			  ; 05 24 | Logical OR with accumulator (zero page)
	EOR $0EEA,Y		  ; 59 EA 0E | Exclusive OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	ADC #$5A			 ; 69 5A | Add with carry (immediate)
	NOP				  ; EA | No operation
	BPL $16			  ; 10 16 | Branch if positive
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation
	ORA $062A,Y		  ; 19 2A 06 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ASL $5C			  ; 06 5C | Arithmetic shift left (zero page)
	NOP				  ; EA | No operation
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	EOR $07EA,X		  ; 5D EA 07 | Exclusive OR with accumulator (absolute,X)
	ASL $0A09			; 0E 09 0A | Arithmetic shift left (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation
	EOR $05EA,X		  ; 5D EA 05 | Exclusive OR with accumulator (absolute,X)
	ORA $0B0A			; 0D 0A 0B | Logical OR with accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	EOR $5E			  ; 45 5E | Exclusive OR with accumulator (zero page)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09E
; Address: $CAA78A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09E:
	JSR $0D0C			; 20 0C 0D | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $1FEA,X		  ; 5E EA 1F | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_09F
; Address: $CAA793
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_09F:
	JSR $0D0C			; 20 0C 0D | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEC $60			  ; C6 60 | Decrement (zero page)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A0
; Address: $CAA79C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A0:
	JSR $0D0C			; 20 0C 0D | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $EA62,X		  ; 3D 62 EA | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A1
; Address: $CAA7A5
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A1:
	JSR $0D0C			; 20 0C 0D | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	NOP				  ; EA | No operation
	AND ($4D),Y		  ; 31 4D | Logical AND with accumulator ((zero page),Y)
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	LDA $EA64,Y		  ; B9 64 EA | Read graphics status
	AND ($4D),Y		  ; 31 4D | Logical AND with accumulator ((zero page),Y)
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	AND #$30			 ; 29 30 | Logical AND with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	LDA $27EA74		  ; AF 74 EA 27 | Read graphics status
	BIT $070A			; 2C 0A 07 | Test bits in accumulator (absolute)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	NOP				  ; EA | No operation
	ORA ($13),Y		  ; 11 13 | Logical OR with accumulator ((zero page),Y)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	LDA $0FEA7D		  ; AF 7D EA 0F | Read graphics status
	BPL $0A			  ; 10 0A | Branch if positive
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	SBC $EA7E			; ED 7E EA | Subtract with carry (absolute)
	AND $2F			  ; 25 2F | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	AND $2D			  ; 25 2D | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	JMP $EA82			; 4C 82 EA | Jump to address
	ASL $2504			; 0E 04 25 | Arithmetic shift left (absolute)
	STA $EA			  ; 85 EA | Update graphics data
	ASL $2506			; 0E 06 25 | Arithmetic shift left (absolute)
	STA $EA			  ; 85 EA | Update graphics data
	AND ($0B,X)		  ; 21 0B | Logical AND with accumulator ((zero page,X))
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A2
; Address: $CAA80D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A2:
	JSR $EA86			; 20 86 EA | Jump to subroutine
	ORA #$25			 ; 09 25 | Logical OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	JMP ($EA8A)		  ; 6C 8A EA | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BCC $EA			  ; 90 EA | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A3
; Address: $CAA82D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A3:
	ORA $2609			; 0D 09 26 | Logical OR with accumulator (absolute)
	PEA #$EA94		   ; F4 94 EA | Push effective address to stack
	ORA $0924,Y		  ; 19 24 09 | Logical OR with accumulator (absolute,Y)
	ORA #$26			 ; 09 26 | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	NOP				  ; EA | No operation
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	NOP				  ; EA | No operation
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA #$9E			 ; 09 9E | Logical OR with accumulator (immediate)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A4
; Address: $CAA84F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A4:
	JSR $0643			; 20 43 06 | Jump to subroutine
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	ASL $EAA3			; 0E A3 EA | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	STA ($A9),Y		  ; 91 A9 | Update graphics data
	NOP				  ; EA | No operation
	CLC				  ; 18 | Clear carry flag
	EOR ($0A,X)		  ; 41 0A | Exclusive OR with accumulator ((zero page,X))
	ASL $27			  ; 06 27 | Arithmetic shift left (zero page)
	LDA $2AEA			; AD EA 2A | Read graphics status
	EOR $07			  ; 45 07 | Exclusive OR with accumulator (zero page)
	LDA $4328EA		  ; AF EA 28 43 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	TXA				  ; 8A | Transfer X register to accumulator
	NOP				  ; EA | No operation
	ROL $0A47			; 2E 47 0A | Rotate left (absolute)
	NOP				  ; EA | No operation
	AND ($49),Y		  ; 31 49 | Logical AND with accumulator ((zero page),Y)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	LDY $02EA,X		  ; BC EA 02 | Load from absolute,X into Y register
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	STZ $C1			  ; 64 C1 | Store zero to zero page
	NOP				  ; EA | No operation
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ADC $EAC1			; 6D C1 EA | Add with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP ($EA,X)		  ; C1 EA | Compare accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CMP $EA			  ; C5 EA | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A5
; Address: $CAA8BF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A5:
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	NOP				  ; EA | No operation
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A6
; Address: $CAA8CB
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A6:
	CPY $06EA			; CC EA 06 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA ($CC,X)		  ; 81 CC | Update graphics data
	NOP				  ; EA | No operation
	AND $0958			; 2D 58 09 | Logical AND with accumulator (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDX $EACC,Y		  ; BE CC EA | Load from absolute,Y into X register
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	NOP				  ; EA | No operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	SBC $EAD4,Y		  ; F9 D4 EA | Subtract with carry (absolute,Y)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	NOP				  ; EA | No operation
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	ADC $EAD6,Y		  ; 79 D6 EA | Add with carry (absolute,Y)
	ORA $070E			; 0D 0E 07 | Logical OR with accumulator (absolute)
	ASL $29			  ; 06 29 | Arithmetic shift left (zero page)
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	BMI $05			  ; 30 05 | Branch if negative
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $D8			  ; 30 D8 | Branch if negative
	NOP				  ; EA | No operation
	AND $0906			; 2D 06 09 | Logical AND with accumulator (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDY $EADD			; AC DD EA | Load from absolute address into Y register
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	NOP				  ; EA | No operation
	AND $0605,Y		  ; 39 05 06 | Logical AND with accumulator (absolute,Y)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($E4),Y		  ; 11 E4 | Logical OR with accumulator ((zero page),Y)
	NOP				  ; EA | No operation
	ROL $38			  ; 26 38 | Rotate left (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0A8
; Address: $CAA942
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0A8:
	JSL $050636		  ; 22 36 06 05 | Jump to subroutine long
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STZ $EAEA,X		  ; 9E EA EA | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	SBC $06EA			; ED EA 06 | Subtract with carry (absolute)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	STA $ED			  ; 85 ED | Update graphics data
	NOP				  ; EA | No operation
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDA				  ; BF ED EA 0C | Read graphics status
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0029			; 0D 29 00 | Logical OR with accumulator (absolute)
	EOR $EAEE,X		  ; 5D EE EA | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AA
; Address: $CAA979
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AA:
	JSR $0608			; 20 08 06 | Jump to subroutine
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	NOP				  ; EA | No operation
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	BCC $F3			  ; 90 F3 | Branch if carry clear
	NOP				  ; EA | No operation
	ASL $050E			; 0E 0E 05 | Arithmetic shift left (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $20EAF4		  ; 8F F4 EA 20 | Update graphics data
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AB
; Address: $CAA99C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AB:
	JSL $0B091D		  ; 22 1D 09 0B | Jump to subroutine long
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	ROL $0201,X		  ; 3E 01 02 | Rotate left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ROL $0307			; 2E 07 03 | Rotate left (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AC
; Address: $CAA9C7
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AC:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ROL $0529			; 2E 29 05 | Rotate left (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LSR $EB0D			; 4E 0D EB | Logical shift right (absolute)
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	EOR $12			  ; 45 12 | Exclusive OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	AND #$05			 ; 29 05 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	INC $EB14			; EE 14 EB | Increment (absolute)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDA				  ; BF 18 EB 21 | Read graphics status
	AND #$0B			 ; 29 0B | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BMI $19			  ; 30 19 | Branch if negative
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CLV				  ; B8 | Clear overflow flag
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $20EB,X		  ; 1D EB 20 | Logical OR with accumulator (absolute,X)
	AND $05			  ; 25 05 | Logical AND with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AD
; Address: $CAAA0F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AD:
	JSR $16EB			; 20 EB 16 | Jump to subroutine
	BIT $05			  ; 24 05 | Test bits in accumulator (zero page)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AE
; Address: $CAAA18
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AE:
	JSL $2312EB		  ; 22 EB 12 23 | Jump to subroutine long
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	BIT $EB			  ; 24 EB | Test bits in accumulator (zero page)
	ORA ($23),Y		  ; 11 23 | Logical OR with accumulator ((zero page),Y)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDY $25			  ; A4 25 | Load from zero page into Y register
	XBA				  ; EB | Exchange accumulator bytes
	ASL $0722			; 0E 22 07 | Arithmetic shift left (absolute)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BCS $27			  ; B0 27 | Branch if carry set
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	AND #$EB			 ; 29 EB | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0AF
; Address: $CAAA47
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0AF:
	ASL $0823			; 0E 23 08 | Arithmetic shift left (absolute)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	SBC $EB29,Y		  ; F9 29 EB | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B0
; Address: $CAAA51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B0:
	JSL $29090A		  ; 22 0A 09 29 | Jump to subroutine long
	AND $EB2B,X		  ; 3D 2B EB | Logical AND with accumulator (absolute,X)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	CMP ($2B,X)		  ; C1 2B | Compare accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B1
; Address: $CAAA63
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B1:
	JSL $290909		  ; 22 09 09 29 | Jump to subroutine long
	AND $14EB			; 2D EB 14 | Logical AND with accumulator (absolute)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	AND $11EB			; 2D EB 11 | Logical AND with accumulator (absolute)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $EB2F,Y		  ; F9 2F EB | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B2
; Address: $CAAA87
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B2:
	JSL $2A0909		  ; 22 09 09 2A | Jump to subroutine long
	JMP ($EB30)		  ; 6C 30 EB | Jump to address (absolute indirect)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($EB),Y		  ; 31 EB | Logical AND with accumulator ((zero page),Y)
	ORA $092A,Y		  ; 19 2A 09 | Logical OR with accumulator (absolute,Y)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B3
; Address: $CAAA9E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B3:
	JSR $EB32			; 20 32 EB | Jump to subroutine
	BIT $25			  ; 24 25 | Test bits in accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT #$33			 ; 89 33 | Test bits in accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $35			  ; D0 35 | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	INC				  ; 1A | Increment accumulator
	ASL $2A0A			; 0E 0A 2A | Arithmetic shift left (absolute)
	LDX $EB36			; AE 36 EB | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B4
; Address: $CAAABC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B4:
	JSL $09081B		  ; 22 1B 08 09 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $37			  ; 06 37 | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B5
; Address: $CAAAC9
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B5:
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	LSR $0908			; 4E 08 09 | Logical shift right (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $18EB,Y		  ; 39 EB 18 | Logical AND with accumulator (absolute,Y)
	ROL $09			  ; 26 09 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	LDY $EB3E			; AC 3E EB | Load from absolute address into Y register
	AND $0707			; 2D 07 07 | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $EB3F,Y		  ; 19 3F EB | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	XBA				  ; EB | Exchange accumulator bytes
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ASL $41			  ; 06 41 | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $EB42			; CC 42 EB | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$EB			 ; 42 EB | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B6
; Address: $CAAB43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B6:
	JSR $1340			; 20 40 13 | Jump to subroutine
	ORA $002A			; 0D 2A 00 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B7
; Address: $CAAB54
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B7:
	XBA				  ; EB | Exchange accumulator bytes
	AND ($0B),Y		  ; 31 0B | Logical AND with accumulator ((zero page),Y)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	LSR $EB			  ; 46 EB | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B8
; Address: $CAAB5E
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B8:
	JSL $080837		  ; 22 37 08 08 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	AND $EB49			; 2D 49 EB | Logical AND with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$EB			 ; 49 EB | Exclusive OR with accumulator (immediate)
	BIT $0853			; 2C 53 08 | Test bits in accumulator (absolute)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	EOR #$EB			 ; 49 EB | Exclusive OR with accumulator (immediate)
	AND ($58),Y		  ; 31 58 | Logical AND with accumulator ((zero page),Y)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0F05			; 0D 05 0F | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $EB4F,Y		  ; 39 4F EB | Logical AND with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($4F),Y		  ; 51 4F | Exclusive OR with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $EB4F			; CC 4F EB | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	SBC $EB4F,X		  ; FD 4F EB | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $1614,X		  ; 1D 14 16 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BVC $EB			  ; 50 EB | Branch if overflow clear
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0B9
; Address: $CAABCB
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0B9:
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($EB),Y		  ; 51 EB | Exclusive OR with accumulator ((zero page),Y)
	AND ($17),Y		  ; 31 17 | Logical AND with accumulator ((zero page),Y)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0808,X		  ; 1D 08 08 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $2A0A			; 0D 0A 2A | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $091F,X		  ; 1D 1F 09 | Logical OR with accumulator (absolute,X)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	SBC $EB54			; ED 54 EB | Subtract with carry (absolute)
	ORA $0923,X		  ; 1D 23 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0923,X		  ; 1D 23 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $0EEB,Y		  ; 59 EB 0E | Exclusive OR with accumulator (absolute,Y)
	ASL $0F09,X		  ; 1E 09 0F | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $1DEB,Y		  ; 59 EB 1D | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	PHY				  ; 5A | Push Y register to stack
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	STA				  ; 9F 5B EB 1D | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	INC $5B			  ; E6 5B | Increment (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $081DEB		  ; 5C EB 1D 08 | Jump to address long
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $EB5C			; AD 5C EB | Read graphics status
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BA
; Address: $CAAC55
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BA:
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $EB5D			; 2C 5D EB | Test bits in accumulator (absolute)
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $EB5D			; 6D 5D EB | Add with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $36EB,X		  ; 5D EB 36 | Exclusive OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $002A			; 0D 2A 00 | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $EB			  ; 65 EB | Add with carry (zero page)
	ASL $080D			; 0E 0D 08 | Arithmetic shift left (absolute)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ADC #$EB			 ; 69 EB | Add with carry (immediate)
	ASL $080E			; 0E 0E 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ADC #$EB			 ; 69 EB | Add with carry (immediate)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC #$EB			 ; 69 EB | Add with carry (immediate)
	BPL $09			  ; 10 09 | Branch if positive
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ADC #$EB			 ; 69 EB | Add with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $09			  ; 30 09 | Branch if negative
	ORA $002A			; 0D 2A 00 | Logical OR with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	WDM #$34			 ; 42 34 | Reserved instruction
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$6C			 ; 49 6C | Exclusive OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $0B0A			; 0E 0A 0B | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	STA $EB6F,X		  ; 9D 6F EB | Update graphics data
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BB
; Address: $CAACCC
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BB:
	INY				  ; C8 | Increment Y register
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $0606,X		  ; 1E 06 06 | Arithmetic shift left (absolute,X)
	AND $EB70,X		  ; 3D 70 EB | Logical AND with accumulator (absolute,X)
	EOR #$1B			 ; 49 1B | Exclusive OR with accumulator (immediate)
	ORA #$2B			 ; 09 2B | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	XBA				  ; EB | Exchange accumulator bytes
	ROL $041B,X		  ; 3E 1B 04 | Rotate left (absolute,X)
	BPL $2B			  ; 10 2B | Branch if positive
	STA ($75,X)		  ; 81 75 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND $0419,X		  ; 3D 19 04 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	XBA				  ; EB | Exchange accumulator bytes
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ADC $05EB,Y		  ; 79 EB 05 | Add with carry (absolute,Y)
	ADC $05EB,Y		  ; 79 EB 05 | Add with carry (absolute,Y)
	BRA $79			  ; 80 79 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $28EB,Y		  ; 79 EB 28 | Add with carry (absolute,Y)
	BPL $05			  ; 10 05 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $EB79			; CC 79 EB | Compare Y register (absolute)
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	EOR ($37,X)		  ; 41 37 | Exclusive OR with accumulator ((zero page,X))
	ASL $2B0B			; 0E 0B 2B | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	LDX $EB83			; AE 83 EB | Load from absolute address into X register
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	BVC $34			  ; 50 34 | Branch if overflow clear
	STA $27EB			; 8D EB 27 | Update graphics data
	BCC $EB			  ; 90 EB | Branch if carry clear
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	AND ($35),Y		  ; 31 35 | Logical AND with accumulator ((zero page),Y)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	AND $EB93,Y		  ; 39 93 EB | Logical AND with accumulator (absolute,Y)
	BPL $2B			  ; 10 2B | Branch if positive
	SBC $EB98,Y		  ; F9 98 EB | Subtract with carry (absolute,Y)
	EOR $32			  ; 45 32 | Exclusive OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BC
; Address: $CAAD74
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BC:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $EB9B			; CC 9B EB | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$A5			 ; C9 A5 | Compare accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	AND $0607			; 2D 07 06 | Logical AND with accumulator (absolute)
	ADC ($AA),Y		  ; 71 AA | Add with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	BIT $0431			; 2C 31 04 | Test bits in accumulator (absolute)
	ORA $2B			  ; 05 2B | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	LDA $28EB			; AD EB 28 | Read graphics status
	AND $0607			; 2D 07 06 | Logical AND with accumulator (absolute)
	LDA $AF			  ; A5 AF | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	BIT $0431			; 2C 31 04 | Test bits in accumulator (absolute)
	ORA $2B			  ; 05 2B | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	SEC				  ; 38 | Set carry flag
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	BIT $CF00			; 2C 00 CF | Test bits in accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	WDM #$05			 ; 42 05 | Reserved instruction
	BIT $1700			; 2C 00 17 | Test bits in accumulator (absolute)
	LDA $30EB,X		  ; BD EB 30 | Read graphics status
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BIT $2700			; 2C 00 27 | Test bits in accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BIT $DD00			; 2C 00 DD | Test bits in accumulator (absolute)
	DEC $EB			  ; C6 EB | Decrement (zero page)
	BIT $2E00			; 2C 00 2E | Test bits in accumulator (absolute)
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $3700			; 2C 00 37 | Test bits in accumulator (absolute)
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ORA $002D			; 0D 2D 00 | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	AND $EB00			; 2D 00 EB | Logical AND with accumulator (absolute)
	CMP $01EB			; CD EB 01 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BD
; Address: $CAADF3
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BD:
	AND $BC00			; 2D 00 BC | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	AND $C100			; 2D 00 C1 | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $CA00			; 2D 00 CA | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	AND $CF00			; 2D 00 CF | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $D800			; 2D 00 D8 | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	AND $DD00			; 2D 00 DD | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $E600			; 2D 00 E6 | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	AND $EB00			; 2D 00 EB | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $F400			; 2D 00 F4 | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	AND $F900			; 2D 00 F9 | Logical AND with accumulator (absolute)
	BNE $EB			  ; D0 EB | Branch if not equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $0200			; 2D 00 02 | Logical AND with accumulator (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	AND $0700			; 2D 00 07 | Logical AND with accumulator (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $1000			; 2D 00 10 | Logical AND with accumulator (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	AND $1500			; 2D 00 15 | Logical AND with accumulator (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	AND $1E00			; 2D 00 1E | Logical AND with accumulator (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ROL $2700			; 2E 00 27 | Rotate left (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ROL $C500			; 2E 00 C5 | Rotate left (absolute)
	CMP ($EB),Y		  ; D1 EB | Compare accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA $002E			; 0D 2E 00 | Logical OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BE
; Address: $CAAE90
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BE:
	XBA				  ; EB | Exchange accumulator bytes
	ROL $0A49,X		  ; 3E 49 0A | Rotate left (absolute,X)
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0BF
; Address: $CAAE9A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0BF:
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	BPL $2E			  ; 10 2E | Branch if positive
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	XBA				  ; EB | Exchange accumulator bytes
	AND $0B3A,Y		  ; 39 3A 0B | Logical AND with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $AE00			; 2E 00 AE | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	BPL $0A			  ; 10 0A | Branch if positive
	ROL $3E00			; 2E 00 3E | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $3E00			; 2E 00 3E | Rotate left (absolute)
	CPX #$EB			 ; E0 EB | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C0
; Address: $CAAEBF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C0:
	JSR $0F10			; 20 10 0F | Jump to subroutine
	ROL $4F00			; 2E 00 4F | Rotate left (absolute)
	CPX $EB			  ; E4 EB | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C1
; Address: $CAAEC7
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C1:
	JSL $080C28		  ; 22 28 0C 08 | Jump to subroutine long
	ROL $D700			; 2E 00 D7 | Rotate left (absolute)
	CPX $EB			  ; E4 EB | Compare X register (zero page)
	ASL $0F13			; 0E 13 0F | Arithmetic shift left (absolute)
	ROL $0900			; 2E 00 09 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ROL $2B00			; 2E 00 2B | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	BMI $30			  ; 30 30 | Branch if negative
	ROL $1D00			; 2E 00 1D | Rotate left (absolute)
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	BMI $24			  ; 30 24 | Branch if negative
	ROL $1D00			; 2E 00 1D | Rotate left (absolute)
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	AND $29			  ; 25 29 | Logical AND with accumulator (zero page)
	ROL $6300			; 2E 00 63 | Rotate left (absolute)
	SBC #$EB			 ; E9 EB | Subtract with carry (immediate)
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $3900			; 2E 00 39 | Rotate left (absolute)
	NOP				  ; EA | No operation
	XBA				  ; EB | Exchange accumulator bytes
	CLC				  ; 18 | Clear carry flag
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ROL $3200			; 2E 00 32 | Rotate left (absolute)
	SBC $23EB			; ED EB 23 | Subtract with carry (absolute)
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	ROL $B900			; 2E 00 B9 | Rotate left (absolute)
	SBC $01EB			; ED EB 01 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C2
; Address: $CAAF19
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C2:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $1400			; 2E 00 14 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $1700			; 2E 00 17 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $1A00			; 2E 00 1A | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $1F00			; 2E 00 1F | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ROL $2300			; 2E 00 23 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ROL $3100			; 2E 00 31 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C3
; Address: $CAAF4E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C3:
	JSL $080A35		  ; 22 35 0A 08 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	AND $37			  ; 25 37 | Logical AND with accumulator (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $0B3A,X		  ; 1E 3A 0B | Arithmetic shift left (absolute,X)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	PEA #$1CEB		   ; F4 EB 1C | Push effective address to stack
	AND $0A0C,Y		  ; 39 0C 0A | Logical AND with accumulator (absolute,Y)
	SBC ($F6,X)		  ; E1 F6 | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ASL $0B37,X		  ; 1E 37 0B | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $1CEB,Y		  ; F9 EB 1C | Subtract with carry (absolute,Y)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $0E09,X		  ; 1E 09 0E | Arithmetic shift left (absolute,X)
	ADC $EBFE,Y		  ; 79 FE EB | Add with carry (absolute,Y)
	BPL $22			  ; 10 22 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $EBFF			; 9C FF EB | Store zero to absolute
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	CPX $EC00			; EC 00 EC | Compare X register (absolute)
	ROL $0634,X		  ; 3E 34 06 | Rotate left (absolute,X)
	CPX $3134			; EC 34 31 | Compare X register (absolute)
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	CMP $EC08			; CD 08 EC | Compare accumulator (absolute)
	BMI $08			  ; 30 08 | Branch if negative
	CPX $252E			; EC 2E 25 | Compare X register (absolute)
	STZ $EC0F			; 9C 0F EC | Store zero to absolute
	BIT $0824			; 2C 24 08 | Test bits in accumulator (absolute)
	BPL $2F			  ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C4
; Address: $CAAFC9
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C4:
	PEA #$EC11		   ; F4 11 EC | Push effective address to stack
	ORA $1507,X		  ; 1D 07 15 | Logical OR with accumulator (absolute,X)
	JMP ($EC14)		  ; 6C 14 EC | Jump to address (absolute indirect)
	BMI $1C			  ; 30 1C | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CPX $1B30			; EC 30 1B | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	CMP $EC17,X		  ; DD 17 EC | Compare accumulator (absolute,X)
	BMI $1A			  ; 30 1A | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	EOR ($19),Y		  ; 51 19 | Exclusive OR with accumulator ((zero page),Y)
	CPX $1406			; EC 06 14 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CPX $1306			; EC 06 13 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $1A			  ; F0 1A | Branch if equal
	CPX $411D			; EC 1D 41 | Compare X register (absolute)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	CPX $4620			; EC 20 46 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	ORA $EC1E,X		  ; 1D 1E EC | Logical OR with accumulator (absolute,X)
	ASL $0A27,X		  ; 1E 27 0A | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $EC21			; 2E 21 EC | Rotate left (absolute)
	ROL $0B			  ; 26 0B | Rotate left (zero page)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	CPX $211A			; EC 1A 21 | PPU graphics register access
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	LDX $25			  ; A6 25 | Load from zero page into X register
	CPX $2118			; EC 18 21 | PPU graphics register access
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	LSR $EC27			; 4E 27 EC | Logical shift right (absolute)
	ORA $2F0B			; 0D 0B 2F | Logical OR with accumulator (absolute)
	AND $EC29			; 2D 29 EC | Logical AND with accumulator (absolute)
	ASL $2F0B			; 0E 0B 2F | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C5
; Address: $CAB048
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C5:
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $1E16			; EC 16 1E | Compare X register (absolute)
	ORA $2F0B			; 0D 0B 2F | Logical OR with accumulator (absolute)
	CPX $1E14			; EC 14 1E | Compare X register (absolute)
	ASL $2F0B			; 0E 0B 2F | Arithmetic shift left (absolute)
	AND $29EC			; 2D EC 29 | Logical AND with accumulator (absolute)
	AND $0B0A,Y		  ; 39 0A 0B | Logical AND with accumulator (absolute,Y)
	EOR $EC2E,X		  ; 5D 2E EC | Exclusive OR with accumulator (absolute,X)
	BIT $093C			; 2C 3C 09 | Test bits in accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C6
; Address: $CAB06D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C6:
	CPX $3820			; EC 20 38 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $371E			; EC 1E 37 | Compare X register (absolute)
	BPL $0B			  ; 10 0B | Branch if positive
	CPX $3722			; EC 22 37 | Compare X register (absolute)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	CPX $3620			; EC 20 36 | Compare X register (absolute)
	BPL $0A			  ; 10 0A | Branch if positive
	CPX $2E1A			; EC 1A 2E | Compare X register (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C7
; Address: $CAB09A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C7:
	CPX $2D18			; EC 18 2D | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($EC,X)		  ; 41 EC | Exclusive OR with accumulator ((zero page,X))
	BPL $1B			  ; 10 1B | Branch if positive
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CPX $1A0E			; EC 0E 1A | Compare X register (absolute)
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	EOR #$44			 ; 49 44 | Exclusive OR with accumulator (immediate)
	CPX $1B10			; EC 10 1B | Compare X register (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	EOR $EC			  ; 45 EC | Exclusive OR with accumulator (zero page)
	ASL $0719			; 0E 19 07 | Arithmetic shift left (absolute)
	CPY $EC46			; CC 46 EC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C8
; Address: $CAB0CE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C8:
	JSR $EC48			; 20 48 EC | Jump to subroutine
	AND #$48			 ; 29 48 | Logical AND with accumulator (immediate)
	CPX $251D			; EC 1D 25 | Compare X register (absolute)
	BPL $2F			  ; 10 2F | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CPX $371F			; EC 1F 37 | Compare X register (absolute)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BMI $4A			  ; 30 4A | Branch if negative
	CPX $150C			; EC 0C 15 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	JMP $0AEC			; 4C EC 0A | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $0AEC			; 4D EC 0A | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR $0AEC			; 4E EC 0A | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX $4E			  ; E4 4E | Compare X register (zero page)
	CPX $150C			; EC 0C 15 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0C9
; Address: $CAB118
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0C9:
	CPX $150C			; EC 0C 15 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA $EC50,Y		  ; 99 50 EC | Update graphics data
	ASL $092B,X		  ; 1E 2B 09 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR ($EC),Y		  ; 51 EC | Exclusive OR with accumulator ((zero page),Y)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	CPX $281F			; EC 1F 28 | Compare X register (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPX $2920			; EC 20 29 | Compare X register (absolute)
	CPX $1A1D			; EC 1D 1A | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $EC59			; 2E 59 EC | Rotate left (absolute)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ROR $EC5A,X		  ; 7E 5A EC | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	JMP $1D13EC		  ; 5C EC 13 1D | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $10EC,X		  ; 5D EC 10 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	DEC $EC5D,X		  ; DE 5D EC | Decrement (absolute,X)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	LSR $25EC,X		  ; 5E EC 25 | Logical shift right (absolute,X)
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CA
; Address: $CAB184
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CA:
	CPX $2635			; EC 35 26 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $462D			; EC 2D 46 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ADC $EC			  ; 65 EC | Add with carry (zero page)
	ROL $0B48			; 2E 48 0B | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BNE $6B			  ; D0 6B | Branch if not equal
	CPX $0201			; EC 01 02 | Compare X register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	ROR $EC6F,X		  ; 7E 6F EC | Rotate right (absolute,X)
	ORA $0906,Y		  ; 19 06 09 | Logical OR with accumulator (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	CPX $1C18			; EC 18 1C | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CB
; Address: $CAB1B8
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CB:
	SBC ($70),Y		  ; F1 70 | Subtract with carry ((zero page),Y)
	CPX $1E19			; EC 19 1E | Compare X register (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	SBC $EC71			; ED 71 EC | Subtract with carry (absolute)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	CPX $1F19			; EC 19 1F | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX $201B			; EC 1B 20 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$77			 ; C0 77 | Compare Y register (immediate)
	CPX $3D2C			; EC 2C 3D | Compare X register (absolute)
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $3C2A			; EC 2A 3C | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $00			  ; 30 00 | Branch if negative
	INC $EC7F,X		  ; FE 7F EC | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	ORA $3009			; 0D 09 30 | Logical OR with accumulator (absolute)
	CPY $84			  ; C4 84 | Compare Y register (zero page)
	CPX $3F26			; EC 26 3F | Compare X register (absolute)
	ASL $300A			; 0E 0A 30 | Arithmetic shift left (absolute)
	BIT #$EC			 ; 89 EC | Test bits in accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($0D,X)		  ; 41 0D | Exclusive OR with accumulator ((zero page,X))
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $26EC			; 8D EC 26 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	ASL $300A			; 0E 0A 30 | Arithmetic shift left (absolute)
	CPX $EC91			; EC 91 EC | Compare X register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA $3009			; 0D 09 30 | Logical OR with accumulator (absolute)
	CPX $3E26			; EC 26 3E | Compare X register (absolute)
	ASL $300A			; 0E 0A 30 | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	STA $28EC,Y		  ; 99 EC 28 | Update graphics data
	EOR ($0D,X)		  ; 41 0D | Exclusive OR with accumulator ((zero page,X))
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)
	ASL $EC9D,X		  ; 1E 9D EC | Arithmetic shift left (absolute,X)
	ROL $40			  ; 26 40 | Rotate left (zero page)
	ASL $300A			; 0E 0A 30 | Arithmetic shift left (absolute)
	LDA ($EC,X)		  ; A1 EC | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CC
; Address: $CAB239
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CC:
	JSL $080D3A		  ; 22 3A 0D 08 | Jump to subroutine long
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BEQ $A4			  ; F0 A4 | Branch if equal
	CPX $3A20			; EC 20 3A | Compare X register (absolute)
	ASL $3108			; 0E 08 31 | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $2522			; EC 22 25 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	LDA				  ; BF AB EC 20 | Read graphics status
	AND $0B			  ; 25 0B | Logical AND with accumulator (zero page)
	ASL $31			  ; 06 31 | Arithmetic shift left (zero page)
	LDA $22EC			; AD EC 22 | Read graphics status
	ASL $0E09,X		  ; 1E 09 0E | Arithmetic shift left (absolute,X)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	BCS $EC			  ; B0 EC | Branch if carry set

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CD
; Address: $CAB266
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CD:
	JSR $0A1E			; 20 1E 0A | Jump to subroutine
	ASL $0031			; 0E 31 00 | Arithmetic shift left (absolute)
	CPX $2D20			; EC 20 2D | Compare X register (absolute)
	ASL $310A			; 0E 0A 31 | Arithmetic shift left (absolute)
	CPX $2D20			; EC 20 2D | Compare X register (absolute)
	ASL $310A			; 0E 0A 31 | Arithmetic shift left (absolute)
	STY $ECB6			; 8C B6 EC | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	AND $0C			  ; 25 0C | Logical AND with accumulator (zero page)
	ORA #$31			 ; 09 31 | Logical OR with accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	CPX $2416			; EC 16 24 | Compare X register (absolute)
	ORA $310A			; 0D 0A 31 | Logical OR with accumulator (absolute)
	DEC $BB			  ; C6 BB | Decrement (zero page)
	CPX $4219			; EC 19 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $30EC,X		  ; BD EC 30 | Read graphics status
	BVC $00			  ; 50 00 | Branch if overflow clear
	REP #$EC			 ; C2 EC | Reset processor status bits
	ORA $043E,Y		  ; 19 3E 04 | Logical OR with accumulator (absolute,Y)
	ORA $C6			  ; 05 C6 | Logical OR with accumulator (zero page)
	CPX $5030			; EC 30 50 | Compare X register (absolute)
	INY				  ; C8 | Increment Y register
	CPX $2012			; EC 12 20 | Compare X register (absolute)
	AND ($CC,X)		  ; 21 CC | Logical AND with accumulator ((zero page,X))
	CPX $1F11			; EC 11 1F | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CMP $14EC			; CD EC 14 | Compare accumulator (absolute)
	LDX #$CE			 ; A2 CE | Load immediate value into X register
	CPX $3B14			; EC 14 3B | Compare X register (absolute)
	EOR ($D0),Y		  ; 51 D0 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CE
; Address: $CAB2DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CE:
	CPX $1112			; EC 12 11 | Compare X register (absolute)
	ASL $33			  ; 06 33 | Arithmetic shift left (zero page)
	CPX $1114			; EC 14 11 | Compare X register (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CMP $ECD2			; CD D2 EC | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0CF
; Address: $CAB2ED
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0CF:
	JSR $072D			; 20 2D 07 | Jump to subroutine
	CPX $2B20			; EC 20 2B | Compare X register (absolute)
	ORA $0033			; 0D 33 00 | Logical OR with accumulator (absolute)
	ROL $ECD5,X		  ; 3E D5 EC | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $33			  ; 06 33 | Arithmetic shift left (zero page)
	BIT $ECD7			; 2C D7 EC | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ASL $33			  ; 06 33 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	CLD				  ; D8 | Clear decimal mode flag
	CPX $3C24			; EC 24 3C | Compare X register (absolute)
	JMP ($ECDA)		  ; 6C DA EC | Jump to address (absolute indirect)
	BIT $3A			  ; 24 3A | Test bits in accumulator (zero page)
	STZ $DD			  ; 64 DD | Store zero to zero page
	CPX $3B28			; EC 28 3B | Compare X register (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	CPX $3928			; EC 28 39 | Compare X register (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	DEC $E2			  ; C6 E2 | Decrement (zero page)
	CPX $2524			; EC 24 25 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $EC			  ; E4 EC | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D0
; Address: $CAB33E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D0:
	JSL $0C0B23		  ; 22 23 0B 0C | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $2A26			; EC 26 2A | Compare X register (absolute)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	BPL $E9			  ; 10 E9 | Branch if positive
	CPX $2723			; EC 23 27 | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $26EC			; EC EC 26 | Compare X register (absolute)
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $23EC			; EE EC 23 | Increment (absolute)
	AND $0B09			; 2D 09 0B | Logical AND with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	CPX $2627			; EC 27 26 | Compare X register (absolute)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	AND #$F4			 ; 29 F4 | Logical AND with accumulator (immediate)
	CPX $2024			; EC 24 20 | Compare X register (absolute)
	ORA $0034			; 0D 34 00 | Logical OR with accumulator (absolute)
	CPX $312B			; EC 2B 31 | Compare X register (absolute)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D1
; Address: $CAB384
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D1:
	SBC $27EC,Y		  ; F9 EC 27 | Subtract with carry (absolute,Y)
	AND ($0B),Y		  ; 31 0B | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$FD			 ; C9 FD | Compare accumulator (immediate)
	CPX $3A20			; EC 20 3A | Compare X register (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	AND $ED00,Y		  ; 39 00 ED | Logical AND with accumulator (absolute,Y)
	ORA $0B35,X		  ; 1D 35 0B | Logical OR with accumulator (absolute,X)
	SBC $141D			; ED 1D 14 | Subtract with carry (absolute)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ADC $ED06			; 6D 06 ED | Add with carry (absolute)
	ORA $0A12,Y		  ; 19 12 0A | Logical OR with accumulator (absolute,Y)
	ORA $35			  ; 05 35 | Logical OR with accumulator (zero page)
	LSR $ED08,X		  ; 5E 08 ED | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $09			  ; 50 09 | Branch if overflow clear
	SBC $1A14			; ED 14 1A | Subtract with carry (absolute)
	ORA $35			  ; 05 35 | Logical OR with accumulator (zero page)
	CMP $ED0A,X		  ; DD 0A ED | Compare accumulator (absolute,X)
	SBC $ED0B			; ED 0B ED | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BIT $ED0C			; 2C 0C ED | Test bits in accumulator (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ROL $ED0C,X		  ; 3E 0C ED | Rotate left (absolute,X)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BVC $0C			  ; 50 0C | Branch if overflow clear
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $ED0C,Y		  ; 59 0C ED | Exclusive OR with accumulator (absolute,Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D2
; Address: $CAB44B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D2:
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ADC $ED0C,X		  ; 7D 0C ED | Add with carry (absolute,X)
	STX $0C			  ; 86 0C | Store X register to zero page
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	STA $02ED0C		  ; 8F 0C ED 02 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDA ($0C,X)		  ; A1 0C | Read graphics status
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D3
; Address: $CAB48A
; Size: 135 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D3:
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDA $02ED0C		  ; AF 0C ED 02 | Read graphics status
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDA $ED0C,X		  ; BD 0C ED | Read graphics status
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CMP $ED0C,Y		  ; D9 0C ED | Compare accumulator (absolute,Y)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	INC $ED0C			; EE 0C ED | Increment (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ROL $0D			  ; 26 0D | Rotate left (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	AND $ED0D			; 2D 0D ED | Logical AND with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	WDM #$0D			 ; 42 0D | Reserved instruction
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR #$0D			 ; 49 0D | Exclusive OR with accumulator (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	STZ $0D			  ; 64 0D | Store zero to zero page
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ADC $ED0D			; 6D 0D ED | Add with carry (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	STA ($0D),Y		  ; 91 0D | Update graphics data
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	LDY $ED0D			; AC 0D ED | Load from absolute address into Y register
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	LDX $ED0D,Y		  ; BE 0D ED | Load from absolute,Y into X register
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D4
; Address: $CAB5DE
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D4:
	BNE $0D			  ; D0 0D | Branch if not equal
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CMP $ED0D,Y		  ; D9 0D ED | Compare accumulator (absolute,Y)
	SEP #$0D			 ; E2 0D | Set processor status bits
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $02ED			; 0D ED 02 | Logical OR with accumulator (absolute)
	PEA #$ED0D		   ; F4 0D ED | Push effective address to stack
	SBC $ED0D,X		  ; FD 0D ED | Subtract with carry (absolute,X)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ROL $0E			  ; 26 0E | Rotate left (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	AND $ED0E			; 2D 0E ED | Logical AND with accumulator (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	WDM #$0E			 ; 42 0E | Reserved instruction
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR #$0E			 ; 49 0E | Exclusive OR with accumulator (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BVC $0E			  ; 50 0E | Branch if overflow clear
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $ED0E,Y		  ; 59 0E ED | Exclusive OR with accumulator (absolute,Y)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D5
; Address: $CAB68A
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D5:
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ADC $ED0E,X		  ; 7D 0E ED | Add with carry (absolute,X)
	STX $0E			  ; 86 0E | Store X register to zero page
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	STA $02ED0E		  ; 8F 0E ED 02 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	STZ $ED0E			; 9C 0E ED | Store zero to absolute
	LDA $0E			  ; A5 0E | Read graphics status
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDX $ED0E			; AE 0E ED | Load from absolute address into X register
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	CPX $0E			  ; E4 0E | Compare X register (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D6
; Address: $CAB710
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D6:
	SBC $ED0E			; ED 0E ED | Subtract with carry (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	ASL $02ED			; 0E ED 02 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BIT $ED0F			; 2C 0F ED | Test bits in accumulator (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ROL $ED0F,X		  ; 3E 0F ED | Rotate left (absolute,X)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BVC $0F			  ; 50 0F | Branch if overflow clear
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $ED0F,Y		  ; 59 0F ED | Exclusive OR with accumulator (absolute,Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D7
; Address: $CAB790
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D7:
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ADC $ED0F,X		  ; 7D 0F ED | Add with carry (absolute,X)
	STX $0F			  ; 86 0F | Store X register to zero page
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	STA $02ED0F		  ; 8F 0F ED 02 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDA ($0F,X)		  ; A1 0F | Read graphics status
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDY $ED0F,X		  ; BC 0F ED | Load from absolute,X into Y register
	CMP $0F			  ; C5 0F | Compare accumulator (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	DEC $ED0F			; CE 0F ED | Decrement (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BPL $ED			  ; 10 ED | Branch if positive
	ORA $ED10			; 0D 10 ED | Logical OR with accumulator (absolute)
	BPL $ED			  ; 10 ED | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $ED			  ; 10 ED | Branch if positive
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D8
; Address: $CAB856
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D8:
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	BPL $ED			  ; 10 ED | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive
	JMP $ED10			; 4C 10 ED | Jump to address
	BPL $ED			  ; 10 ED | Branch if positive
	LSR $ED10,X		  ; 5E 10 ED | Logical shift right (absolute,X)
	BPL $ED			  ; 10 ED | Branch if positive
	BVS $10			  ; 70 10 | Branch if overflow set
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ADC $ED10,Y		  ; 79 10 ED | Add with carry (absolute,Y)
	BPL $ED			  ; 10 ED | Branch if positive
	PHB				  ; 8B | Push data bank register to stack
	BPL $ED			  ; 10 ED | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive
	STA $ED10,X		  ; 9D 10 ED | Update graphics data
	LDX $10			  ; A6 10 | Load from zero page into X register
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LDA $02ED10		  ; AF 10 ED 02 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	BPL $ED			  ; 10 ED | Branch if positive
	CMP ($10,X)		  ; C1 10 | Compare accumulator ((zero page,X))
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	DEX				  ; CA | Decrement X register
	BPL $ED			  ; 10 ED | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive
	SBC $10			  ; E5 10 | Subtract with carry (zero page)
	SBC $080A			; ED 0A 08 | Subtract with carry (absolute)
	INC $ED10			; EE 10 ED | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ORA ($ED),Y		  ; 11 ED | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $1800,Y		  ; 39 00 18 | Logical AND with accumulator (absolute,Y)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	AND $1B00,Y		  ; 39 00 1B | Logical AND with accumulator (absolute,Y)
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	ASL $ED12,X		  ; 1E 12 ED | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ROL $12			  ; 26 12 | Rotate left (zero page)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	AND $2A00,X		  ; 3D 00 2A | Logical AND with accumulator (absolute,X)
	SBC $0604			; ED 04 06 | Subtract with carry (absolute)
	ROL $2D00,X		  ; 3E 00 2D | Rotate left (absolute,X)
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	ROL $4600,X		  ; 3E 00 46 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0D9
; Address: $CAB964
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0D9:
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	ROL $4B00,X		  ; 3E 00 4B | Rotate left (absolute,X)
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	ROL $5000,X		  ; 3E 00 50 | Rotate left (absolute,X)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ROL $5500,X		  ; 3E 00 55 | Rotate left (absolute,X)
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	ROL $5C00,X		  ; 3E 00 5C | Rotate left (absolute,X)
	SBC $0201			; ED 01 02 | Subtract with carry (absolute)
	ROL $6100,X		  ; 3E 00 61 | Rotate left (absolute,X)
	SBC $0708			; ED 08 07 | Subtract with carry (absolute)
	ROR $12			  ; 66 12 | Rotate right (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $12			  ; E5 12 | Subtract with carry (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	INC $ED12			; EE 12 ED | Increment (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT $13			  ; 24 13 | Test bits in accumulator (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	AND $ED13			; 2D 13 ED | Logical AND with accumulator (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	PHA				  ; 48 | Push accumulator to stack
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR ($13),Y		  ; 51 13 | Exclusive OR with accumulator ((zero page),Y)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0DA
; Address: $CABA43
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0DA:
	JMP ($ED13)		  ; 6C 13 ED | Jump to address (absolute indirect)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ROR $ED13,X		  ; 7E 13 ED | Rotate right (absolute,X)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	BCC $13			  ; 90 13 | Branch if carry clear
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $ED13			; 9C 13 ED | Store zero to absolute
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LDA $13			  ; A5 13 | Read graphics status
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LDX $ED13			; AE 13 ED | Load from absolute address into X register
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY $13			  ; C4 13 | Compare Y register (zero page)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $ED13			; CE 13 ED | Decrement (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $DD00			; 4C 00 DD | Jump to address
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	EOR $E200			; 4D 00 E2 | Exclusive OR with accumulator (absolute)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	LSR $E500			; 4E 00 E5 | Logical shift right (absolute)
	SBC $0102			; ED 02 01 | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	SBC $0104			; ED 04 01 | Subtract with carry (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0DB
; Address: $CABAF7
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0DB:
	SBC $ED13			; ED 13 ED | Subtract with carry (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	BIT #$15			 ; 89 15 | Test bits in accumulator (immediate)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	INY				  ; C8 | Increment Y register
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	JMP $10ED19		  ; 5C 19 ED 10 | Jump to address long
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $ED1B,X		  ; BC 1B ED | Load from absolute,X into Y register
	BPL $0D			  ; 10 0D | Branch if positive
	EOR $F800,Y		  ; 59 00 F8 | Exclusive OR with accumulator (absolute,Y)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	SBC ($1D,X)		  ; E1 1D | Subtract with carry ((zero page,X))
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ASL $10ED,X		  ; 1E ED 10 | Arithmetic shift left (absolute,X)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	JMP $200A00		  ; 5C 00 0A 20 | Jump to address long
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	EOR $AC00,X		  ; 5D 00 AC | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0DC
; Address: $CABB6D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0DC:
	JSR $10ED			; 20 ED 10 | Jump to subroutine
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	LSR $6300,X		  ; 5E 00 63 | Logical shift right (absolute,X)
	AND ($ED,X)		  ; 21 ED | Logical AND with accumulator ((zero page,X))
	BPL $0D			  ; 10 0D | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0DE
; Address: $CABB87
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0DE:
	CLI				  ; 58 | Clear interrupt disable flag
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ADC ($24,X)		  ; 61 24 | Add with carry ((zero page,X))
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ADC $ED25			; 6D 25 ED | Add with carry (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ROL $ED			  ; 26 ED | Rotate left (zero page)
	BPL $0D			  ; 10 0D | Branch if positive
	STZ $00			  ; 64 00 | Store zero to zero page
	CMP ($27),Y		  ; D1 27 | Compare accumulator ((zero page),Y)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	EOR $ED29			; 4D 29 ED | Exclusive OR with accumulator (absolute)
	BPL $0D			  ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0DF
; Address: $CABBBB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0DF:
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E0
; Address: $CABBCF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E0:
	JSL $10ED2C		  ; 22 2C ED 10 | Jump to subroutine long
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $10ED			; 2D ED 10 | Logical AND with accumulator (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	AND $03ED			; 2D ED 03 | Logical AND with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	STX $ED2E			; 8E 2E ED | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E1
; Address: $CABBF4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E1:
	ROL $02ED			; 2E ED 02 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E2
; Address: $CABBFD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E2:
	ROL $02ED			; 2E ED 02 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E3
; Address: $CABC05
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E3:
	XBA				  ; EB | Exchange accumulator bytes
	ROL $02ED			; 2E ED 02 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E7
; Address: $CABC2B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E7:
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	JMP ($9F00)		  ; 6C 00 9F | Jump to address (absolute indirect)
	SBC $0F10			; ED 10 0F | Subtract with carry (absolute)
	ADC $BE00			; 6D 00 BE | Add with carry (absolute)
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	ROR $BB00			; 6E 00 BB | Rotate right (absolute)
	BMI $ED			  ; 30 ED | Branch if negative
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	STA ($31),Y		  ; 91 31 | Update graphics data
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E8
; Address: $CABC83
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E8:
	LDY $ED31			; AC 31 ED | Load from absolute address into Y register
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	LDX $ED31,Y		  ; BE 31 ED | Load from absolute,Y into X register
	AND ($ED),Y		  ; 31 ED | Logical AND with accumulator ((zero page),Y)
	BNE $31			  ; D0 31 | Branch if not equal
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP $ED31,Y		  ; D9 31 ED | Compare accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDA $ED33			; AD 33 ED | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BNE $33			  ; D0 33 | Branch if not equal
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BVC $34			  ; 50 34 | Branch if overflow clear
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CMP $34			  ; C5 34 | Compare accumulator (zero page)
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	DEC $ED34,X		  ; DE 34 ED | Decrement (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BPL $35			  ; 10 35 | Branch if positive
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	AND #$35			 ; 29 35 | Logical AND with accumulator (immediate)
	SBC $0904			; ED 04 09 | Subtract with carry (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	EOR $ED35			; 4D 35 ED | Exclusive OR with accumulator (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	AND $36			  ; 25 36 | Logical AND with accumulator (zero page)
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	STA ($36),Y		  ; 91 36 | Update graphics data
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	SBC $0410			; ED 10 04 | Subtract with carry (absolute)
	STZ $ED38			; 9C 38 ED | Store zero to absolute
	BPL $04			  ; 10 04 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0E9
; Address: $CABD4B
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0E9:
	SBC $0410			; ED 10 04 | Subtract with carry (absolute)
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	SBC $0410			; ED 10 04 | Subtract with carry (absolute)
	SEC				  ; 38 | Set carry flag
	SBC $0410			; ED 10 04 | Subtract with carry (absolute)
	AND $10ED,Y		  ; 39 ED 10 | Logical AND with accumulator (absolute,Y)
	STA $ED39,Y		  ; 99 39 ED | Update graphics data
	BPL $04			  ; 10 04 | Branch if positive
	SBC $ED39,X		  ; FD 39 ED | Subtract with carry (absolute,X)
	BPL $04			  ; 10 04 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	SBC $1010			; ED 10 10 | Subtract with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	ROL $ED3C			; 2E 3C ED | Rotate left (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	BVS $3C			  ; 70 3C | Branch if overflow set
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	PHX				  ; DA | Push X register to stack
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	AND $10ED,X		  ; 3D ED 10 | Logical AND with accumulator (absolute,X)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	AND $10ED,X		  ; 3D ED 10 | Logical AND with accumulator (absolute,X)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ADC $ED3E,Y		  ; 79 3E ED | Add with carry (absolute,Y)
	BPL $0D			  ; 10 0D | Branch if positive
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	STZ $ED41			; 9C 41 ED | Store zero to absolute
	BPL $0D			  ; 10 0D | Branch if positive
	ADC ($42,X)		  ; 61 42 | Hardware register operation
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	LDA				  ; BF 43 ED 10 | Read graphics status
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	SBC $0D10			; ED 10 0D | Subtract with carry (absolute)
	BCS $44			  ; B0 44 | Branch if carry set
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA $45			  ; 05 45 | Logical OR with accumulator (zero page)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($45),Y		  ; 11 45 | Logical OR with accumulator ((zero page),Y)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0EA
; Address: $CABE31
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0EA:
	SEI				  ; 78 | Set interrupt disable flag
	AND ($45),Y		  ; 31 45 | Logical AND with accumulator ((zero page),Y)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($45),Y		  ; 51 45 | Exclusive OR with accumulator ((zero page),Y)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $ED			  ; 45 ED | Exclusive OR with accumulator (zero page)
	BPL $09			  ; 10 09 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	ASL $ED46			; 0E 46 ED | Arithmetic shift left (absolute)
	BPL $09			  ; 10 09 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CMP $46			  ; C5 46 | Compare accumulator (zero page)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$ED			 ; 49 ED | Exclusive OR with accumulator (immediate)
	BPL $09			  ; 10 09 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$ED			 ; 49 ED | Exclusive OR with accumulator (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	ADC $AA00,Y		  ; 79 00 AA | Add with carry (absolute,Y)
	EOR #$ED			 ; 49 ED | Exclusive OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	WDM #$4A			 ; 42 4A | Reserved instruction
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	LDX $ED4A			; AE 4A ED | Load from absolute address into X register
	BPL $09			  ; 10 09 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	NOP				  ; EA | No operation
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	STA $4C			  ; 85 4C | Update graphics data
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROL $ED4D			; 2E 4D ED | Rotate left (absolute)
	BPL $09			  ; 10 09 | Branch if positive
	CPY $ED4D			; CC 4D ED | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0EB
; Address: $CABEEA
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0EB:
	BPL $09			  ; 10 09 | Branch if positive
	LSR $10ED			; 4E ED 10 | Logical shift right (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDA $10ED4E		  ; AF 4E ED 10 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LSR $10ED			; 4E ED 10 | Logical shift right (absolute)
	BPL $4F			  ; 10 4F | Branch if positive
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	AND $4F			  ; 25 4F | Logical AND with accumulator (zero page)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	EOR ($4F,X)		  ; 41 4F | Exclusive OR with accumulator ((zero page,X))
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ORA $50			  ; 05 50 | Logical OR with accumulator (zero page)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	BVC $ED			  ; 50 ED | Branch if overflow clear
	BPL $0B			  ; 10 0B | Branch if positive
	AND $51			  ; 25 51 | Logical AND with accumulator (zero page)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	CPY #$51			 ; C0 51 | Compare Y register (immediate)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	EOR $ED52			; 4D 52 ED | Exclusive OR with accumulator (absolute)
	BPL $0B			  ; 10 0B | Branch if positive
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	STA $ED53			; 8D 53 ED | Update graphics data
	BPL $0B			  ; 10 0B | Branch if positive
	ORA $ED54,Y		  ; 19 54 ED | Logical OR with accumulator (absolute,Y)
	BPL $0B			  ; 10 0B | Branch if positive
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	LDA #$56			 ; A9 56 | Read graphics status
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	LDY $57			  ; A4 57 | Load from zero page into Y register
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	EOR $10ED,Y		  ; 59 ED 10 | Exclusive OR with accumulator (absolute,Y)
	CMP #$59			 ; C9 59 | Compare accumulator (immediate)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ORA $ED5A			; 0D 5A ED | Logical OR with accumulator (absolute)
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $4900,X		  ; 7D 00 49 | Add with carry (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $7A00,X		  ; 7D 00 7A | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0EC
; Address: $CABFDB
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0EC:
	PHY				  ; 5A | Push Y register to stack
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $C900,X		  ; 7D 00 C9 | Add with carry (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $4700,X		  ; 7D 00 47 | Add with carry (absolute,X)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $DA00,X		  ; 7D 00 DA | Add with carry (absolute,X)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $8500,X		  ; 7D 00 85 | Add with carry (absolute,X)
	JMP $0B10ED		  ; 5C ED 10 0B | Jump to address long
	ADC $3200,X		  ; 7D 00 32 | Add with carry (absolute,X)
	EOR $10ED,X		  ; 5D ED 10 | Exclusive OR with accumulator (absolute,X)
	ADC $E800,X		  ; 7D 00 E8 | Add with carry (absolute,X)
	EOR $10ED,X		  ; 5D ED 10 | Exclusive OR with accumulator (absolute,X)
	ADC $A500,X		  ; 7D 00 A5 | Add with carry (absolute,X)
	LSR $10ED,X		  ; 5E ED 10 | Logical shift right (absolute,X)
	ADC $7600,X		  ; 7D 00 76 | Add with carry (absolute,X)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $8300,X		  ; 7D 00 83 | Add with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0ED
; Address: $CAC02D
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0ED:
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $9A00,X		  ; 7D 00 9A | Add with carry (absolute,X)
	ADC ($ED,X)		  ; 61 ED | Add with carry ((zero page,X))
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $AA00,X		  ; 7D 00 AA | Add with carry (absolute,X)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $AF00,X		  ; 7D 00 AF | Add with carry (absolute,X)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $C500,X		  ; 7D 00 C5 | Add with carry (absolute,X)
	STZ $ED			  ; 64 ED | Store zero to zero page
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $DF00,X		  ; 7D 00 DF | Add with carry (absolute,X)
	ADC $ED			  ; 65 ED | Add with carry (zero page)
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $ED00,X		  ; 7D 00 ED | Add with carry (absolute,X)
	ROR $ED			  ; 66 ED | Rotate right (zero page)
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $0900,X		  ; 7D 00 09 | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $EF00,X		  ; 7D 00 EF | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)
	ADC $9E00,X		  ; 7D 00 9E | Add with carry (absolute,X)
	ADC #$ED			 ; 69 ED | Add with carry (immediate)
	BPL $0B			  ; 10 0B | Branch if positive
	ADC $2700,X		  ; 7D 00 27 | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0B10			; ED 10 0B | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0EE
; Address: $CAC08C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0EE:
	ADC $7C00,X		  ; 7D 00 7C | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $AD00,X		  ; 7E 00 AD | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $C700,X		  ; 7E 00 C7 | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $EA00,X		  ; 7E 00 EA | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $3600,X		  ; 7E 00 36 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0EF
; Address: $CAC0B4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0EF:
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $AD00,X		  ; 7E 00 AD | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F0
; Address: $CAC0BD
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F0:
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $3F00,X		  ; 7E 00 3F | Rotate right (absolute,X)
	JMP ($10ED)		  ; 6C ED 10 | Jump to address (absolute indirect)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $D600,X		  ; 7E 00 D6 | Rotate right (absolute,X)
	JMP ($10ED)		  ; 6C ED 10 | Jump to address (absolute indirect)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $8100,X		  ; 7E 00 81 | Rotate right (absolute,X)
	ADC $10ED			; 6D ED 10 | Add with carry (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $5F00,X		  ; 7E 00 5F | Rotate right (absolute,X)
	ROR $10ED			; 6E ED 10 | Rotate right (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $6000,X		  ; 7E 00 60 | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $7300,X		  ; 7E 00 73 | Rotate right (absolute,X)
	BVS $ED			  ; 70 ED | Branch if overflow set
	BPL $09			  ; 10 09 | Branch if positive
	ROR $9200,X		  ; 7E 00 92 | Rotate right (absolute,X)
	ADC ($ED),Y		  ; 71 ED | Add with carry ((zero page),Y)
	BPL $09			  ; 10 09 | Branch if positive
	ROR $B100,X		  ; 7E 00 B1 | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $B900,X		  ; 7E 00 B9 | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $8B00,X		  ; 7E 00 8B | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $2500,X		  ; 7E 00 25 | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $8C00,X		  ; 7E 00 8C | Rotate right (absolute,X)
	SBC $0910			; ED 10 09 | Subtract with carry (absolute)
	ROR $CE00,X		  ; 7E 00 CE | Rotate right (absolute,X)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F1
; Address: $CAC139
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F1:
	SBC $75			  ; E5 75 | Subtract with carry (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	INC $ED75			; EE 75 ED | Increment (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	BIT $76			  ; 24 76 | Test bits in accumulator (zero page)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	AND $ED76			; 2D 76 ED | Logical AND with accumulator (absolute)
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	BMI $0A			  ; 30 0A | Branch if negative
	CMP ($34,X)		  ; C1 34 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($5C,X)		  ; C1 5C | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($64,X)		  ; C1 64 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($68,X)		  ; C1 68 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($8A,X)		  ; C1 8A | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($8E,X)		  ; C1 8E | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($B4,X)		  ; C1 B4 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($B8,X)		  ; C1 B8 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($BC,X)		  ; C1 BC | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($D9,X)		  ; C1 D9 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($DD,X)		  ; C1 DD | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($0E,X)		  ; C1 0E | Compare accumulator ((zero page,X))
	CMP ($33,X)		  ; C1 33 | Compare accumulator ((zero page,X))
	CMP ($37,X)		  ; C1 37 | Compare accumulator ((zero page,X))
	CMP ($3B,X)		  ; C1 3B | Compare accumulator ((zero page,X))
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	CMP ($A3,X)		  ; C1 A3 | Compare accumulator ((zero page,X))
	CMP ($E6,X)		  ; C1 E6 | Compare accumulator ((zero page,X))
	CMP ($1D,X)		  ; C1 1D | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F2
; Address: $CAC1D4
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F2:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	CPX $ED9B			; EC 9B ED | Compare X register (absolute)
	SBC $0202			; ED 02 02 | Subtract with carry (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SBC $4040			; ED 40 40 | Subtract with carry (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC $0101			; ED 01 01 | Subtract with carry (absolute)
	LDY $ED			  ; A4 ED | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDY $ED			  ; A4 ED | Load from zero page into Y register
	BPL $10			  ; 10 10 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA ($A4,X)		  ; 81 A4 | Update graphics data
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	BNE $1B			  ; D0 1B | Branch if not equal
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $C0			  ; 05 C0 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA $C8			  ; 05 C8 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$DC			 ; 09 DC | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $EE56			; 0D 56 EE | Logical OR with accumulator (absolute)
	AND $EE56,X		  ; 3D 56 EE | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $57CB			; EE CB 57 | Increment (absolute)
	INC $0001			; EE 01 00 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $3BEE,Y		  ; 59 EE 3B | Exclusive OR with accumulator (absolute,Y)
	JMP $0001EE		  ; 5C EE 01 00 | Jump to address long
	DEY				  ; 88 | Decrement Y register
	BRA $63			  ; 80 63 | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F3
; Address: $CAC2DF
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F3:
	ADC $93EE			; 6D EE 93 | Add with carry (absolute)
	ADC $01EE			; 6D EE 01 | Add with carry (absolute)
	DEY				  ; 88 | Decrement Y register
	ROR $EBEE			; 6E EE EB | Rotate right (absolute)
	ROR $01EE			; 6E EE 01 | Rotate right (absolute)
	DEY				  ; 88 | Decrement Y register
	INC $70DF			; EE DF 70 | Increment (absolute)
	INC $0001			; EE 01 00 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	AND ($77,X)		  ; 21 77 | Logical AND with accumulator ((zero page,X))
	INC $7F79			; EE 79 7F | Increment (absolute)
	INC $0001			; EE 01 00 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	BRA $D1			  ; 80 D1 | Branch always
	STY $E9EE			; 8C EE E9 | Store Y register to absolute address
	STY $01EE			; 8C EE 01 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	LDA $EE8D,Y		  ; B9 8D EE | Read graphics status
	CMP $EE95,Y		  ; D9 95 EE | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STZ $4FEE,X		  ; 9E EE 4F | Store zero to absolute,X
	STZ $01EE,X		  ; 9E EE 01 | Store zero to absolute,X
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	ASL $A1			  ; 06 A1 | Arithmetic shift left (zero page)
	LDA ($EE,X)		  ; A1 EE | Read graphics status
	LDA ($EE,X)		  ; A1 EE | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $E9			  ; 80 E9 | Branch always
	INC $A3F1			; EE F1 A3 | Increment (absolute)
	INC $0001			; EE 01 00 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $EE			  ; A4 EE | Load from zero page into Y register
	INC $1600			; EE 00 16 | Increment (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	INC $BD95			; EE 95 BD | Increment (absolute)
	INC $2300			; EE 00 23 | Increment (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $EE			  ; C6 EE | Decrement (zero page)
	DEC $EE			  ; C6 EE | Decrement (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $EE			  ; D0 EE | Branch if not equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F4
; Address: $CAC389
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F4:
	LDA $EED1,X		  ; BD D1 EE | Read graphics status
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR #$DB			 ; 49 DB | Exclusive OR with accumulator (immediate)
	INC $DC09			; EE 09 DC | Increment (absolute)
	INC $3400			; EE 00 34 | Increment (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $CBEE			; ED EE CB | Subtract with carry (absolute)
	INC $2200			; EE 00 22 | Increment (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $6400			; 4E 00 64 | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $00EF,X		  ; 3D EF 00 | Logical AND with accumulator (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC #$5F			 ; E9 5F | Subtract with carry (immediate)
	STA ($61),Y		  ; 91 61 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F5
; Address: $CAC3E1
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F5:
	ROL				  ; 2A | Rotate left (accumulator)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($79),Y		  ; B1 79 | Read graphics status
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $F3EF,X		  ; 9E EF F3 | Store zero to absolute,X
	LDY #$EF			 ; A0 EF | Load immediate value into Y register
	INC				  ; 1A | Increment accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	BCS $EF			  ; B0 EF | Branch if carry set
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($EF),Y		  ; F1 EF | Subtract with carry ((zero page),Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 0E F0 7F | Read graphics status
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F6
; Address: $CAC439
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F6:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7FF0			; 2D F0 7F | Logical AND with accumulator (absolute)
	BMI $F0			  ; 30 F0 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $59			  ; E5 59 | Subtract with carry (zero page)
	BEQ $FD			  ; F0 FD | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($F0),Y		  ; 71 F0 | Add with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BEQ $F3			  ; F0 F3 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $A3F0			; 8E F0 A3 | Store X register to absolute address
	BCC $F0			  ; 90 F0 | Branch if carry clear
	ORA $6400,X		  ; 1D 00 64 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	BEQ $00			  ; F0 00 | Branch if equal
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF F0 BF C1 | Read graphics status
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $6400,X		  ; 1E 00 64 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F0D5			; CD D5 F0 | Compare accumulator (absolute)
	EOR $F0D6,Y		  ; 59 D6 F0 | Exclusive OR with accumulator (absolute,Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $F0E7,X		  ; 3D E7 F0 | Logical AND with accumulator (absolute,X)
	EOR ($E8),Y		  ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $F0F6			; 2D F6 F0 | Logical AND with accumulator (absolute)
	CMP $F0F7			; CD F7 F0 | Compare accumulator (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($0D),Y		  ; 71 0D | Add with carry ((zero page),Y)
	SBC ($C1),Y		  ; F1 C1 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F7
; Address: $CAC4CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F7:
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($2F),Y		  ; F1 2F | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F8
; Address: $CAC4DA
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F8:
	JSR $00F1			; 20 F1 00 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $93F13E		  ; 8F 3E F1 93 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($6A),Y		  ; 71 6A | Add with carry ((zero page),Y)
	SBC ($3D),Y		  ; F1 3D | Subtract with carry ((zero page),Y)
	JMP ($00F1)		  ; 6C F1 00 | Jump to address (absolute indirect)
	ASL $6400,X		  ; 1E 00 64 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $F1			  ; 80 F1 | Branch always
	STA ($F1,X)		  ; 81 F1 | Update graphics data
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($75),Y		  ; F1 75 | Subtract with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F1AF			; 8D AF F1 | Update graphics data
	LDA ($B0),Y		  ; B1 B0 | Read graphics status
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF F1 A7 C0 | Read graphics status
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($17),Y		  ; F1 17 | Subtract with carry ((zero page),Y)
	BNE $F1			  ; D0 F1 | Branch if not equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $F1D8			; 2D D8 F1 | Logical AND with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F1EC			; 6D EC F1 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0F9
; Address: $CAC557
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0F9:
	ADC ($ED),Y		  ; 71 ED | Add with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SBC $F21B			; ED 1B F2 | Subtract with carry (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F23A,X		  ; 1D 3A F2 | Logical OR with accumulator (absolute,X)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $53F2,X		  ; 5D F2 53 | Exclusive OR with accumulator (absolute,X)
	LSR $00F2,X		  ; 5E F2 00 | Logical shift right (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F2A5,Y		  ; 99 A5 F2 | Update graphics data
	SBC $F2A5,X		  ; FD A5 F2 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F2AA			; CD AA F2 | Compare accumulator (absolute)
	BIT #$AC			 ; 89 AC | Test bits in accumulator (immediate)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $F2			  ; C6 F2 | Decrement (zero page)
	CMP #$F2			 ; C9 F2 | Compare accumulator (immediate)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F316,Y		  ; F9 16 F3 | Subtract with carry (absolute,Y)
	EOR $F318			; 4D 18 F3 | Exclusive OR with accumulator (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $50			  ; C5 50 | Compare accumulator (zero page)
	ORA $F354,X		  ; 1D 54 F3 | Logical OR with accumulator (absolute,X)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FA
; Address: $CAC5FC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FA:
	STA $58			  ; 85 58 | Update graphics data
	ADC $F35A			; 6D 5A F3 | Add with carry (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F3A2			; ED A2 F3 | Subtract with carry (absolute)
	BIT #$A3			 ; 89 A3 | Test bits in accumulator (immediate)
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($A7),Y		  ; F1 A7 | Subtract with carry ((zero page),Y)
	LDA #$F3			 ; A9 F3 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $F3CA			; AD CA F3 | Read graphics status
	DEX				  ; CA | Decrement X register
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $03F3			; CC F3 03 | Compare Y register (absolute)
	CMP $00F3			; CD F3 00 | Compare accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FB
; Address: $CAC659
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FB:
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $1C			  ; 45 1C | Exclusive OR with accumulator (zero page)
	PEA #$1CCD		   ; F4 CD 1C | Push effective address to stack
	PEA #$6000		   ; F4 00 60 | Push effective address to stack
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$3521		   ; F4 21 35 | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT #$3A			 ; 89 3A | Test bits in accumulator (immediate)
	PEA #$3ACD		   ; F4 CD 3A | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($3C,X)		  ; 41 3C | Exclusive OR with accumulator ((zero page,X))
	PEA #$3E1D		   ; F4 1D 3E | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FC
; Address: $CAC6A1
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$F4			 ; 42 F4 | Reserved instruction
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($46,X)		  ; A1 46 | Read graphics status
	PEA #$4761		   ; F4 61 47 | Push effective address to stack
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($F4),Y		  ; 51 F4 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($F4),Y		  ; 51 F4 | Exclusive OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$570B		   ; F4 0B 57 | Push effective address to stack
	PEA #$1F02		   ; F4 02 1F | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($5C,X)		  ; 01 5C | Logical OR with accumulator ((zero page,X))
	PEA #$5C15		   ; F4 15 5C | Push effective address to stack
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($5C),Y		  ; 91 5C | Update graphics data
	PEA #$5CA5		   ; F4 A5 5C | Push effective address to stack
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($5D,X)		  ; 21 5D | Logical AND with accumulator ((zero page,X))
	PEA #$5D35		   ; F4 35 5D | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $8FF4,X		  ; 5D F4 8F | Exclusive OR with accumulator (absolute,X)
	EOR $02F4,X		  ; 5D F4 02 | Exclusive OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $E9F4,X		  ; 5D F4 E9 | Exclusive OR with accumulator (absolute,X)
	EOR $02F4,X		  ; 5D F4 02 | Exclusive OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $43F4,X		  ; 5E F4 43 | Logical shift right (absolute,X)
	LSR $02F4,X		  ; 5E F4 02 | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT #$5E			 ; 89 5E | Test bits in accumulator (immediate)
	PEA #$5EA1		   ; F4 A1 5E | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FD
; Address: $CAC73F
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FD:
	LSR $17F4,X		  ; 5E F4 17 | Logical shift right (absolute,X)
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$5FAD		   ; F4 AD 5F | Push effective address to stack
	PEA #$0402		   ; F4 02 04 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($F4,X)		  ; 61 F4 | Add with carry ((zero page,X))
	CMP $F461			; CD 61 F4 | Compare accumulator (absolute)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$63DD		   ; F4 DD 63 | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F4			  ; 65 F4 | Add with carry (zero page)
	ADC $F4			  ; 65 F4 | Add with carry (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F467,X		  ; DD 67 F4 | Compare accumulator (absolute,X)
	ORA $F468,Y		  ; 19 68 F4 | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $6D			  ; 45 6D | Exclusive OR with accumulator (zero page)
	PEA #$6D81		   ; F4 81 6D | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($6F),Y		  ; F1 6F | Subtract with carry ((zero page),Y)
	PEA #$7159		   ; F4 59 71 | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$735B		   ; F4 5B 73 | Push effective address to stack
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $7A			  ; E5 7A | Subtract with carry (zero page)
	PEA #$7B79		   ; F4 79 7B | Push effective address to stack
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F47E,Y		  ; D9 7E F4 | Compare accumulator (absolute,Y)
	AND $7F			  ; 25 7F | Logical AND with accumulator (zero page)
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $82			  ; 85 82 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FE
; Address: $CAC7DA
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FE:
	PEA #$8315		   ; F4 15 83 | Push effective address to stack
	PEA #$0502		   ; F4 02 05 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $85			  ; 85 85 | Update graphics data
	PEA #$85F9		   ; F4 F9 85 | Push effective address to stack
	PEA #$0502		   ; F4 02 05 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR #$88			 ; 49 88 | Exclusive OR with accumulator (immediate)
	PEA #$8879		   ; F4 79 88 | Push effective address to stack
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $57F4			; 8C F4 57 | Store Y register to absolute address
	STY $02F4			; 8C F4 02 | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$9375		   ; F4 75 93 | Push effective address to stack
	PEA #$0702		   ; F4 02 07 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$9587		   ; F4 87 95 | Push effective address to stack
	PEA #$0702		   ; F4 02 07 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F497,Y		  ; 79 97 F4 | Add with carry (absolute,Y)
	CMP ($97,X)		  ; C1 97 | Compare accumulator ((zero page,X))
	PEA #$0802		   ; F4 02 08 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $AFF49A		  ; 8F 9A F4 AF | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	PEA #$0602		   ; F4 02 06 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $3BF4			; 9C F4 3B | Store zero to absolute
	STZ $02F4			; 9C F4 02 | Store zero to absolute
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F7F4,X		  ; 9D F4 F7 | Update graphics data
	STA $02F4,X		  ; 9D F4 02 | Update graphics data
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F4A4,X		  ; FD A4 F4 | Subtract with carry (absolute,X)
	LDA $A5			  ; A5 A5 | Read graphics status
	PEA #$1A02		   ; F4 02 1A | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_0FF
; Address: $CAC873
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_0FF:
	PLB				  ; AB | Pull data bank register from stack
	PEA #$AC07		   ; F4 07 AC | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $2BF4			; AD F4 2B | Read graphics status
	LDX $02F4			; AE F4 02 | Load from absolute address into X register
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F4B0			; 0D B0 F4 | Logical OR with accumulator (absolute)
	EOR #$B0			 ; 49 B0 | Exclusive OR with accumulator (immediate)
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $B2			  ; 25 B2 | Logical AND with accumulator (zero page)
	PEA #$B2B9		   ; F4 B9 B2 | Push effective address to stack
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F4BA,X		  ; 9D BA F4 | Update graphics data
	ORA ($BB),Y		  ; 11 BB | Logical OR with accumulator ((zero page),Y)
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $F4C0,X		  ; 5D C0 F4 | Exclusive OR with accumulator (absolute,X)
	SBC ($C0),Y		  ; F1 C0 | Subtract with carry ((zero page),Y)
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $C3			  ; 25 C3 | Logical AND with accumulator (zero page)
	PEA #$C395		   ; F4 95 C3 | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	PEA #$C651		   ; F4 51 C6 | Push effective address to stack
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$C803		   ; F4 03 C8 | Push effective address to stack
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F4C8			; 8D C8 F4 | Update graphics data
	LDA ($C8),Y		  ; B1 C8 | Read graphics status
	PEA #$1202		   ; F4 02 12 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$F4			 ; C9 F4 | Compare accumulator (immediate)
	CMP #$F4			 ; C9 F4 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_100
; Address: $CAC907
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_100:
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$CB3B		   ; F4 3B CB | Push effective address to stack
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $9BF4			; CC F4 9B | Compare Y register (absolute)
	CPY $02F4			; CC F4 02 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F4CE,Y		  ; 99 CE F4 | Update graphics data
	CMP #$CE			 ; C9 CE | Compare accumulator (immediate)
	PEA #$1802		   ; F4 02 18 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $F4			  ; D0 F4 | Branch if not equal
	ORA $D1			  ; 05 D1 | Logical OR with accumulator (zero page)
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($D2),Y		  ; D1 D2 | Compare accumulator ((zero page),Y)
	PEA #$D301		   ; F4 01 D3 | Push effective address to stack
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$D54D		   ; F4 4D D5 | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $F4D6,X		  ; 5D D6 F4 | Exclusive OR with accumulator (absolute,X)
	LDA #$D6			 ; A9 D6 | Read graphics status
	PEA #$1402		   ; F4 02 14 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	PEA #$DA9F		   ; F4 9F DA | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	PEA #$DC2F		   ; F4 2F DC | Push effective address to stack
	PEA #$1602		   ; F4 02 16 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $73F4,X		  ; DD F4 73 | Compare accumulator (absolute,X)
	CMP $02F4,X		  ; DD F4 02 | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F4DE			; CD DE F4 | Compare accumulator (absolute)
	AND $F4DF,X		  ; 3D DF F4 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_101
; Address: $CAC9A1
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_101:
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$E0			 ; C9 E0 | Game work RAM access
	PEA #$E0F5		   ; F4 F5 E0 | Game work RAM access
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	BRA $4F			  ; 80 4F | Branch always
	SBC ($F4,X)		  ; E1 F4 | Subtract with carry ((zero page,X))
	SBC ($F4,X)		  ; E1 F4 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($F4,X)		  ; E1 F4 | Subtract with carry ((zero page,X))
	ORA $E2			  ; 05 E2 | Logical OR with accumulator (zero page)
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F4			  ; E5 F4 | Subtract with carry (zero page)
	SBC $F4			  ; E5 F4 | Subtract with carry (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))
	SBC $F4			  ; E5 F4 | Subtract with carry (zero page)
	LDA $F4E5,Y		  ; B9 E5 F4 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	INC $F4			  ; E6 F4 | Increment (zero page)
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$E8			 ; A9 E8 | Read graphics status
	PEA #$E8DD		   ; F4 DD E8 | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $F4EA			; 4D EA F4 | Exclusive OR with accumulator (absolute)
	ADC $F4EA,X		  ; 7D EA F4 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	PEA #$EB27		   ; F4 27 EB | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $EC			  ; A5 EC | Read graphics status
	PEA #$ECED		   ; F4 ED EC | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_102
; Address: $CACA2D
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_102:
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $5DF4			; EE F4 5D | Increment (absolute)
	INC $01F4			; EE F4 01 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $7BF4			; EE F4 7B | Increment (absolute)
	INC $01F4			; EE F4 01 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($EE),Y		  ; 91 EE | Update graphics data
	PEA #$EEB5		   ; F4 B5 EE | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$F927		   ; F4 27 F9 | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $7D			  ; 80 7D | Branch always
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	ADC $0F			  ; 65 0F | Add with carry (zero page)
	ASL $E800,X		  ; 1E 00 E8 | Arithmetic shift left (absolute,X)
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_104
; Address: $CACA7C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_104:
	JSL $0001F5		  ; 22 F5 01 00 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $09			  ; 80 09 | Branch always
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $F5			  ; 30 F5 | Branch if negative
	BMI $F5			  ; 30 F5 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $F530,X		  ; 5D 30 F5 | Exclusive OR with accumulator (absolute,X)
	BMI $F5			  ; 30 F5 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $95			  ; 80 95 | Branch always
	LDA ($35,X)		  ; A1 35 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($36),Y		  ; 11 36 | Logical OR with accumulator ((zero page),Y)
	ORA $F536,Y		  ; 19 36 F5 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_105
; Address: $CACAC7
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_105:
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $37			  ; 05 37 | Logical OR with accumulator (zero page)
	ADC #$37			 ; 69 37 | Add with carry (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F539,X		  ; 1D 39 F5 | Logical OR with accumulator (absolute,X)
	EOR $F539,Y		  ; 59 39 F5 | Exclusive OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	LDA $3A			  ; A5 3A | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $97F5,X		  ; 3D F5 97 | Logical AND with accumulator (absolute,X)
	AND $01F5,X		  ; 3D F5 01 | Logical AND with accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $97			  ; 80 97 | Branch always
	EOR ($F5,X)		  ; 41 F5 | Exclusive OR with accumulator ((zero page,X))
	EOR ($F5,X)		  ; 41 F5 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $41			  ; E5 41 | Subtract with carry (zero page)
	SBC $F541			; ED 41 F5 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	WDM #$F5			 ; 42 F5 | Reserved instruction
	WDM #$F5			 ; 42 F5 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($42),Y		  ; 91 42 | Hardware register operation
	LDA $F543			; AD 43 F5 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_106
; Address: $CACB5E
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_106:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR #$F5			 ; 49 F5 | Exclusive OR with accumulator (immediate)
	CMP $49			  ; C5 49 | Compare accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($4C),Y		  ; 71 4C | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $47F5			; 4D F5 47 | Exclusive OR with accumulator (absolute)
	LSR $01F5			; 4E F5 01 | Logical shift right (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($50),Y		  ; B1 50 | Read graphics status
	SBC #$50			 ; E9 50 | Subtract with carry (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $F5			  ; 50 F5 | Branch if overflow clear
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F552,Y		  ; 19 52 F5 | Logical OR with accumulator (absolute,Y)
	ADC $F552,X		  ; 7D 52 F5 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $54			  ; E5 54 | Subtract with carry (zero page)
	AND ($55,X)		  ; 21 55 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($56),Y		  ; 51 56 | Exclusive OR with accumulator ((zero page),Y)
	ADC $F556,Y		  ; 79 56 F5 | Add with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($59),Y		  ; 51 59 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_107
; Address: $CACBF6
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_107:
	EOR $01F5,Y		  ; 59 F5 01 | Exclusive OR with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F55B,X		  ; 9D 5B F5 | Update graphics data
	ORA ($5C,X)		  ; 01 5C | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $5D4BF5		  ; 5C F5 4B 5D | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $F55E			; 4D 5E F5 | Exclusive OR with accumulator (absolute)
	LDA ($5E),Y		  ; B1 5E | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($60,X)		  ; E1 60 | Subtract with carry ((zero page,X))
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $63			  ; C5 63 | Compare accumulator (zero page)
	AND ($64),Y		  ; 31 64 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F5			  ; 65 F5 | Add with carry (zero page)
	ADC $F5			  ; 65 F5 | Add with carry (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $66			  ; C5 66 | Compare accumulator (zero page)
	AND #$67			 ; 29 67 | Logical AND with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_108
; Address: $CACC95
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_108:
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC #$F5			 ; 69 F5 | Add with carry (immediate)
	CMP $F569,Y		  ; D9 69 F5 | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_109
; Address: $CACCAE
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_109:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $6C			  ; 25 6C | Logical AND with accumulator (zero page)
	BIT #$6C			 ; 89 6C | Test bits in accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $C7F5			; 6D F5 C7 | Add with carry (absolute)
	ADC $01F5			; 6D F5 01 | Add with carry (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$6E			 ; C9 6E | Compare accumulator (immediate)
	AND $F56F			; 2D 6F F5 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $F5			  ; 70 F5 | Branch if overflow set
	STA $01F570		  ; 8F 70 F5 01 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F571,Y		  ; 79 71 F5 | Add with carry (absolute,Y)
	CMP $F571,Y		  ; D9 71 F5 | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F574			; 0D 74 F5 | Logical OR with accumulator (absolute)
	ADC $F574			; 6D 74 F5 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($76,X)		  ; A1 76 | Read graphics status
	LDA $F576			; AD 76 F5 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10A
; Address: $CACD31
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F576			; ED 76 F5 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($77,X)		  ; A1 77 | Read graphics status
	LDA #$77			 ; A9 77 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$79			 ; 09 79 | Logical OR with accumulator (immediate)
	ORA ($79),Y		  ; 11 79 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	ADC $E3F5,Y		  ; 79 F5 E3 | Add with carry (absolute,Y)
	ADC $01F5,X		  ; 7D F5 01 | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT #$88			 ; 89 88 | Test bits in accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $01F5			; 9C F5 01 | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$F5			 ; A0 F5 | Load immediate value into Y register
	LDA ($F5,X)		  ; A1 F5 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $F5A7			; 6D A7 F5 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $F5A7,Y		  ; D9 A7 F5 | Compare accumulator (absolute,Y)
	ORA #$A8			 ; 09 A8 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10B
; Address: $CACDD7
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10B:
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($A8,X)		  ; E1 A8 | Subtract with carry ((zero page,X))
	SBC #$A8			 ; E9 A8 | Subtract with carry (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$F5			 ; A9 F5 | Read graphics status
	LDA #$F5			 ; A9 F5 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$F5			 ; A9 F5 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F AC F5 B7 | Update graphics data
	LDY $01F5			; AC F5 01 | Load from absolute address into Y register
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F5AD,Y		  ; F9 AD F5 | Subtract with carry (absolute,Y)
	ORA $F5AE			; 0D AE F5 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $AF8FF5		  ; AF F5 8F AF | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F5B1,X		  ; 9D B1 F5 | Update graphics data
	SBC $F5B1			; ED B1 F5 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F B3 F5 F7 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $F5B4,X		  ; 3D B4 F5 | Logical AND with accumulator (absolute,X)
	ADC $F5B4			; 6D B4 F5 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	ORA ($B9,X)		  ; 01 B9 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10C
; Address: $CACE75
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10C:
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	LDA $D1F5,Y		  ; B9 F5 D1 | Read graphics status
	LDA $01F5,Y		  ; B9 F5 01 | Read graphics status
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $4A93			; EE 93 4A | Increment (absolute)
	INC $AF02			; EE 02 AF | Increment (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $4AB8			; EE B8 4A | Increment (absolute)
	INC $DC03			; EE 03 DC | Increment (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $4AE5			; EE E5 4A | Increment (absolute)
	INC $690F			; EE 0F 69 | Increment (absolute)
	INC $4B72			; EE 72 4B | Increment (absolute)
	INC $9E04			; EE 04 9E | Increment (absolute)
	INC $4BAF			; EE AF 4B | Increment (absolute)
	INC $0704			; EE 04 07 | Increment (absolute)
	JMP $18EE			; 4C EE 18 | Jump to address
	JMP $0EEE			; 4C EE 0E | Jump to address
	BPL $4D			  ; 10 4D | Branch if positive
	INC $4D21			; EE 21 4D | Increment (absolute)
	INC $7904			; EE 04 79 | Increment (absolute)
	EOR $8AEE			; 4D EE 8A | Exclusive OR with accumulator (absolute)
	EOR $0AEE			; 4D EE 0A | Exclusive OR with accumulator (absolute)
	WDM #$4E			 ; 42 4E | Reserved instruction
	INC $4E4B			; EE 4B 4E | Increment (absolute)
	INC $6702			; EE 02 67 | Increment (absolute)
	LSR $70EE			; 4E EE 70 | Logical shift right (absolute)
	LSR $18EE			; 4E EE 18 | Logical shift right (absolute)
	INC $4F45			; EE 45 4F | Increment (absolute)
	INC $7905			; EE 05 79 | Increment (absolute)
	INC $4F82			; EE 82 4F | Increment (absolute)
	INC $060F			; EE 0F 06 | Increment (absolute)
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BVC $EE			  ; 50 EE | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10D
; Address: $CACEEE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10D:
	BVC $EE			  ; 50 EE | Branch if overflow clear
	ADC #$50			 ; 69 50 | Add with carry (immediate)
	INC $9504			; EE 04 95 | Increment (absolute)
	BVC $EE			  ; 50 EE | Branch if overflow clear
	STZ $EE50,X		  ; 9E 50 EE | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BVC $EE			  ; 50 EE | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10E
; Address: $CACF06
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10E:
	BVC $EE			  ; 50 EE | Branch if overflow clear
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	EOR ($EE),Y		  ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
	AND $EE51,X		  ; 3D 51 EE | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BIT #$51			 ; 89 51 | Test bits in accumulator (immediate)
	INC $5192			; EE 92 51 | Increment (absolute)
	INC $AE02			; EE 02 AE | Increment (absolute)
	EOR ($EE),Y		  ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
	EOR ($EE),Y		  ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
	EOR ($EE),Y		  ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
	INC $EE51			; EE 51 EE | Increment (absolute)
	AND $52			  ; 25 52 | Logical AND with accumulator (zero page)
	INC $5236			; EE 36 52 | Increment (absolute)
	INC $8E04			; EE 04 8E | Increment (absolute)
	INC $5297			; EE 97 52 | Increment (absolute)
	INC $C304			; EE 04 C3 | Increment (absolute)
	INC $52D4			; EE D4 52 | Increment (absolute)
	INC $AC1C			; EE 1C AC | Increment (absolute)
	INC $54B5			; EE B5 54 | Increment (absolute)
	INC $110A			; EE 0A 11 | Increment (absolute)
	INC $5516			; EE 16 55 | Increment (absolute)
	INC $3005			; EE 05 30 | Increment (absolute)
	INC $5539			; EE 39 55 | Increment (absolute)
	INC $950A			; EE 0A 95 | Increment (absolute)
	INC $55A4			; EE A4 55 | Increment (absolute)
	INC $0006			; EE 06 00 | Increment (absolute)
	JMP ($EE48)		  ; 6C 48 EE | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	INC $0110			; EE 10 01 | Increment (absolute)
	EOR #$EE			 ; 49 EE | Exclusive OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR #$EE			 ; 49 EE | Exclusive OR with accumulator (immediate)
	ROL $49			  ; 26 49 | Rotate left (zero page)
	INC $4933			; EE 33 49 | Increment (absolute)
	INC $D50C			; EE 0C D5 | Increment (absolute)
	EOR #$EE			 ; 49 EE | Exclusive OR with accumulator (immediate)
	INC $EE49			; EE 49 EE | Increment (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	CPX $0F			  ; E4 0F | Compare X register (zero page)
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	SBC $17			  ; E5 17 | Subtract with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	INC $0F2E			; EE 2E 0F | Increment (absolute)
	ORA ($EB),Y		  ; 11 EB | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0EF6			; 0E F6 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_10F
; Address: $CACFAA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_10F:
	ASL $1CF2			; 0E F2 1C | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $19E8,Y		  ; 19 E8 19 | Logical OR with accumulator (absolute,Y)
	AND $EB			  ; 25 EB | Logical AND with accumulator (zero page)
	AND $0012			; 2D 12 00 | Logical AND with accumulator (absolute)
	DEC $F417,X		  ; DE 17 F4 | Decrement (absolute,X)
	LDA $132F,X		  ; BD 2F 13 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_110
; Address: $CACFC3
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_110:
	JSL $0002F3		  ; 22 F3 02 00 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ORA $19DF,Y		  ; 19 DF 19 | Logical OR with accumulator (absolute,Y)
	SBC $D919,Y		  ; F9 19 D9 | Subtract with carry (absolute,Y)
	DEC $F412,X		  ; DE 12 F4 | Decrement (absolute,X)
	AND $16			  ; 25 16 | Logical AND with accumulator (zero page)
	ORA ($E7),Y		  ; 11 E7 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($CD,X)		  ; 01 CD | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	NOP				  ; EA | No operation
	BMI $18			  ; 30 18 | Branch if negative
	INC				  ; 1A | Increment accumulator
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	SBC $F803,Y		  ; F9 03 F8 | Subtract with carry (absolute,Y)
	ROL $0019			; 2E 19 00 | Rotate left (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F5			  ; 10 F5 | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_111
; Address: $CACFFD
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_111:
	JSL $1B001A		  ; 22 1A 00 1B | Jump to subroutine long
	CPX $1B30			; EC 30 1B | Compare X register (absolute)
	ORA $1DE4,X		  ; 1D E4 1D | Logical OR with accumulator (absolute,X)
	ORA $3AC5,X		  ; 1D C5 3A | Logical OR with accumulator (absolute,X)
	CPX $13			  ; E4 13 | Compare X register (zero page)
	PEA #$E713		   ; F4 13 E7 | Push effective address to stack
	BIT $1D			  ; 24 1D | Test bits in accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CPX $D217			; EC 17 D2 | Compare X register (absolute)
	ROL $001E			; 2E 1E 00 | Rotate left (absolute)
	ASL $1EF1,X		  ; 1E F1 1E | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $EB			  ; 10 EB | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $ED			  ; 10 ED | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_112
; Address: $CAD033
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_112:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BEQ $0C			  ; F0 0C | Branch if equal
	CLC				  ; 18 | Clear carry flag
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BPL $D8			  ; 10 D8 | Branch if positive
	BPL $E9			  ; 10 E9 | Branch if positive
	BPL $D9			  ; 10 D9 | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_114
; Address: $CAD049
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_114:
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	CMP ($2F),Y		  ; D1 2F | Compare accumulator ((zero page),Y)
	ORA #$DE			 ; 09 DE | Logical OR with accumulator (immediate)
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $E3			  ; 25 E3 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_115
; Address: $CAD069
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_115:
	JSL $100026		  ; 22 26 00 10 | Jump to subroutine long
	SBC $10			  ; E5 10 | Subtract with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($28,X)		  ; E1 28 | Subtract with carry ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($E7),Y		  ; 11 E7 | Logical OR with accumulator ((zero page),Y)
	BNE $2F			  ; D0 2F | Branch if not equal
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_116
; Address: $CAD087
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_116:
	JSR $22E5			; 20 E5 22 | Jump to subroutine
	SBC $F029,Y		  ; F9 29 F0 | Subtract with carry (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CMP ($30),Y		  ; D1 30 | Compare accumulator ((zero page),Y)
	BPL $DE			  ; 10 DE | Branch if positive
	ASL $FFF7			; 0E F7 FF | Arithmetic shift left (absolute)
	BIT $0E00			; 2C 00 0E | Test bits in accumulator (absolute)
	CMP $F010,X		  ; DD 10 F0 | Compare accumulator (absolute,X)
	BNE $28			  ; D0 28 | Branch if not equal
	AND $0F00			; 2D 00 0F | Logical AND with accumulator (absolute)
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	ASL $002E,X		  ; 1E 2E 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_117
; Address: $CAD0B4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_117:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($DB),Y		  ; 11 DB | Logical OR with accumulator ((zero page),Y)
	PEA #$F118		   ; F4 18 F1 | Push effective address to stack
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	DEC $1D			  ; C6 1D | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPX $13			  ; E4 13 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $30			  ; E6 30 | Increment (zero page)
	ORA $1BEA,X		  ; 1D EA 1B | Logical OR with accumulator (absolute,X)
	ASL $3CEA,X		  ; 1E EA 3C | Arithmetic shift left (absolute,X)
	CPX #$13			 ; E0 13 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_118
; Address: $CAD0E7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_118:
	PLP				  ; 28 | Pull processor status from stack
	ORA $15E8,Y		  ; 19 E8 15 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_119
; Address: $CAD0F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_119:
	JSR $20E8			; 20 E8 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEC $FB1B,X		  ; DE 1B FB | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_11A
; Address: $CAD105
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_11A:
	JSR $20D1			; 20 D1 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	AND $1C00,Y		  ; 39 00 1C | Logical AND with accumulator (absolute,Y)
	ORA $FFF8,Y		  ; 19 F8 FF | Logical OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	BPL $E2			  ; 10 E2 | Branch if positive
	ORA ($FA),Y		  ; 11 FA | Logical OR with accumulator ((zero page),Y)
	BPL $D2			  ; 10 D2 | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_11B
; Address: $CAD11D
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_11B:
	JSL $1A003B		  ; 22 3B 00 1A | Jump to subroutine long
	ASL $FDF0,X		  ; 1E F0 FD | Arithmetic shift left (absolute,X)
	AND $003C,X		  ; 3D 3C 00 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	AND $1600,X		  ; 3D 00 16 | Logical AND with accumulator (absolute,X)
	DEC $3E28,X		  ; DE 28 3E | Decrement (absolute,X)
	ROL $E1			  ; 26 E1 | Rotate left (zero page)
	AND $F8			  ; 25 F8 | Logical AND with accumulator (zero page)
	AND ($D5,X)		  ; 21 D5 | Logical AND with accumulator ((zero page,X))
	WDM #$3F			 ; 42 3F | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($D3),Y		  ; 11 D3 | Logical OR with accumulator ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SBC $0F			  ; E5 0F | Subtract with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	ORA $2AF3			; 0D F3 2A | Logical OR with accumulator (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT $2CC7			; 2C C7 2C | Test bits in accumulator (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BVC $43			  ; 50 43 | Branch if overflow clear
	BIT $2CC7			; 2C C7 2C | Test bits in accumulator (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BVC $44			  ; 50 44 | Branch if overflow clear
	BIT $2CC7			; 2C C7 2C | Test bits in accumulator (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BVC $45			  ; 50 45 | Branch if overflow clear
	BIT $2CC7			; 2C C7 2C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_11C
; Address: $CAD17D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_11C:
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_11D
; Address: $CAD1AB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_11D:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_121
; Address: $CAD1E3
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_121:
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	STA $FF			  ; 85 FF | Update graphics data
	STA $FF			  ; 85 FF | Update graphics data
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	WDM #$FF			 ; 42 FF | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_122
; Address: $CAD2A3
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_122:
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $FF			  ; 80 FF | Branch always
	STZ $82FF,X		  ; 9E FF 82 | Store zero to absolute,X
	WDM #$FF			 ; 42 FF | Reserved instruction
	INC $82FF,X		  ; FE FF 82 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	ROR $08FF,X		  ; 7E FF 08 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $FF			  ; 70 FF | Branch if overflow set
	STY $FF			  ; 84 FF | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BCC $FF			  ; 90 FF | Branch if carry clear
	BCS $FF			  ; B0 FF | Branch if carry set
	INY				  ; C8 | Increment Y register
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	REP #$FF			 ; C2 FF | Reset processor status bits
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STX $FF			  ; 86 FF | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	DEC				  ; 3A | Decrement accumulator
	DEY				  ; 88 | Decrement Y register
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	INC $10FF,X		  ; FE FF 10 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_123
; Address: $CAD377
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_123:
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	DEC $FF			  ; C6 FF | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_124
; Address: $CAD3D9
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_124:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_127
; Address: $CAD43D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_127:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_128
; Address: $CAD481
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_128:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STY $B0FF			; 8C FF B0 | Store Y register to absolute address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCS $FF			  ; B0 FF | Branch if carry set
	STY $00FF			; 8C FF 00 | Store Y register to absolute address
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	CPX $92FF			; EC FF 92 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_129
; Address: $CAD4DD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_129:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STZ $A0FF			; 9C FF A0 | Store zero to absolute
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_12C
; Address: $CAD51B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_12C:
	JSR $1CFF			; 20 FF 1C | Jump to subroutine
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $FF			  ; 30 FF | Branch if negative
	TAX				  ; AA | Transfer accumulator to X register
	STY $FF			  ; 84 FF | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $FF			  ; 30 FF | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_12D
; Address: $CAD5D3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_12D:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROR $82FF,X		  ; 7E FF 82 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $02FF,X		  ; 7E FF 02 | Rotate right (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	JMP ($6CFF)		  ; 6C FF 6C | Jump to address (absolute indirect)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_12E
; Address: $CAD681
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_12E:
	JSR $54FF			; 20 FF 54 | Jump to subroutine
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	JMP ($68FF)		  ; 6C FF 68 | Jump to address (absolute indirect)
	CPY $7AFF			; CC FF 7A | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_130
; Address: $CAD6A5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_130:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $18FF,X		  ; 7E FF 18 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_132
; Address: $CAD6FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_132:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_134
; Address: $CAD721
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_134:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_135
; Address: $CAD72B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_135:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_139
; Address: $CAD743
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_139:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_13A
; Address: $CAD775
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_13A:
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_13B
; Address: $CAD77D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_13B:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$FF			 ; 42 FF | Reserved instruction
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $08FF			; 0E FF 08 | Arithmetic shift left (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	JMP ($44FF)		  ; 6C FF 44 | Jump to address (absolute indirect)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_13D
; Address: $CAD991
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_13D:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_13E
; Address: $CAD99D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_13E:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $0CFF,X		  ; FE FF 0C | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $FF			  ; 30 FF | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_140
; Address: $CAD9D7
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_140:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROR $82FF,X		  ; 7E FF 82 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $02FF,X		  ; 7E FF 02 | Rotate right (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	WDM #$FF			 ; 42 FF | Reserved instruction
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_141
; Address: $CADAC3
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_141:
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $FF			  ; 80 FF | Branch always
	STZ $82FF,X		  ; 9E FF 82 | Store zero to absolute,X
	WDM #$FF			 ; 42 FF | Reserved instruction
	INC $82FF,X		  ; FE FF 82 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	ROR $08FF,X		  ; 7E FF 08 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BVS $FF			  ; 70 FF | Branch if overflow set
	STY $FF			  ; 84 FF | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BCC $FF			  ; 90 FF | Branch if carry clear
	BCS $FF			  ; B0 FF | Branch if carry set
	INY				  ; C8 | Increment Y register
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	REP #$FF			 ; C2 FF | Reset processor status bits
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STX $FF			  ; 86 FF | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_142
; Address: $CADB89
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_142:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	DEC				  ; 3A | Decrement accumulator
	DEY				  ; 88 | Decrement Y register
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	INC $10FF,X		  ; FE FF 10 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	DEC $FF			  ; C6 FF | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_143
; Address: $CADC29
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_143:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	STA $609F60		  ; 8F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 70 8F 7F | Update graphics data
	BRA $3F			  ; 80 3F | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_145
; Address: $CADC66
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_145:
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 7F 80 60 | Update graphics data
	STA				  ; 9F 60 9F 60 | Update graphics data
	STA				  ; 9F 60 9F 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_146
; Address: $CADC92
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_146:
	STA				  ; 9F 60 9F 6F | Update graphics data
	STA				  ; 9F 68 9F 6E | Update graphics data
	STA				  ; 9F 68 9F 6F | Update graphics data
	STA				  ; 9F 60 9F 00 | Update graphics data
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_147
; Address: $CADD03
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_147:
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	INC $10FF,X		  ; FE FF 10 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	DEC $72FF,X		  ; DE FF 72 | Decrement (absolute,X)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_148
; Address: $CADD2F
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_148:
	JSL $FF00FF		  ; 22 FF 00 FF | Jump to subroutine long
	INC $A8FF,X		  ; FE FF A8 | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	CPY $80FF			; CC FF 80 | Compare Y register (absolute)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROR $82FF,X		  ; 7E FF 82 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_149
; Address: $CADE33
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_149:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $02FF,X		  ; 7E FF 02 | Rotate right (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	INC $40FF,X		  ; FE FF 40 | Increment (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	INC $84FF,X		  ; FE FF 84 | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	ROR $82FF,X		  ; 7E FF 82 | Rotate right (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_14A
; Address: $CADF71
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_14A:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_14B
; Address: $CADF7D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_14B:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $18FF,X		  ; 7E FF 18 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $99FF,X		  ; 7E FF 99 | Rotate right (absolute,X)
	STA $66FF,Y		  ; 99 FF 66 | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_14C
; Address: $CADFBD
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_14C:
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	WDM #$FF			 ; 42 FF | Reserved instruction
	STA $99FF,Y		  ; 99 FF 99 | Update graphics data
	WDM #$FF			 ; 42 FF | Reserved instruction
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROR $82FF,X		  ; 7E FF 82 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $02FF,X		  ; 7E FF 02 | Rotate right (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	BVS $FF			  ; 70 FF | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_158
; Address: $CAE1C3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_158:
	ROR $3CFF,X		  ; 7E FF 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDX $C1D5			; AE D5 C1 | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_15A
; Address: $CAE1F8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_15A:
	LDA $18			  ; A5 18 | Read graphics status
	CMP $1C			  ; C5 1C | Compare accumulator (zero page)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA $1A			  ; A5 1A | Read graphics status
	CMP $1E			  ; C5 1E | Compare accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	INX				  ; E8 | Increment X register
	CPX $C1D7			; EC D7 C1 | Compare X register (absolute)
	BCC $EA			  ; 90 EA | Branch if carry clear
	BEQ $E8			  ; F0 E8 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_15B
; Address: $CAE20E
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_15B:
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_15D
; Address: $CAE213
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_15D:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	STA $18			  ; 85 18 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_15E
; Address: $CAE221
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_15E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	STA $1A			  ; 85 1A | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_15F
; Address: $CAE231
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_15F:
	PHA				  ; 48 | Push accumulator to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	CMP $B0			  ; C5 B0 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $C562			; 6E 62 C5 | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_160
; Address: $CAE242
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_160:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_161
; Address: $CAE245
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_161:
	PHA				  ; 48 | Push accumulator to stack
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BEQ $20			  ; F0 20 | Branch if equal
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	CMP $90			  ; C5 90 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_162
; Address: $CAE253
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_162:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	EOR $6800,Y		  ; 59 00 68 | Exclusive OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_165
; Address: $CAE263
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_165:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_166
; Address: $CAE26B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_166:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_167
; Address: $CAE26E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_167:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BCS $0C			  ; B0 0C | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $C1D9			; AC D9 C1 | Load from absolute address into Y register
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_168
; Address: $CAE282
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_168:
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_16A
; Address: $CAE28F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_16A:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCS $78			  ; B0 78 | Branch if carry set
	EOR $C1DF			; 4D DF C1 | Exclusive OR with accumulator (absolute)
	BNE $73			  ; D0 73 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$FC			 ; A2 FC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_16C
; Address: $CAE2B2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_16C:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCS $55			  ; B0 55 | Branch if carry set
	EOR $C1DF			; 4D DF C1 | Exclusive OR with accumulator (absolute)
	BNE $50			  ; D0 50 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_16E
; Address: $CAE2D5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_16E:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCS $32			  ; B0 32 | Branch if carry set
	EOR $C1DF			; 4D DF C1 | Exclusive OR with accumulator (absolute)
	BNE $2D			  ; D0 2D | Branch if not equal
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_170
; Address: $CAE2F8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_170:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCS $0F			  ; B0 0F | Branch if carry set
	EOR $C1DF			; 4D DF C1 | Exclusive OR with accumulator (absolute)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA #$FC			 ; A9 FC | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_173
; Address: $CAE31D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_173:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $C1D9			; AD D9 C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_174
; Address: $CAE322
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_174:
	JSR $6211			; 20 11 62 | Jump to subroutine
	LDA $18			  ; A5 18 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $1C			  ; 85 1C | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL $68FA,X		  ; 1E FA 68 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_176
; Address: $CAE33A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_176:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $C247			; AD 47 C2 | Read graphics status
	CMP $C1DF			; CD DF C1 | Compare accumulator (absolute)
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA $C287			; AD 87 C2 | Read graphics status
	BEQ $17			  ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_177
; Address: $CAE349
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_177:
	CMP $C1F1			; CD F1 C1 | Compare accumulator (absolute)
	BNE $12			  ; D0 12 | Branch if not equal
	LDX $C207			; AE 07 C2 | Load from absolute address into X register
	LDA				  ; BF 6C 63 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_178
; Address: $CAE360
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_178:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_179
; Address: $CAE364
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_179:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1DF			; 8D DF C1 | Update graphics data
	STZ $C1F9			; 9C F9 C1 | Store zero to absolute
	STZ $C1E3			; 9C E3 C1 | Store zero to absolute
	STZ $C1E5			; 9C E5 C1 | Store zero to absolute
	STZ $C1E7			; 9C E7 C1 | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1E9			; 8D E9 C1 | Update graphics data
	STZ $C1ED			; 9C ED C1 | Store zero to absolute
	STZ $C1F3			; 9C F3 C1 | Store zero to absolute
	STZ $C1F1			; 9C F1 C1 | Store zero to absolute
	STZ $C203			; 9C 03 C2 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17A
; Address: $CAE388
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17A:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17B
; Address: $CAE392
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17B:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17C
; Address: $CAE39C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17C:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17D
; Address: $CAE3A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17D:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17E
; Address: $CAE3B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17E:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_17F
; Address: $CAE3BA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_17F:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	LDA $7EC206		  ; AF 06 C2 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $24			  ; D0 24 | Branch if not equal
	LDX $99C7			; AE C7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_181
; Address: $CAE3DA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_181:
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	STA $C1E1			; 8D E1 C1 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1FD			; 8D FD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_182
; Address: $CAE3E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_182:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	BRA $0A			  ; 80 0A | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_183
; Address: $CAE3F1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_183:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	LDX $99C7			; AE C7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_184
; Address: $CAE3FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_184:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	STA $C1DB			; 8D DB C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_185
; Address: $CAE410
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_185:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	STA $C1DD			; 8D DD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_188
; Address: $CAE42D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_188:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_189
; Address: $CAE43A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_189:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	INC $00C8			; EE C8 00 | Increment (absolute)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $C1F3			; EE F3 C1 | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18A
; Address: $CAE452
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18A:
	JSL $C7556C		  ; 22 6C 55 C7 | Jump to subroutine long
	LDA $C129			; AD 29 C1 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDA $C12B			; AD 2B C1 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18B
; Address: $CAE460
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18B:
	JSL $C561F1		  ; 22 F1 61 C5 | Jump to subroutine long
	BCC $FE			  ; 90 FE | Branch if carry clear
	STA $C1D9			; 8D D9 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18C
; Address: $CAE46A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18C:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18D
; Address: $CAE476
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18D:
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $29			  ; B0 29 | Branch if carry set
	LDA $7EC205		  ; AF 05 C2 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18E
; Address: $CAE487
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18E:
	JSL $C5633A		  ; 22 3A 63 C5 | Jump to subroutine long
	BCS $0A			  ; B0 0A | Branch if carry set
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BEQ $12			  ; F0 12 | Branch if equal
	DEC $C1E5			; CE E5 C1 | Decrement (absolute)
	BRA $0D			  ; 80 0D | Branch always
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	CMP $C1E3			; CD E3 C1 | Compare accumulator (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	INC $C1E5			; EE E5 C1 | Increment (absolute)
	LDA $C1E5			; AD E5 C1 | Read graphics status
	STA $C1E7			; 8D E7 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_18F
; Address: $CAE4AB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_18F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $6E			  ; B0 6E | Branch if carry set
	LDA $7EC205		  ; AF 05 C2 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_190
; Address: $CAE4C8
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_190:
	JSL $C5633A		  ; 22 3A 63 C5 | Jump to subroutine long
	BCS $37			  ; B0 37 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	LDY #$3C			 ; A0 3C | Load immediate value into Y register
	LDA $C207,Y		  ; B9 07 C2 | Read graphics status
	STA $C209,Y		  ; 99 09 C2 | Update graphics data
	LDA $C287,Y		  ; B9 87 C2 | Read graphics status
	STA $C289,Y		  ; 99 89 C2 | Update graphics data
	LDA $C247,Y		  ; B9 47 C2 | Read graphics status
	STA $C249,Y		  ; 99 49 C2 | Update graphics data
	LDA $C2C7,Y		  ; B9 C7 C2 | Read graphics status
	STA $C2C9,Y		  ; 99 C9 C2 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $E4			  ; 10 E4 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	STA $C207			; 8D 07 C2 | Update graphics data
	LDA $C1F1			; AD F1 C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_191
; Address: $CAE4F5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_191:
	STA $C287			; 8D 87 C2 | Update graphics data
	LDA $C1DF			; AD DF C1 | Read graphics status
	STA $C247			; 8D 47 C2 | Update graphics data
	LDA $C1D9			; AD D9 C1 | Read graphics status
	STA $C2C7			; 8D C7 C2 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_192
; Address: $CAE505
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_192:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C209,Y		  ; B9 09 C2 | Read graphics status
	STA $C207,Y		  ; 99 07 C2 | Update graphics data
	LDA $C289,Y		  ; B9 89 C2 | Read graphics status
	STA $C287,Y		  ; 99 87 C2 | Update graphics data
	LDA $C249,Y		  ; B9 49 C2 | Read graphics status
	STA $C247,Y		  ; 99 47 C2 | Update graphics data
	LDA $C2C9,Y		  ; B9 C9 C2 | Read graphics status
	STA $C2C7,Y		  ; 99 C7 C2 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_194
; Address: $CAE52B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_194:
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BEQ $2E			  ; F0 2E | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_195
; Address: $CAE533
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_195:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $24			  ; B0 24 | Branch if carry set
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_196
; Address: $CAE53C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_196:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $1B			  ; B0 1B | Branch if carry set
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_197
; Address: $CAE545
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_197:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $12			  ; B0 12 | Branch if carry set
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_198
; Address: $CAE54E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_198:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $09			  ; B0 09 | Branch if carry set
	LDA $C1DF			; AD DF C1 | Read graphics status
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	STA $C1DF			; 8D DF C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_199
; Address: $CAE55E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_199:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1DF			; 8D DF C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_19A
; Address: $CAE565
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_19A:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_19B
; Address: $CAE56F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_19B:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_19E
; Address: $CAE583
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_19E:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A0
; Address: $CAE596
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A0:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A2
; Address: $CAE5A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A2:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A4
; Address: $CAE5BC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A4:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A6
; Address: $CAE5CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A6:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	STZ $7FFC			; 9C FC 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A7
; Address: $CAE5DD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A7:
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BNE $31			  ; D0 31 | Branch if not equal
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A8
; Address: $CAE5E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A8:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $24			  ; B0 24 | Branch if carry set
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1A9
; Address: $CAE5F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1A9:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $1C			  ; B0 1C | Branch if carry set
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1AA
; Address: $CAE5FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1AA:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $13			  ; B0 13 | Branch if carry set
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1AB
; Address: $CAE604
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1AB:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $0A			  ; B0 0A | Branch if carry set
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1AC
; Address: $CAE60D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1AC:
	JSL $C5626E		  ; 22 6E 62 C5 | Jump to subroutine long
	BCS $01			  ; B0 01 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1AD
; Address: $CAE614
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1AD:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1AF
; Address: $CAE626
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1AF:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B0
; Address: $CAE633
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B0:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	INC $00C8			; EE C8 00 | Increment (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $C1E3			; AD E3 C1 | Read graphics status
	CMP $C1E5			; CD E5 C1 | Compare accumulator (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	BRA $05			  ; 80 05 | Branch always
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BNE $05			  ; D0 05 | Branch if not equal
	LDA $C1F3			; AD F3 C1 | Read graphics status
	BEQ $01			  ; F0 01 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B1
; Address: $CAE65C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B1:
	STZ $C1E3			; 9C E3 C1 | Store zero to absolute
	STZ $C1E5			; 9C E5 C1 | Store zero to absolute
	STZ $C1E7			; 9C E7 C1 | Store zero to absolute
	LDY $C1D9			; AC D9 C1 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B2
; Address: $CAE668
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B2:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $C1F5			; 8D F5 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B3
; Address: $CAE677
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B3:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B5
; Address: $CAE692
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B5:
	DEX				  ; CA | Decrement X register
	INC $00C8			; EE C8 00 | Increment (absolute)
	LDY #$03			 ; A0 03 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B6
; Address: $CAE699
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B6:
	JSL $C0CD63		  ; 22 63 CD C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	LDA $C1F5			; AD F5 C1 | Read graphics status
	STA $BE81			; 8D 81 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B7
; Address: $CAE6B4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B7:
	JSL $C90501		  ; 22 01 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	INC $00C8			; EE C8 00 | Increment (absolute)
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B8
; Address: $CAE6C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B8:
	JSL $C0CD63		  ; 22 63 CD C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1B9
; Address: $CAE6CD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1B9:
	JSL $C565DD		  ; 22 DD 65 C5 | Jump to subroutine long
	LDA $C1E5			; AD E5 C1 | Read graphics status
	BNE $85			  ; D0 85 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1F3			; 8D F3 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1BB
; Address: $CAE6E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1BB:
	JSL $C90501		  ; 22 01 05 C9 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	SBC ($C8),Y		  ; F1 C8 | Subtract with carry ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1BD
; Address: $CAE6F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1BD:
	LDA $7EC206		  ; AF 06 C2 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1C2
; Address: $CAE70B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1C2:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ASL $C2			  ; 06 C2 | Arithmetic shift left (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1C5
; Address: $CAE71D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1C5:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $0C			  ; 10 0C | Branch if positive
	LDA $C1ED			; AD ED C1 | Read graphics status
	BEQ $07			  ; F0 07 | Branch if equal
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCS $02			  ; B0 02 | Branch if carry set
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	STA $C1E7			; 8D E7 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1C7
; Address: $CAE73D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1C7:
	JSR $6771			; 20 71 67 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1E7			; 8D E7 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1C8
; Address: $CAE746
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1C8:
	JSR $675A			; 20 5A 67 | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $C1E7			; AD E7 C1 | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $C1E7			; 8D E7 C1 | Update graphics data
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	BRA $E7			  ; 80 E7 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1CA
; Address: $CAE75D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1CA:
	JSL $C024A7		  ; 22 A7 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	BEQ $D0			  ; F0 D0 | Branch if equal
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	BNE $F0			  ; D0 F0 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1CF
; Address: $CAE784
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1CF:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA #$19			 ; A9 19 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1D1
; Address: $CAE791
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1D1:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA #$10			 ; A9 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1D3
; Address: $CAE79E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1D3:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	LDA $C1E9			; AD E9 C1 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $F7			  ; D0 F7 | Branch if not equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1D4
; Address: $CAE7AD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1D4:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	JMP $206000		  ; 5C 00 60 20 | Jump to address long
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1D5
; Address: $CAE7B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1D5:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1D9
; Address: $CAE7CB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1D9:
	JSL $C56810		  ; 22 10 68 C5 | Jump to subroutine long
	STA $18			  ; 85 18 | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $05			  ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1DA
; Address: $CAE7DB
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1DA:
	JSR $6890			; 20 90 68 | Jump to subroutine
	BRA $18			  ; 80 18 | Branch always
	LDA $C207,X		  ; BD 07 C2 | Read graphics status
	STA $C207,Y		  ; 99 07 C2 | Update graphics data
	LDA $C247,X		  ; BD 47 C2 | Read graphics status
	STA $C247,Y		  ; 99 47 C2 | Update graphics data
	LDA $C2C7,X		  ; BD C7 C2 | Read graphics status
	STA $C2C7,Y		  ; 99 C7 C2 | Update graphics data
	LDA $C287,X		  ; BD 87 C2 | Read graphics status
	STA $C287,Y		  ; 99 87 C2 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $D5			  ; 90 D5 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1DB
; Address: $CAE801
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1DB:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1DD
; Address: $CAE810
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1DD:
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $C207,X		  ; BD 07 C2 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $32			  ; B0 32 | Branch if carry set
	LDA $C2C7,X		  ; BD C7 C2 | Read graphics status
	CMP $C1D9			; CD D9 C1 | Compare accumulator (absolute)
	BNE $2A			  ; D0 2A | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C207,X		  ; BD 07 C2 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $1C			  ; B0 1C | Branch if carry set
	LDA $C247,X		  ; BD 47 C2 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $C2C7,X		  ; BD C7 C2 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	DEC $0D80,X		  ; DE 80 0D | Decrement (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $BF			  ; 90 BF | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1DE
; Address: $CAE85F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1DE:
	STA $C1E3			; 8D E3 C1 | Update graphics data
	STA $C1E5			; 8D E5 C1 | Update graphics data
	STA $C1E7			; 8D E7 C1 | Update graphics data
	STZ $C1F3			; 9C F3 C1 | Store zero to absolute
	LDA $C1F1			; AD F1 C1 | Read graphics status
	INC				  ; 1A | Increment accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	INC				  ; 1A | Increment accumulator
	STA $C1F1			; 8D F1 C1 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1DF			; 8D DF C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E1
; Address: $CAE880
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E1:
	JSR $6890			; 20 90 68 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E2
; Address: $CAE88A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E2:
	JSL $C56565		  ; 22 65 65 C5 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E3
; Address: $CAE890
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E3:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C207,Y		  ; 99 07 C2 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C287,Y		  ; 99 87 C2 | Update graphics data
	STA $C247,Y		  ; 99 47 C2 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C2C7,Y		  ; 99 C7 C2 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E4
; Address: $CAE8A6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E4:
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $D0			  ; 80 D0 | Branch always
	ORA $E5AD			; 0D AD E5 | Logical OR with accumulator (absolute)
	CMP ($F0,X)		  ; C1 F0 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LDA $7FFC			; AD FC 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E7
; Address: $CAE8C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E7:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	STA $C1D5			; 8D D5 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1E8
; Address: $CAE8D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1E8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	STA $C1D7			; 8D D7 C1 | Update graphics data
	LDX $C1D5			; AE D5 C1 | Load from absolute address into X register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1EA
; Address: $CAE8EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1EA:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $C1F5			; 8D F5 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1ED
; Address: $CAE905
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1ED:
	JSR $6953			; 20 53 69 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1EE
; Address: $CAE90A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1EE:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	INC $00C8			; EE C8 00 | Increment (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F0
; Address: $CAE927
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F0:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	INC $01C8			; EE C8 01 | Increment (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F1
; Address: $CAE93F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F1:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	CPX $C1D7			; EC D7 C1 | Compare X register (absolute)
	BCC $9C			  ; 90 9C | Branch if carry clear
	BEQ $9A			  ; F0 9A | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1D9			; 8D D9 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F2
; Address: $CAE953
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F2:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C1F5			; AD F5 C1 | Read graphics status
	CPX #$36			 ; E0 36 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$37			 ; E0 37 | Compare X register (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BNE $19			  ; D0 19 | Branch if not equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F5
; Address: $CAE974
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F5:
	JSL $C1D099		  ; 22 99 D0 C1 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	BCC $05			  ; 90 05 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F6
; Address: $CAE97C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F6:
	LDA #$4D			 ; A9 4D | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F8
; Address: $CAE986
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F8:
	JSR $699A			; 20 9A 69 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1F9
; Address: $CAE98D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1F9:
	JSL $C734B3		  ; 22 B3 34 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1FC
; Address: $CAE99D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1FC:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1FD
; Address: $CAE9AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1FD:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	STA $9680			; 8D 80 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1FE
; Address: $CAE9B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1FE:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_1FF
; Address: $CAE9C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_1FF:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	STA $9682			; 8D 82 96 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_200
; Address: $CAE9C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_200:
	STZ $BE81			; 9C 81 BE | Store zero to absolute
	STZ $BE83			; 9C 83 BE | Store zero to absolute
	LDY $99C7			; AC C7 99 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_201
; Address: $CAE9D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_201:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_202
; Address: $CAE9E2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_202:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	STA $18			  ; 85 18 | Update graphics data
	STZ $1A			  ; 64 1A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_203
; Address: $CAE9EA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_203:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_205
; Address: $CAE9FE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_205:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $0F			  ; 80 0F | Branch always

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_209
; Address: $CAEA26
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_209:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BEQ $01			  ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_20B
; Address: $CAEA3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_20B:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPX #$03			 ; E0 03 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_20C
; Address: $CAEA49
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_20C:
	JSR $6A83			; 20 83 6A | Jump to subroutine
	BCC $19			  ; 90 19 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $19			  ; 80 19 | Branch always
	LDA #$04			 ; A9 04 | Read graphics status
	BRA $14			  ; 80 14 | Branch always
	LDA #$05			 ; A9 05 | Read graphics status
	BRA $0F			  ; 80 0F | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $0A			  ; 80 0A | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	BRA $05			  ; 80 05 | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	STA $C1F9			; 8D F9 C1 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_20D
; Address: $CAEA70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_20D:
	JSL $C90501		  ; 22 01 05 C9 | Jump to subroutine long
	ORA ($F3),Y		  ; 11 F3 | Logical OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_20F
; Address: $CAEA83
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_20F:
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $1A			  ; 85 1A | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	CMP $1A			  ; C5 1A | Compare accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_210
; Address: $CAEA8D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_210:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C201			; 8D 01 C2 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_214
; Address: $CAEAA8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_214:
	JSL $C050FB		  ; 22 FB 50 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_218
; Address: $CAEAC7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_218:
	JSL $C01056		  ; 22 56 10 C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_219
; Address: $CAEAD7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_219:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA $C201			; AD 01 C2 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_21C
; Address: $CAEAEF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_21C:
	JSL $C01014		  ; 22 14 10 C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_21D
; Address: $CAEAFB
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_21D:
	LDA #$17			 ; A9 17 | Read graphics status
	STA $7FC8			; 8D C8 7F | Update graphics data
	STA $7FCC			; 8D CC 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FCA			; 8D CA 7F | Update graphics data
	STA $7FCE			; 8D CE 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LSR $FC			  ; 46 FC | Logical shift right (zero page)
	STA $7FFC48		  ; 8F 48 FC 7F | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7FFC4A		  ; 8F 4A FC 7F | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FFC4C		  ; 8F 4C FC 7F | Update graphics data
	LDX $C1F7			; AE F7 C1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_21E
; Address: $CAEB29
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_21E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_21F
; Address: $CAEB3D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_21F:
	JSL $C0769C		  ; 22 9C 76 C0 | Jump to subroutine long
	BCC $24			  ; 90 24 | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_221
; Address: $CAEB4A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_221:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_222
; Address: $CAEB59
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_222:
	JSL $C030D2		  ; 22 D2 30 C0 | Jump to subroutine long
	STA $C1FF			; 8D FF C1 | Update graphics data
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_224
; Address: $CAEB67
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_224:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	STA $4245			; 8D 45 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_225
; Address: $CAEB79
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_225:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $8D			  ; 30 8D | Branch if negative
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	LDA #$08			 ; A9 08 | Read graphics status
	STA $4243			; 8D 43 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$80			 ; A2 80 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_226
; Address: $CAEB9C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_226:
	JSL $C79C43		  ; 22 43 9C C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$0A			 ; A9 0A | Read graphics status
	STA $4247			; 8D 47 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_228
; Address: $CAEBAF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_228:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_229
; Address: $CAEBBB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_229:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	BRA $EE			  ; 80 EE | Branch always
	LDA $7FE374		  ; AF 74 E3 7F | Read graphics status
	STA $AD6D			; 8D 6D AD | Update graphics data
	LDA $7FE37E		  ; AF 7E E3 7F | Read graphics status
	STA $AD6F			; 8D 6F AD | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_22B
; Address: $CAEBD3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_22B:
	JSR $6BF5			; 20 F5 6B | Jump to subroutine
	BCS $1C			  ; B0 1C | Branch if carry set
	LDA $7F70			; AD 70 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_231
; Address: $CAEBEF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_231:
	JSR $6C8D			; 20 8D 6C | Jump to subroutine
	BRA $DB			  ; 80 DB | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_232
; Address: $CAEBF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_232:
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	BEQ $D0			  ; F0 D0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_233
; Address: $CAEBFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_233:
	JSL $C74361		  ; 22 61 43 C7 | Jump to subroutine long
	LDA $C11F			; AD 1F C1 | Read graphics status
	BCS $0A			  ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_235
; Address: $CAEC0C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_235:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	BRA $ED			  ; 80 ED | Branch always
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_236
; Address: $CAEC14
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_236:
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDX $99C7			; AE C7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_237
; Address: $CAEC1F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_237:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BCS $09			  ; B0 09 | Branch if carry set
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_238
; Address: $CAEC34
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_238:
	JSR $6CB4			; 20 B4 6C | Jump to subroutine
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_239
; Address: $CAEC3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_239:
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	LDX $99C7			; AE C7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_23A
; Address: $CAEC46
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_23A:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BEQ $0B			  ; F0 0B | Branch if equal
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_23B
; Address: $CAEC5D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_23B:
	JSR $6CB4			; 20 B4 6C | Jump to subroutine
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_23E
; Address: $CAEC6F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_23E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BEQ $0B			  ; F0 0B | Branch if equal
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_23F
; Address: $CAEC86
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_23F:
	JSR $6CB4			; 20 B4 6C | Jump to subroutine
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_240
; Address: $CAEC8D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_240:
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDX $99C7			; AE C7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_241
; Address: $CAEC98
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_241:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND $CF00			; 2D 00 CF | Logical AND with accumulator (absolute)
	BCS $09			  ; B0 09 | Branch if carry set
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_242
; Address: $CAECAD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_242:
	JSR $6CB4			; 20 B4 6C | Jump to subroutine
	STZ $7F70			; 9C 70 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_243
; Address: $CAECB4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_243:
	STA $C1FB			; 8D FB C1 | Update graphics data
	LDX #$04			 ; A2 04 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $C1FB			; AD FB C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_245
; Address: $CAECC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_245:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $F0			  ; D0 F0 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_248
; Address: $CAECD3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_248:
	JSL $C45AB0		  ; 22 B0 5A C4 | Jump to subroutine long
	LDA $00			  ; A5 00 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $BE81			; 8D 81 BE | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	STA $BE83			; 8D 83 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_24A
; Address: $CAECEB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_24A:
	JSL $C45B66		  ; 22 66 5B C4 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $02			  ; 64 02 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_24C
; Address: $CAECFB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_24C:
	JSL $C45AB0		  ; 22 B0 5A C4 | Jump to subroutine long
	LDA $04			  ; A5 04 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $BE81			; 8D 81 BE | Update graphics data
	LDA $06			  ; A5 06 | Read graphics status
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	STA $BE83			; 8D 83 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_24F
; Address: $CAED19
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_24F:
	JSL $C45AB0		  ; 22 B0 5A C4 | Jump to subroutine long
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	INC $00			  ; E6 00 | Increment (zero page)
	BNE $02			  ; D0 02 | Branch if not equal
	INC $02			  ; E6 02 | Increment (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_251
; Address: $CAED2F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_251:
	JSR $6D45			; 20 45 6D | Jump to subroutine
	BCS $10			  ; B0 10 | Branch if carry set
	LDY $360C			; AC 0C 36 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_252
; Address: $CAED37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_252:
	JSR $6D45			; 20 45 6D | Jump to subroutine
	BCS $08			  ; B0 08 | Branch if carry set
	LDY $360E			; AC 0E 36 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_253
; Address: $CAED3F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_253:
	JSR $6D45			; 20 45 6D | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_254
; Address: $CAED45
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_254:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $0E			  ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_255
; Address: $CAED4A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_255:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_257
; Address: $CAED5A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_257:
	JSL $C56D29		  ; 22 29 6D C5 | Jump to subroutine long
	BCC $2F			  ; 90 2F | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_258
; Address: $CAED63
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_258:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $BE77			; 8D 77 BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_25B
; Address: $CAED77
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_25B:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ADC $C42A			; 6D 2A C4 | Add with carry (absolute)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ORA ($40),Y		  ; 11 40 | Logical OR with accumulator ((zero page),Y)
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	SBC $089D,X		  ; FD 9D 08 | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_25D
; Address: $CAED96
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_25D:
	JSL $C42EA9		  ; 22 A9 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_25E
; Address: $CAEDA5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_25E:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDX #$18			 ; A2 18 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_25F
; Address: $CAEDB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_25F:
	JSL $C01396		  ; 22 96 13 C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	LDA #$11			 ; A9 11 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_260
; Address: $CAEDC0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_260:
	JSL $C42ED6		  ; 22 D6 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $2822,X		  ; FE 22 28 | Increment (absolute,X)
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	STA $BE77			; 8D 77 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_261
; Address: $CAEDD1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_261:
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page
	STZ $1C			  ; 64 1C | Store zero to zero page
	STZ $1E			  ; 64 1E | Store zero to zero page
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_262
; Address: $CAEDDC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_262:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	LDY #$2F			 ; A0 2F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_264
; Address: $CAEDEE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_264:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BEQ $26			  ; F0 26 | Branch if equal
	CPY $07			  ; C4 07 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $01			  ; F0 01 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	BRA $DD			  ; 80 DD | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_265
; Address: $CAEE0F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_265:
	LDY #$2F			 ; A0 2F | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_266
; Address: $CAEE15
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_266:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BEQ $26			  ; F0 26 | Branch if equal
	CPY $07			  ; C4 07 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_267
; Address: $CAEE21
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_267:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $01			  ; F0 01 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	BRA $DD			  ; 80 DD | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_26B
; Address: $CAEE4C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_26B:
	JSL $C43193		  ; 22 93 31 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_271
; Address: $CAEE6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_271:
	JSL $C77734		  ; 22 34 77 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_273
; Address: $CAEE7D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_273:
	JSL $C77843		  ; 22 43 78 C7 | Jump to subroutine long
	STA $6E			  ; 85 6E | Update graphics data
	CMP $6B			  ; C5 6B | Compare accumulator (zero page)
	LDA #$24			 ; A9 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_277
; Address: $CAEE95
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_277:
	JSL $CC9B33		  ; 22 33 9B CC | Jump to subroutine long
	LDA $C1B3			; AD B3 C1 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6EB6			; 4C B6 6E | Jump to address
	LDA #$C4			 ; A9 C4 | Read graphics status
	LDX #$80			 ; A2 80 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_278
; Address: $CAEEAD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_278:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDY $03			  ; A4 03 | Load from zero page into Y register
	JMP $6EC5			; 4C C5 6E | Jump to address
	LDA #$0A			 ; A9 0A | Read graphics status
	LDX #$80			 ; A2 80 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_279
; Address: $CAEEBF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_279:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	JMP $6F53			; 4C 53 6F | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_27C
; Address: $CAEED7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_27C:
	JSL $C57037		  ; 22 37 70 C5 | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_27E
; Address: $CAEEE8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_27E:
	JSL $C56FDC		  ; 22 DC 6F C5 | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$02			 ; A9 02 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_281
; Address: $CAEEFD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_281:
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_283
; Address: $CAEF0A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_283:
	JSL $C56FDC		  ; 22 DC 6F C5 | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_285
; Address: $CAEF1B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_285:
	JSL $C56FDC		  ; 22 DC 6F C5 | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$05			 ; A9 05 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_28A
; Address: $CAEF3B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_28A:
	JSL $CC016E		  ; 22 6E 01 CC | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA #$06			 ; A9 06 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_28C
; Address: $CAEF4C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_28C:
	JSL $C56FDC		  ; 22 DC 6F C5 | Jump to subroutine long
	JMP $6F8E			; 4C 8E 6F | Jump to address
	LDA $C1B3			; AD B3 C1 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EC9			; 4C C9 6E | Jump to address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EDE			; 4C DE 6E | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EEF			; 4C EF 6E | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6F00			; 4C 00 6F | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6F11			; 4C 11 6F | Jump to address
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6F22			; 4C 22 6F | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6F42			; 4C 42 6F | Jump to address
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_28D
; Address: $CAEF96
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_28D:
	JMP $6FB8			; 4C B8 6F | Jump to address
	LDA $C1B3			; AD B3 C1 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6FAE			; 4C AE 6F | Jump to address
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_28E
; Address: $CAEFA7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_28E:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	JMP $6FB5			; 4C B5 6F | Jump to address
	LDA #$09			 ; A9 09 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_28F
; Address: $CAEFB1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_28F:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	JMP $6FBF			; 4C BF 6F | Jump to address
	LDA $C1B1			; AD B1 C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_290
; Address: $CAEFBB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_290:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_291
; Address: $CAEFC2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_291:
	LDA #$F0			 ; A9 F0 | Read graphics status
	BEQ $22			  ; F0 22 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6FD1			; 4C D1 6F | Jump to address
	JMP $6FD5			; 4C D5 6F | Jump to address
	JMP $6FC2			; 4C C2 6F | Jump to address
	LDA #$40			 ; A9 40 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_294
; Address: $CAEFE5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_294:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	DEC $9000			; CE 00 90 | Decrement (absolute)
	JMP $700C			; 4C 0C 70 | Jump to address
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7003			; 4C 03 70 | Jump to address
	JMP $700C			; 4C 0C 70 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_295
; Address: $CAF00E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_295:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_296
; Address: $CAF019
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_296:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7035			; 4C 35 70 | Jump to address
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $702C			; 4C 2C 70 | Jump to address
	JMP $7035			; 4C 35 70 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	BVS $68			  ; 70 68 | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_297
; Address: $CAF037
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_297:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7046			; 4C 46 70 | Jump to address
	JMP $708F			; 4C 8F 70 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LDA $C74A			; AD 4A C7 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_298
; Address: $CAF04D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_298:
	JSL $C74ABA		  ; 22 BA 4A C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7068			; 4C 68 70 | Jump to address
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7065			; 4C 65 70 | Jump to address
	JMP $708F			; 4C 8F 70 | Jump to address
	JMP $704D			; 4C 4D 70 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $708F			; 4C 8F 70 | Jump to address
	LDA $3618			; AD 18 36 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7087			; 4C 87 70 | Jump to address
	JMP $708F			; 4C 8F 70 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ROR $6870			; 6E 70 68 | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_299
; Address: $CAF091
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_299:
	JSL $C77734		  ; 22 34 77 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_29E
; Address: $CAF0AD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_29E:
	JSL $C778A5		  ; 22 A5 78 C7 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ADC ($C5),Y		  ; 71 C5 | Add with carry ((zero page),Y)
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2A0
; Address: $CAF0BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2A0:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2A1
; Address: $CAF0C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2A1:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA #$05			 ; A9 05 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2A2
; Address: $CAF0D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2A2:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$06			 ; A9 06 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2A3
; Address: $CAF0DC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2A3:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$07			 ; A9 07 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2A4
; Address: $CAF0E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2A4:
	JSL $C77470		  ; 22 70 74 C7 | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA #$05			 ; A9 05 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2AD
; Address: $CAF11A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2AD:
	LDA #$21			 ; A9 21 | PPU graphics register access
	ROL $00A2			; 2E A2 00 | Rotate left (absolute)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2AE
; Address: $CAF123
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2AE:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$41			 ; A9 41 | Read graphics status
	LSR $00A2			; 4E A2 00 | Logical shift right (absolute)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2AF
; Address: $CAF130
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2AF:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$61			 ; A9 61 | Read graphics status
	JMP ($00A2)		  ; 6C A2 00 | Jump to address (absolute indirect)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2B3
; Address: $CAF149
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2B3:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2B4
; Address: $CAF153
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2B4:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$06			 ; A9 06 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2B5
; Address: $CAF15D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2B5:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$07			 ; A9 07 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2B9
; Address: $CAF17B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2B9:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $90F6			; 2D F6 90 | Logical AND with accumulator (absolute)
	JMP $718B			; 4C 8B 71 | Jump to address
	JMP $717B			; 4C 7B 71 | Jump to address
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2BC
; Address: $CAF1A0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2BC:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$56			 ; C0 56 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $71B8			; 4C B8 71 | Jump to address
	JMP $71A8			; 4C A8 71 | Jump to address
	LDA $9977			; AD 77 99 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2BD
; Address: $CAF1BB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2BD:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CMP ($2F),Y		  ; D1 2F | Compare accumulator ((zero page),Y)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$D1			 ; C0 D1 | Compare Y register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $71D3			; 4C D3 71 | Jump to address
	JMP $71C3			; 4C C3 71 | Jump to address
	LDA #$1F			 ; A9 1F | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2BE
; Address: $CAF1D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2BE:
	JSL $C79961		  ; 22 61 99 C7 | Jump to subroutine long
	LDA #$CF			 ; A9 CF | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA #$05			 ; A9 05 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C3
; Address: $CAF1FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C3:
	JSL $C0CEA4		  ; 22 A4 CE C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7209			; 4C 09 72 | Jump to address
	JMP $71FC			; 4C FC 71 | Jump to address
	LDA #$1F			 ; A9 1F | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C4
; Address: $CAF20D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C4:
	JSL $C79966		  ; 22 66 99 C7 | Jump to subroutine long
	LDA #$CC			 ; A9 CC | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA #$21			 ; A9 21 | PPU graphics register access
	ROL				  ; 2A | Rotate left (accumulator)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C5
; Address: $CAF21D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C5:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	LDA #$2E			 ; A9 2E | Read graphics status
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C6
; Address: $CAF227
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C6:
	JSL $C01F08		  ; 22 08 1F C0 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C7
; Address: $CAF231
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C7:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C8
; Address: $CAF23B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C8:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$06			 ; A9 06 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2C9
; Address: $CAF245
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2C9:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$07			 ; A9 07 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2CA
; Address: $CAF24F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2CA:
	JSL $C73405		  ; 22 05 34 C7 | Jump to subroutine long
	LDA #$07			 ; A9 07 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2CD
; Address: $CAF267
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2CD:
	JSL $C05201		  ; 22 01 52 C0 | Jump to subroutine long
	LDA #$E8			 ; A9 E8 | Read graphics status
	STA $3400			; 8D 00 34 | Update graphics data
	LDA $3400			; AD 00 34 | Read graphics status
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7281			; 4C 81 72 | Jump to address
	JMP $7272			; 4C 72 72 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D0
; Address: $CAF296
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D0:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	LDA #$2B			 ; A9 2B | Read graphics status
	AND $FEA0			; 2D A0 FE | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D1
; Address: $CAF2A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D1:
	JSL $C74A57		  ; 22 57 4A C7 | Jump to subroutine long
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	STX $72			  ; 86 72 | Store X register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D3
; Address: $CAF2B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D3:
	JSL $C743E5		  ; 22 E5 43 C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Read graphics status
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $72CA			; 4C CA 72 | Jump to address
	JMP $72BB			; 4C BB 72 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D5
; Address: $CAF2CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D5:
	LDA #$0B			 ; A9 0B | Read graphics status
	LDX #$80			 ; A2 80 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D6
; Address: $CAF2D8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D6:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA $3400			; AD 00 34 | Read graphics status
	CMP #$E8			 ; C9 E8 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $72EE			; 4C EE 72 | Jump to address
	JMP $72DF			; 4C DF 72 | Jump to address
	LDA #$1E			 ; A9 1E | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D7
; Address: $CAF2F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D7:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2D9
; Address: $CAF2FF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2D9:
	JSL $C73FB8		  ; 22 B8 3F C7 | Jump to subroutine long
	LDA $C137			; AD 37 C1 | Read graphics status
	STA $3402			; 8D 02 34 | Update graphics data
	LDA $3402			; AD 02 34 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2DA
; Address: $CAF30C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2DA:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	STZ $30			  ; 64 30 | Store zero to zero page
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$64			 ; C0 64 | Compare Y register (immediate)
	BMI $F6			  ; 30 F6 | Branch if negative
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7324			; 4C 24 73 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2DB
; Address: $CAF321
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2DB:
	JMP $7314			; 4C 14 73 | Jump to address
	LDA #$D0			 ; A9 D0 | Read graphics status
	STA $3400			; 8D 00 34 | Update graphics data
	LDA #$64			 ; A9 64 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E0
; Address: $CAF343
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E0:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $7331			; 4C 31 73 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E1
; Address: $CAF34B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E1:
	LDA #$A0			 ; A9 A0 | Read graphics status
	STA $3400			; 8D 00 34 | Update graphics data
	LDA $3402			; AD 02 34 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E2
; Address: $CAF354
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E2:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $F6			  ; 30 F6 | Branch if negative
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CPY #$A8			 ; C0 A8 | Compare Y register (immediate)
	BMI $F6			  ; 30 F6 | Branch if negative
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $736C			; 4C 6C 73 | Jump to address
	JMP $735C			; 4C 5C 73 | Jump to address
	LDA #$B8			 ; A9 B8 | Read graphics status
	STA $3400			; 8D 00 34 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E3
; Address: $CAF373
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E3:
	LDA #$0B			 ; A9 0B | Read graphics status
	LDX #$D0			 ; A2 D0 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E4
; Address: $CAF37C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E4:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA $3400			; AD 00 34 | Read graphics status
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7392			; 4C 92 73 | Jump to address
	JMP $7383			; 4C 83 73 | Jump to address
	LDA #$78			 ; A9 78 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E5
; Address: $CAF395
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E5:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	LDA $3400			; AD 00 34 | Read graphics status
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $73A8			; 4C A8 73 | Jump to address
	JMP $7399			; 4C 99 73 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E7
; Address: $CAF3AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E7:
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $73BB			; 4C BB 73 | Jump to address
	JMP $73AC			; 4C AC 73 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2E8
; Address: $CAF3BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2E8:
	JSL $C573C3		  ; 22 C3 73 C5 | Jump to subroutine long
	JMP $7399			; 4C 99 73 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2EE
; Address: $CAF3DA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2EE:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7403			; 4C 03 74 | Jump to address
	LDA #$F0			 ; A9 F0 | Read graphics status
	BEQ $22			  ; F0 22 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $73FA			; 4C FA 73 | Jump to address
	JMP $7414			; 4C 14 74 | Jump to address
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	SBC ($73,X)		  ; E1 73 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2EF
; Address: $CAF403
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2EF:
	JSL $CDC5B9		  ; 22 B9 C5 CD | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $3440			; 8D 40 34 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2F0
; Address: $CAF410
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2F0:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	LDA #$40			 ; A9 40 | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2F2
; Address: $CAF421
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2F2:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2F4
; Address: $CAF42D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2F4:
	JSL $C752F7		  ; 22 F7 52 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2F9
; Address: $CAF446
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2F9:
	JSL $C752F7		  ; 22 F7 52 C7 | Jump to subroutine long
	LDA #$0A			 ; A9 0A | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_2FD
; Address: $CAF45F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_2FD:
	JSL $C752F7		  ; 22 F7 52 C7 | Jump to subroutine long
	LDA #$06			 ; A9 06 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_301
; Address: $CAF478
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_301:
	JSL $C752F7		  ; 22 F7 52 C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_305
; Address: $CAF494
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_305:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_306
; Address: $CAF49E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_306:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_308
; Address: $CAF4AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_308:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $74A3			; 4C A3 74 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_30A
; Address: $CAF4BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_30A:
	JSL $C752F7		  ; 22 F7 52 C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$53			 ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_30B
; Address: $CAF4C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_30B:
	JSL $C77C9D		  ; 22 9D 7C C7 | Jump to subroutine long
	LDA #$D0			 ; A9 D0 | Read graphics status
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ORA $C755,Y		  ; 19 55 C7 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_310
; Address: $CAF4E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_310:
	JSL $C76D2E		  ; 22 2E 6D C7 | Jump to subroutine long
	LDA $DB07			; AD 07 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7517			; 4C 17 75 | Jump to address
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_314
; Address: $CAF509
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_314:
	JSL $C77C6F		  ; 22 6F 7C C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	LDX #$53			 ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_316
; Address: $CAF51A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_316:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $74EC			; 4C EC 74 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_317
; Address: $CAF522
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_317:
	JSL $CCD7F4		  ; 22 F4 D7 CC | Jump to subroutine long
	LDA $3514			; AD 14 35 | Read graphics status
	LDX $3520			; AE 20 35 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_31C
; Address: $CAF542
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_31C:
	JSL $C7518C		  ; 22 8C 51 C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_31D
; Address: $CAF54C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_31D:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDA $DB09			; AD 09 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7569			; 4C 69 75 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_31E
; Address: $CAF562
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_31E:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	JMP $7573			; 4C 73 75 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$07			 ; A0 07 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_320
; Address: $CAF573
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_320:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $7551			; 4C 51 75 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_324
; Address: $CAF58A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_324:
	JSL $C74112		  ; 22 12 41 C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_328
; Address: $CAF5A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_328:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_329
; Address: $CAF5AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_329:
	JSL $C73C96		  ; 22 96 3C C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_32B
; Address: $CAF5BC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_32B:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $75D6			; 4C D6 75 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	LDA $C1CF			; AD CF C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_32C
; Address: $CAF5CF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_32C:
	JSL $C73DA5		  ; 22 A5 3D C7 | Jump to subroutine long
	JMP $75BC			; 4C BC 75 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $C1CF			; AD CF C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_32D
; Address: $CAF5E6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_32D:
	JSL $C73DA5		  ; 22 A5 3D C7 | Jump to subroutine long
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $762E			; 4C 2E 76 | Jump to address
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7611			; 4C 11 76 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $C1CF			; AD CF C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_32F
; Address: $CAF611
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_32F:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $762B			; 4C 2B 76 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	LDA $C1CF			; AD CF C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_331
; Address: $CAF62B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_331:
	JMP $75EA			; 4C EA 75 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_333
; Address: $CAF638
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_333:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $764F			; 4C 4F 76 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_336
; Address: $CAF657
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_336:
	JSL $C74112		  ; 22 12 41 C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$06			 ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_337
; Address: $CAF661
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_337:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_33A
; Address: $CAF678
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_33A:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDY #$0C			 ; A0 0C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_33D
; Address: $CAF68D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_33D:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDX #$0A			 ; A2 0A | Load immediate value into X register
	LDY #$0C			 ; A0 0C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_33E
; Address: $CAF698
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_33E:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	JMP $7692			; 4C 92 76 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_340
; Address: $CAF6A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_340:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDY #$0D			 ; A0 0D | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_344
; Address: $CAF6C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_344:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7713			; 4C 13 77 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0D			 ; A0 0D | Load immediate value into Y register
	LDA $C1CF			; AD CF C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_346
; Address: $CAF6D9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_346:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $7713			; 4C 13 77 | Jump to address
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76C5			; 4C C5 76 | Jump to address
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76C5			; 4C C5 76 | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76CC			; 4C CC 76 | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76CC			; 4C CC 76 | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76CC			; 4C CC 76 | Jump to address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $76CC			; 4C CC 76 | Jump to address
	JMP $76C2			; 4C C2 76 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_34B
; Address: $CAF720
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_34B:
	JSL $C0CDF4		  ; 22 F4 CD C0 | Jump to subroutine long
	JMP $7720			; 4C 20 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_34F
; Address: $CAF737
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_34F:
	JSL $C76A11		  ; 22 11 6A C7 | Jump to subroutine long
	JMP $7733			; 4C 33 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_350
; Address: $CAF73F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_350:
	LDA #$20			 ; A9 20 | Read graphics status
	ROL $AD35,X		  ; 3E 35 AD | Rotate left (absolute,X)
	ASL $8D35			; 0E 35 8D | Arithmetic shift left (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA $351A			; AD 1A 35 | Read graphics status
	STA $9854			; 8D 54 98 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	JMP $C7325E		  ; 5C 5E 32 C7 | Jump to address long
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_351
; Address: $CAF759
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_351:
	LDA #$01			 ; A9 01 | Read graphics status
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_354
; Address: $CAF76A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_354:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_355
; Address: $CAF774
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_355:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	LDA $DB09			; AD 09 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7791			; 4C 91 77 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_356
; Address: $CAF78A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_356:
	JSL $C73D6B		  ; 22 6B 3D C7 | Jump to subroutine long
	JMP $779B			; 4C 9B 77 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$05			 ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_358
; Address: $CAF79B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_358:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	JMP $7779			; 4C 79 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_35A
; Address: $CAF7A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_35A:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C203			; 8D 03 C2 | Update graphics data
	LDA $C203			; AD 03 C2 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7838			; 4C 38 78 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_35B
; Address: $CAF7B7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_35B:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$20			 ; E9 20 | Subtract with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data
	LDA #$54			 ; A9 54 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_35E
; Address: $CAF7E1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_35E:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_362
; Address: $CAF80B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_362:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data
	LDA #$54			 ; A9 54 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_364
; Address: $CAF831
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_364:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	INC $C203			; EE 03 C2 | Increment (absolute)
	JMP $77AC			; 4C AC 77 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_365
; Address: $CAF83D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_365:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C203			; 8D 03 C2 | Update graphics data
	LDA $C203			; AD 03 C2 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $78D4			; 4C D4 78 | Jump to address
	LDA #$0A			 ; A9 0A | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_367
; Address: $CAF856
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_367:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$18			 ; 69 18 | Add with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$38			 ; E9 38 | Subtract with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data
	LDA #$52			 ; A9 52 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_36A
; Address: $CAF880
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_36A:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$30			 ; 69 30 | Add with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_36B
; Address: $CAF891
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_36B:
	SEC				  ; 38 | Set carry flag
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data
	LDA #$52			 ; A9 52 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_36E
; Address: $CAF8AA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_36E:
	JSL $C578D9		  ; 22 D9 78 C5 | Jump to subroutine long
	LDA $3430			; AD 30 34 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $3432			; AD 32 34 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $3432			; 8D 32 34 | Update graphics data
	LDA #$52			 ; A9 52 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_370
; Address: $CAF8D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_370:
	JSL $C74B39		  ; 22 39 4B C7 | Jump to subroutine long
	JMP $7844			; 4C 44 78 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_373
; Address: $CAF8E0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_373:
	JSL $C75556		  ; 22 56 55 C7 | Jump to subroutine long
	LDA $C125			; AD 25 C1 | Read graphics status
	STA $3430			; 8D 30 34 | Update graphics data
	LDA $C127			; AD 27 C1 | Read graphics status
	STA $3432			; 8D 32 34 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_375
; Address: $CAF8F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_375:
	LDA #$A0			 ; A9 A0 | Read graphics status
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_376
; Address: $CAF8FE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_376:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Read graphics status
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $22			  ; 30 22 | Branch if negative
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_37A
; Address: $CAF925
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_37A:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7932			; 4C 32 79 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_37E
; Address: $CAF93B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_37E:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$9D			 ; A9 9D | Read graphics status
	LDX #$93			 ; A2 93 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_381
; Address: $CAF950
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_381:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	LDA $353D			; AD 3D 35 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7995			; 4C 95 79 | Jump to address
	LDA $C205			; AD 05 C2 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7991			; 4C 91 79 | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_382
; Address: $CAF971
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_382:
	JSL $C568A6		  ; 22 A6 68 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $798A			; 4C 8A 79 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_385
; Address: $CAF991
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_385:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $795B			; 4C 5B 79 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_387
; Address: $CAF99D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_387:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$9D			 ; A9 9D | Read graphics status
	LDX #$93			 ; A2 93 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_38A
; Address: $CAF9B2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_38A:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Read graphics status
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	LDA $353D			; AD 3D 35 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $79F7			; 4C F7 79 | Jump to address
	LDA $C205			; AD 05 C2 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_38C
; Address: $CAF9D3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_38C:
	JSL $C568A6		  ; 22 A6 68 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $79EC			; 4C EC 79 | Jump to address
	LDA #$02			 ; A9 02 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_38F
; Address: $CAF9F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_38F:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $79BD			; 4C BD 79 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_391
; Address: $CAF9FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_391:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$9D			 ; A9 9D | Read graphics status
	LDX #$93			 ; A2 93 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_394
; Address: $CAFA14
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_394:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Read graphics status
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	LDA $353D			; AD 3D 35 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A59			; 4C 59 7A | Jump to address
	LDA $C205			; AD 05 C2 | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7A55			; 4C 55 7A | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_395
; Address: $CAFA35
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_395:
	JSL $C568A6		  ; 22 A6 68 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7A4E			; 4C 4E 7A | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_398
; Address: $CAFA55
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_398:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7A1F			; 4C 1F 7A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_39A
; Address: $CAFA61
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_39A:
	JSL $C74BCA		  ; 22 CA 4B C7 | Jump to subroutine long
	LDA #$9D			 ; A9 9D | Read graphics status
	LDX #$93			 ; A2 93 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_39E
; Address: $CAFA76
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_39E:
	JSL $C74E19		  ; 22 19 4E C7 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Read graphics status
	ORA $C2			  ; 05 C2 | Logical OR with accumulator (zero page)
	LDA $353D			; AD 3D 35 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7ABB			; 4C BB 7A | Jump to address
	LDA $C205			; AD 05 C2 | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AB7			; 4C B7 7A | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_39F
; Address: $CAFA97
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_39F:
	JSL $C568A6		  ; 22 A6 68 C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7AB0			; 4C B0 7A | Jump to address
	LDA #$03			 ; A9 03 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A2
; Address: $CAFAB7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A2:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7A81			; 4C 81 7A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A3
; Address: $CAFAC0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A3:
	LDA #$9E			 ; A9 9E | Read graphics status
	LDX #$24			 ; A2 24 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A5
; Address: $CAFAD2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A5:
	JSL $C740B4		  ; 22 B4 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $22			  ; 30 22 | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A6
; Address: $CAFADD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A6:
	JSL $C74027		  ; 22 27 40 C7 | Jump to subroutine long
	LDA $353D			; AD 3D 35 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B5F			; 4C 5F 7B | Jump to address
	JMP $7B41			; 4C 41 7B | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A7
; Address: $CAFAF0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A7:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7B5C			; 4C 5C 7B | Jump to address
	LDA $C1E7			; AD E7 C1 | Read graphics status
	STA $C1EB			; 8D EB C1 | Update graphics data
	DEC $C1EB			; CE EB C1 | Decrement (absolute)
	LDA $C1EB			; AD EB C1 | Read graphics status
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3A8
; Address: $CAFB06
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3A8:
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7B18			; 4C 18 7B | Jump to address
	LDA $C1EB			; AD EB C1 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3AA
; Address: $CAFB18
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3AA:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7B5C			; 4C 5C 7B | Jump to address
	LDA #$06			 ; A9 06 | Read graphics status
	STA $C1EB			; 8D EB C1 | Update graphics data
	LDA $C1EB			; AD EB C1 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3AC
; Address: $CAFB2F
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3AC:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B3E			; 4C 3E 7B | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1E9			; 8D E9 C1 | Update graphics data
	JMP $7B5C			; 4C 5C 7B | Jump to address
	LDA $C1E9			; AD E9 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AF0			; 4C F0 7A | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7AF7			; 4C F7 7A | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B1F			; 4C 1F 7B | Jump to address
	JMP $7B63			; 4C 63 7B | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3AD
; Address: $CAFB5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3AD:
	JSL $C73E43		  ; 22 43 3E C7 | Jump to subroutine long
	JMP $7AE2			; 4C E2 7A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3B1
; Address: $CAFB75
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3B1:
	JSL $C76A78		  ; 22 78 6A C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B96			; 4C 96 7B | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3B6
; Address: $CAFB8E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3B6:
	JSL $C56565		  ; 22 65 65 C5 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	JMP $7B97			; 4C 97 7B | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3B8
; Address: $CAFB9B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3B8:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BFB			; 4C FB 7B | Jump to address
	LDA #$3D			 ; A9 3D | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3BA
; Address: $CAFBAD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3BA:
	JSL $C737FC		  ; 22 FC 37 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7BF4			; 4C F4 7B | Jump to address
	JMP $7BDE			; 4C DE 7B | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3BC
; Address: $CAFBBD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3BC:
	JSL $C56BAF		  ; 22 AF 6B C5 | Jump to subroutine long
	JMP $7BF1			; 4C F1 7B | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $33B8			; 8D B8 33 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	LDX #$09			 ; A2 09 | Load immediate value into X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3BE
; Address: $CAFBD7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3BE:
	JSL $C57D5F		  ; 22 5F 7D C5 | Jump to subroutine long
	JMP $7BF1			; 4C F1 7B | Jump to address
	LDA $C13B			; AD 3B C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BB9			; 4C B9 7B | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7BC4			; 4C C4 7B | Jump to address
	JMP $7BAA			; 4C AA 7B | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3BF
; Address: $CAFBF4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3BF:
	JSL $C73831		  ; 22 31 38 C7 | Jump to subroutine long
	JMP $7CEF			; 4C EF 7C | Jump to address
	LDA $C1F3			; AD F3 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CEF			; 4C EF 7C | Jump to address
	LDA $C1E1			; AD E1 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7C25			; 4C 25 7C | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C1
; Address: $CAFC17
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C1:
	JSL $CDACD2		  ; 22 D2 AC CD | Jump to subroutine long
	LDA #$02			 ; A9 02 | Read graphics status
	STA $C1FD			; 8D FD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C2
; Address: $CAFC21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C2:
	JSL $C59089		  ; 22 89 90 C5 | Jump to subroutine long
	LDX #$01			 ; A2 01 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C3
; Address: $CAFC2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C3:
	JSL $C78D60		  ; 22 60 8D C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7C48			; 4C 48 7C | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C4
; Address: $CAFC34
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C4:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $A9CD			; AC CD A9 | Load from absolute address into Y register
	STA $C1FD			; 8D FD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C6
; Address: $CAFC4B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C6:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA $C1E5			; AD E5 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7CEF			; 4C EF 7C | Jump to address
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3C7
; Address: $CAFC5D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3C7:
	JSL $C737FC		  ; 22 FC 37 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7CE5			; 4C E5 7C | Jump to address
	JMP $7CBF			; 4C BF 7C | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3CC
; Address: $CAFC82
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3CC:
	JSL $C56BAF		  ; 22 AF 6B C5 | Jump to subroutine long
	JMP $7CE2			; 4C E2 7C | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $33B8			; 8D B8 33 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	LDX #$09			 ; A2 09 | Load immediate value into X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D0
; Address: $CAFCA9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D0:
	JSL $C57CF0		  ; 22 F0 7C C5 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7CBC			; 4C BC 7C | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1FD			; 8D FD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D1
; Address: $CAFCB8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D1:
	JSL $C59089		  ; 22 89 90 C5 | Jump to subroutine long
	JMP $7CE2			; 4C E2 7C | Jump to address
	LDA $C13B			; AD 3B C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C69			; 4C 69 7C | Jump to address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C7E			; 4C 7E 7C | Jump to address
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D2
; Address: $CAFCD5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D2:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7C89			; 4C 89 7C | Jump to address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7CA3			; 4C A3 7C | Jump to address
	JMP $7CEC			; 4C EC 7C | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D3
; Address: $CAFCE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D3:
	JSL $C73831		  ; 22 31 38 C7 | Jump to subroutine long
	JMP $7CEF			; 4C EF 7C | Jump to address
	JMP $7C4F			; 4C 4F 7C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D5
; Address: $CAFCF3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D5:
	JSL $C73814		  ; 22 14 38 C7 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7D0B			; 4C 0B 7D | Jump to address
	LDA $C13B			; AD 3B C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7D0B			; 4C 0B 7D | Jump to address
	SEC				  ; 38 | Set carry flag
	JMP $7D0C			; 4C 0C 7D | Jump to address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D6
; Address: $CAFD0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D6:
	LDA $C1E5			; AD E5 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D2D			; 4C 2D 7D | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3D8
; Address: $CAFD1E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3D8:
	JSL $C57B75		  ; 22 75 7B C5 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7D2A			; 4C 2A 7D | Jump to address
	JMP $7D2D			; 4C 2D 7D | Jump to address
	JMP $7D0D			; 4C 0D 7D | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3DA
; Address: $CAFD32
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3DA:
	LDA $C149			; AD 49 C1 | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $7D47			; 4C 47 7D | Jump to address
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C1FD			; 8D FD C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3DC
; Address: $CAFD4A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3DC:
	JSL $C72FEE		  ; 22 EE 2F C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D5A			; 4C 5A 7D | Jump to address
	LDA #$24			 ; A9 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3E4
; Address: $CAFD79
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3E4:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	LDA $F63C,X		  ; BD 3C F6 | Read graphics status
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3E5
; Address: $CAFD81
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3E5:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	LDA $F63C,X		  ; BD 3C F6 | Read graphics status
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7D91			; 4C 91 7D | Jump to address
	JMP $7D81			; 4C 81 7D | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3EB
; Address: $CAFDB1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3EB:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7DC1			; 4C C1 7D | Jump to address
	JMP $7DB1			; 4C B1 7D | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3F0
; Address: $CAFDD9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3F0:
	JSL $C72FB2		  ; 22 B2 2F C7 | Jump to subroutine long
	LDA #$9F			 ; A9 9F | Read graphics status
	LDX $3430			; AE 30 34 | Load from absolute address into X register
	LDY $3432			; AC 32 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3F1
; Address: $CAFDE6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3F1:
	JSL $C73C42		  ; 22 42 3C C7 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $22			  ; 30 22 | Branch if negative

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3F2
; Address: $CAFDF3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3F2:
	JSL $C74027		  ; 22 27 40 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3F5
; Address: $CAFE08
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3F5:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	CMP $F644			; CD 44 F6 | Compare accumulator (absolute)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STA $0422,Y		  ; 99 22 04 | Update graphics data
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	AND $01F6,X		  ; 3D F6 01 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3F6
; Address: $CAFE1B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3F6:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $90F6,X		  ; 3D F6 90 | Logical AND with accumulator (absolute,X)
	JMP $7E2B			; 4C 2B 7E | Jump to address
	JMP $7E1B			; 4C 1B 7E | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_3FE
; Address: $CAFE59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_3FE:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	AND $90F6,X		  ; 3D F6 90 | Logical AND with accumulator (absolute,X)
	JMP $7E69			; 4C 69 7E | Jump to address
	JMP $7E59			; 4C 59 7E | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_407
; Address: $CAFEA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_407:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	AND $01F6,X		  ; 3D F6 01 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_408
; Address: $CAFEA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_408:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	AND $90F6,X		  ; 3D F6 90 | Logical AND with accumulator (absolute,X)
	JMP $7EB8			; 4C B8 7E | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_409
; Address: $CAFEB5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_409:
	JMP $7EA8			; 4C A8 7E | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C203			; 8D 03 C2 | Update graphics data
	LDA $C203			; AD 03 C2 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7ECE			; 4C CE 7E | Jump to address
	JMP $7EBF			; 4C BF 7E | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C203			; 8D 03 C2 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_40C
; Address: $CAFEE0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_40C:
	JSL $C04835		  ; 22 35 48 C0 | Jump to subroutine long
	ROL $90F6,X		  ; 3E F6 90 | Rotate left (absolute,X)
	JMP $7EF0			; 4C F0 7E | Jump to address
	JMP $7EE0			; 4C E0 7E | Jump to address
	LDA #$13			 ; A9 13 | Read graphics status

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_412
; Address: $CAFF15
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_412:
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_413
; Address: $CAFF1E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_413:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Update graphics data
	LDX #$E2			 ; A2 E2 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_416
; Address: $CAFF41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_416:
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_418
; Address: $CAFF50
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_418:
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Update graphics data
	LDX #$E8			 ; A2 E8 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_41B
; Address: $CAFF6D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_41B:
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_41C
; Address: $CAFF76
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_41C:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Update graphics data
	LDX #$E9			 ; A2 E9 | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_41F
; Address: $CAFF99
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_41F:
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_420
; Address: $CAFFA2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_420:
	JSL $C01FEE		  ; 22 EE 1F C0 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9680			; 8D 80 96 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $9682			; 8D 82 96 | Update graphics data
	LDX #$EA			 ; A2 EA | Load immediate value into X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_425
; Address: $CAFFCC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_425:
	JSL $CDAC66		  ; 22 66 AC CD | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7FE2			; 4C E2 7F | Jump to address

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_427
; Address: $CAFFD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_427:
	NOP				  ; EA | No operation
	ASL $D222			; 0E 22 D2 | Arithmetic shift left (absolute)
	LDY $4CCD			; AC CD 4C | Load from absolute address into Y register
	INC $7F			  ; E6 7F | Increment (zero page)

;------------------------------------------------------------------------------
; Bank14_GraphicsFunction_429
; Address: $CAFFE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank14_GraphicsFunction_429:
	LDA $C1F5			; AD F5 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7FF9			; 4C F9 7F | Jump to address
