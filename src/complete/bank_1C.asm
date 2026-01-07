;==============================================================================
; Dragon Quest III - Bank $1C
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $CE0000-$CE7FFF
; Instructions: 11977
; Bytes: 32770
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_1C"

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_000
; Address: $CE8000
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_000:
	INC $01			  ; E6 01 | Increment (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	JMP ($C702)		  ; 6C 02 C7 | Jump to address (absolute indirect)
	LDA $F2C702		  ; AF 02 C7 F2 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	INC $C703,X		  ; FE 03 C7 | Increment (absolute,X)
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	STY $04			  ; 84 04 | Store Y register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $C7			  ; 05 C7 | Logical OR with accumulator (zero page)
	EOR $C705			; 4D 05 C7 | Exclusive OR with accumulator (absolute)
	BCC $05			  ; 90 05 | Branch if carry clear
	ORA $C7			  ; 05 C7 | Logical OR with accumulator (zero page)
	ASL $C7			  ; 06 C7 | Arithmetic shift left (zero page)
	EOR $C706,Y		  ; 59 06 C7 | Exclusive OR with accumulator (absolute,Y)
	STZ $C706			; 9C 06 C7 | Store zero to absolute
	ASL $C7			  ; 06 C7 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_001
; Address: $CE803C
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_001:
	JSL $65C707		  ; 22 07 C7 65 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	ROL $C708			; 2E 08 C7 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	EOR ($08),Y		  ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $08			  ; 66 08 | Rotate right (zero page)
	ADC $C708			; 6D 08 C7 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT #$08			 ; 89 08 | Test bits in accumulator (immediate)
	BCC $08			  ; 90 08 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	STZ $C708,X		  ; 9E 08 C7 | Store zero to absolute,X
	LDA $08			  ; A5 08 | Read graphics status
	LDY $C708			; AC 08 C7 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	PHP				  ; 08 | Push processor status to stack
	CMP ($08,X)		  ; C1 08 | Compare accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CMP $C708,X		  ; DD 08 C7 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_002
; Address: $CE8096
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_002:
	CPX $08			  ; E4 08 | Compare X register (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $C708,Y		  ; F9 08 C7 | Subtract with carry (absolute,Y)
	ORA #$C7			 ; 09 C7 | Logical OR with accumulator (immediate)
	ORA #$C7			 ; 09 C7 | Logical OR with accumulator (immediate)
	ASL $C709			; 0E 09 C7 | Arithmetic shift left (absolute)
	STA ($09),Y		  ; 91 09 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	AND ($0B,X)		  ; 21 0B | Logical AND with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	AND $C70B,X		  ; 3D 0B C7 | Logical AND with accumulator (absolute,X)
	EOR $C70B,Y		  ; 59 0B C7 | Exclusive OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_003
; Address: $CE80D8
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_003:
	ROR $C70B			; 6E 0B C7 | Rotate right (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	STA ($0B),Y		  ; 91 0B | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 0B C7 A6 | Update graphics data
	LDA $C70B			; AD 0B C7 | Read graphics status
	REP #$0B			 ; C2 0B | Reset processor status bits
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	BNE $0B			  ; D0 0B | Branch if not equal
	DEC $C70B,X		  ; DE 0B C7 | Decrement (absolute,X)
	SBC $0B			  ; E5 0B | Subtract with carry (zero page)
	CPX $C70B			; EC 0B C7 | Compare X register (absolute)
	PLX				  ; FA | Pull X register from stack
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $C70C,X		  ; 1D 0C C7 | Logical OR with accumulator (absolute,X)
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	AND $C70C,Y		  ; 39 0C C7 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STA $C70C,Y		  ; 99 0C C7 | Update graphics data
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $C70D			; 0E 0D C7 | Arithmetic shift left (absolute)
	AND ($0D),Y		  ; 31 0D | Logical AND with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $77C7			; 0D C7 77 | Logical OR with accumulator (absolute)
	ORA $A2C7			; 0D C7 A2 | Logical OR with accumulator (absolute)
	ORA $C5C7			; 0D C7 C5 | Logical OR with accumulator (absolute)
	ORA $E8C7			; 0D C7 E8 | Logical OR with accumulator (absolute)
	ORA $0BC7			; 0D C7 0B | Logical OR with accumulator (absolute)
	ASL $2EC7			; 0E C7 2E | Arithmetic shift left (absolute)
	ASL $4DC7			; 0E C7 4D | Arithmetic shift left (absolute)
	ASL $74C7			; 0E C7 74 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_004
; Address: $CE8163
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_004:
	ASL $9BC7			; 0E C7 9B | Arithmetic shift left (absolute)
	ASL $FEC7			; 0E C7 FE | Arithmetic shift left (absolute)
	ASL $19C7			; 0E C7 19 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	LDX #$0F			 ; A2 0F | Load immediate value into X register
	CMP $C70F,X		  ; DD 0F C7 | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $C7			  ; 10 C7 | Branch if positive
	BPL $C7			  ; 10 C7 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	BPL $C7			  ; 10 C7 | Branch if positive
	ADC ($10,X)		  ; 61 10 | Add with carry ((zero page,X))
	BPL $C7			  ; 10 C7 | Branch if positive
	BPL $C7			  ; 10 C7 | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	BPL $C7			  ; 10 C7 | Branch if positive
	LDA $C710			; AD 10 C7 | Read graphics status
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $C7			  ; 10 C7 | Branch if positive
	BPL $C7			  ; 10 C7 | Branch if positive
	SBC $C710,X		  ; FD 10 C7 | Subtract with carry (absolute,X)
	ORA ($C7),Y		  ; 11 C7 | Logical OR with accumulator ((zero page),Y)
	ORA ($C7),Y		  ; 11 C7 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($C7),Y		  ; 11 C7 | Logical OR with accumulator ((zero page),Y)
	EOR ($11,X)		  ; 41 11 | Exclusive OR with accumulator ((zero page,X))
	STA $42C717		  ; 8F 17 C7 42 | Hardware register operation
	INC				  ; 1A | Increment accumulator
	SBC $C71B,Y		  ; F9 1B C7 | Subtract with carry (absolute,Y)
	BIT $C71F			; 2C 1F C7 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_007
; Address: $CE81C0
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_007:
	JSR $10C7			; 20 C7 10 | Jump to subroutine
	AND ($C7,X)		  ; 21 C7 | Logical AND with accumulator ((zero page,X))
	AND ($C7,X)		  ; 21 C7 | Logical AND with accumulator ((zero page,X))
	LSR $C721			; 4E 21 C7 | Logical shift right (absolute)
	ADC $C721			; 6D 21 C7 | Add with carry (absolute)
	BRA $21			  ; 80 21 | PPU graphics register access
	AND ($C7,X)		  ; 21 C7 | Logical AND with accumulator ((zero page,X))
	ROR $C722,X		  ; 7E 22 C7 | Rotate right (absolute,X)
	ADC $C723			; 6D 23 C7 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_008
; Address: $CE8221
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_008:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_009
; Address: $CE8325
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_009:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00A
; Address: $CE83F5
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00A:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00B
; Address: $CE8501
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00B:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00C
; Address: $CE85E9
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00C:
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00D
; Address: $CE86AB
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00E
; Address: $CE875D
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00E:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_00F
; Address: $CE87E5
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_00F:
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	INC $01FF,X		  ; FE FF 01 | Increment (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $01FF,X		  ; FE FF 01 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_010
; Address: $CE88BA
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_010:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_011
; Address: $CE8975
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_011:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_012
; Address: $CE8A33
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_012:
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_013
; Address: $CE8ACA
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_013:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $1000,X		  ; FE 00 10 | Increment (absolute,X)
	BPL $01			  ; 10 01 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0600,X		  ; FE 00 06 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $1002,X		  ; FE 02 10 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0602,X		  ; FE 02 06 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $06FE,X		  ; FE FE 06 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $0800,X		  ; FE 00 08 | Increment (absolute,X)
	INC $02FF,X		  ; FE FF 02 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $0600,X		  ; FE 00 06 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $0802,X		  ; FE 02 08 | Increment (absolute,X)
	INC $02FF,X		  ; FE FF 02 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $0602,X		  ; FE 02 06 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	INC $06FE,X		  ; FE FE 06 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_014
; Address: $CE8B87
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_014:
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	INC $0002,X		  ; FE 02 00 | Increment (absolute,X)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BPL $01			  ; 10 01 | Branch if positive
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	BPL $02			  ; 10 02 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0004,X		  ; FE 04 00 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $1000,X		  ; FE 00 10 | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $1000,X		  ; FE 00 10 | Increment (absolute,X)
	BPL $01			  ; 10 01 | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $00FC,X		  ; FE FC 00 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	INC $04FF,X		  ; FE FF 04 | Increment (absolute,X)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $FE			  ; 10 FE | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_015
; Address: $CE8C43
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_015:
	JSR $0400			; 20 00 04 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0202,X		  ; FD 02 02 | Subtract with carry (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $0402,X		  ; FD 02 04 | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_016
; Address: $CE8C79
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_016:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0306,X		  ; FD 06 03 | Subtract with carry (absolute,X)
	SBC $0306,X		  ; FD 06 03 | Subtract with carry (absolute,X)
	INC $0107,X		  ; FE 07 01 | Increment (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0206,X		  ; FD 06 02 | Subtract with carry (absolute,X)
	SBC $0106,X		  ; FD 06 01 | Subtract with carry (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SBC $0406,X		  ; FD 06 04 | Subtract with carry (absolute,X)
	INC $0107,X		  ; FE 07 01 | Increment (absolute,X)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0702,X		  ; FE 02 07 | Increment (absolute,X)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $02FF,X		  ; FD FF 02 | Subtract with carry (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0302,X		  ; FD 02 03 | Subtract with carry (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0600,X		  ; FE 00 06 | Increment (absolute,X)
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	SBC $0301,X		  ; FD 01 03 | Subtract with carry (absolute,X)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_017
; Address: $CE8D95
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_017:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $0300,X		  ; FD 00 03 | Subtract with carry (absolute,X)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $0302,X		  ; FD 02 03 | Subtract with carry (absolute,X)
	INC $0202,X		  ; FE 02 02 | Increment (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $0304,X		  ; FD 04 03 | Subtract with carry (absolute,X)
	INC $0204,X		  ; FE 04 02 | Increment (absolute,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	SBC $0306,X		  ; FD 06 03 | Subtract with carry (absolute,X)
	INC $0206,X		  ; FE 06 02 | Increment (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_018
; Address: $CE8E83
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_018:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	INC $0100			; EE 00 01 | Increment (absolute)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	SBC $00FC,X		  ; FD FC 00 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $0400			; EE 00 04 | Increment (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC $0600,X		  ; FD 00 06 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_019
; Address: $CE8F5D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_019:
	SBC $1000,X		  ; FD 00 10 | Subtract with carry (absolute,X)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01A
; Address: $CE8F6A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01A:
	JSL $040101		  ; 22 01 01 04 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $2202,Y		  ; F9 02 22 | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01B
; Address: $CE8FE0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01B:
	JSL $000101		  ; 22 01 01 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01C
; Address: $CE8FEA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01D
; Address: $CE901B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01D:
	JSL $00FFFF		  ; 22 FF FF 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PEA #$5A00		   ; F4 00 5A | Push effective address to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $0A00,X		  ; FE 00 0A | Increment (absolute,X)
	SBC $0605,X		  ; FD 05 06 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01E
; Address: $CE908E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01E:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $07FF,X		  ; FE FF 07 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $03FF,X		  ; FD FF 03 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $0701,X		  ; FE 01 07 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $0301,X		  ; FD 01 03 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $0100,X		  ; FD 00 01 | Subtract with carry (absolute,X)
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $00FD			; 0D FD 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_01F
; Address: $CE9150
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_01F:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_020
; Address: $CE91F8
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_020:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_021
; Address: $CE929C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_021:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_022
; Address: $CE9338
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_022:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_023
; Address: $CE9400
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_023:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_024
; Address: $CE94BF
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_024:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_025
; Address: $CE957B
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_025:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_026
; Address: $CE9637
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_026:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_027
; Address: $CE96F7
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_027:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_028
; Address: $CE97B6
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_028:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_029
; Address: $CE987E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_029:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02A
; Address: $CE992C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02B
; Address: $CE99C6
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $0100,X		  ; FD 00 01 | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02C
; Address: $CE9A89
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02D
; Address: $CE9B59
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02D:
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

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02E
; Address: $CE9BED
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_02F
; Address: $CE9C7C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_02F:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_030
; Address: $CE9D00
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_030:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_031
; Address: $CE9D88
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_031:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_032
; Address: $CE9E2C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_032:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_033
; Address: $CE9EF4
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_033:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_034
; Address: $CE9FBB
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_034:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_035
; Address: $CEA026
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_035:
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_036
; Address: $CEA062
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_036:
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0800,X		  ; FE 00 08 | Increment (absolute,X)
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0400,X		  ; FE 00 04 | Increment (absolute,X)
	SBC $0400,X		  ; FD 00 04 | Subtract with carry (absolute,X)
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_037
; Address: $CEA127
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_037:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SBC $0200,X		  ; FD 00 02 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_038
; Address: $CEA180
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_038:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_039
; Address: $CEA1CB
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_039:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_03A
; Address: $CEA27E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_03A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_03B
; Address: $CEA2A9
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_03B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_03C
; Address: $CEA3BF
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_03C:
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	PEA #$00FA		   ; F4 FA 00 | Push effective address to stack
	LDY #$F5			 ; A0 F5 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	SBC $00FA,X		  ; FD FA 00 | Subtract with carry (absolute,X)
	SBC $FB0D,Y		  ; F9 0D FB | Subtract with carry (absolute,Y)
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	CMP $16			  ; C5 16 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00FB,X		  ; 1D FB 00 | Logical OR with accumulator (absolute,X)
	AND ($FB,X)		  ; 21 FB | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $3A			  ; 90 3A | Branch if carry clear
	LDA ($41,X)		  ; A1 41 | Read graphics status
	EOR $FB			  ; 45 FB | Exclusive OR with accumulator (zero page)
	EOR ($FB),Y		  ; 51 FB | Exclusive OR with accumulator ((zero page),Y)
	BEQ $60			  ; F0 60 | Branch if equal
	ROR $FB			  ; 66 FB | Rotate right (zero page)
	ADC ($FB),Y		  ; 71 FB | Add with carry ((zero page),Y)
	ADC ($FB),Y		  ; 71 FB | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_03D
; Address: $CEA41A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_03D:
	DEY				  ; 88 | Decrement Y register
	STZ $FB91			; 9C 91 FB | Store zero to absolute
	LDX $FB99			; AE 99 FB | Load from absolute address into X register
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	ORA ($F5,X)		  ; 01 F5 | Logical OR with accumulator ((zero page,X))
	DEC $00FB			; CE FB 00 | Decrement (absolute)
	ORA $FBDB,Y		  ; 19 DB FB | Logical OR with accumulator (absolute,Y)
	STA $00FBE2		  ; 8F E2 FB 00 | Update graphics data
	ASL $EF			  ; 06 EF | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($D8,X)		  ; 01 D8 | Logical OR with accumulator ((zero page,X))
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	EOR $0A			  ; 45 0A | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_03F
; Address: $CEA455
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_03F:
	JSR $FC1A			; 20 1A FC | Jump to subroutine
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($4E,X)		  ; 01 4E | Logical OR with accumulator ((zero page,X))
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	ORA $01FC,X		  ; 1D FC 01 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_040
; Address: $CEA471
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_040:
	AND $FC1E,X		  ; 3D 1E FC | Logical AND with accumulator (absolute,X)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	ASL $01FC,X		  ; 1E FC 01 | Arithmetic shift left (absolute,X)
	ROR $FC1F,X		  ; 7E 1F FC | Rotate right (absolute,X)
	ORA ($9B,X)		  ; 01 9B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_041
; Address: $CEA47E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_041:
	JSR $01FC			; 20 FC 01 | Jump to subroutine
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	AND $FC			  ; 25 FC | Logical AND with accumulator (zero page)
	ORA $9B			  ; 05 9B | Logical OR with accumulator (zero page)
	ROL $FC			  ; 26 FC | Rotate left (zero page)
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	ROL $FC			  ; 26 FC | Rotate left (zero page)
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	AND $01FC			; 2D FC 01 | Logical AND with accumulator (absolute)
	PEA #$FC2D		   ; F4 2D FC | Push effective address to stack
	ORA ($B2,X)		  ; 01 B2 | Logical OR with accumulator ((zero page,X))
	ROL $03FC			; 2E FC 03 | Rotate left (absolute)
	STA $FC2F,Y		  ; 99 2F FC | Update graphics data
	CMP ($2F),Y		  ; D1 2F | Compare accumulator ((zero page),Y)
	BMI $FC			  ; 30 FC | Branch if negative
	BMI $FC			  ; 30 FC | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)
	BMI $FC			  ; 30 FC | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)
	BMI $FC			  ; 30 FC | Branch if negative
	STZ $FC30,X		  ; 9E 30 FC | Store zero to absolute,X
	BMI $FC			  ; 30 FC | Branch if negative
	ORA $31			  ; 05 31 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	LDY $FC31			; AC 31 FC | Load from absolute address into Y register
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	LDA ($33,X)		  ; A1 33 | Read graphics status
	DEC $FC34			; CE 34 FC | Decrement (absolute)
	ADC $FC35,Y		  ; 79 35 FC | Add with carry (absolute,Y)
	LDX $FC35			; AE 35 FC | Load from absolute address into X register
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_042
; Address: $CEA52D
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_042:
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $FC36,X		  ; DD 36 FC | Compare accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA $FC37,X		  ; BD 37 FC | Read graphics status
	SEP #$37			 ; E2 37 | Set processor status bits
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	ORA $68			  ; 05 68 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	SEP #$38			 ; E2 38 | Set processor status bits
	AND $03FC,Y		  ; 39 FC 03 | Logical AND with accumulator (absolute,Y)
	DEC $FC39			; CE 39 FC | Decrement (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA $B5			  ; 05 B5 | Logical OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	LSR $FC3B,X		  ; 5E 3B FC | Logical shift right (absolute,X)
	LDY $3B			  ; A4 3B | Load from zero page into Y register
	STY $FC3C			; 8C 3C FC | Store Y register to absolute address
	DEC $FC3C,X		  ; DE 3C FC | Decrement (absolute,X)
	AND $05FC,X		  ; 3D FC 05 | Logical AND with accumulator (absolute,X)
	AND $00FC,X		  ; 3D FC 00 | Logical AND with accumulator (absolute,X)
	AND $02FC,X		  ; 3D FC 02 | Logical AND with accumulator (absolute,X)
	ROL $00FC,X		  ; 3E FC 00 | Rotate left (absolute,X)
	ROL $02FC,X		  ; 3E FC 02 | Rotate left (absolute,X)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	LDX #$3F			 ; A2 3F | Load immediate value into X register
	LSR $FC40,X		  ; 5E 40 FC | Logical shift right (absolute,X)
	LSR $FC40,X		  ; 5E 40 FC | Logical shift right (absolute,X)
	ORA ($41),Y		  ; 11 41 | Logical OR with accumulator ((zero page),Y)
	EOR $41			  ; 45 41 | Exclusive OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	EOR ($FC,X)		  ; 41 FC | Exclusive OR with accumulator ((zero page,X))
	SBC ($41),Y		  ; F1 41 | Subtract with carry ((zero page),Y)
	WDM #$FC			 ; 42 FC | Reserved instruction
	LDA $FC42,X		  ; BD 42 FC | Read graphics status
	AND $43			  ; 25 43 | Logical AND with accumulator (zero page)
	STZ $FC43			; 9C 43 FC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_044
; Address: $CEA5E9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_044:
	JSR $FC45			; 20 45 FC | Jump to subroutine
	EOR $FC			  ; 45 FC | Exclusive OR with accumulator (zero page)
	SBC $FC45,Y		  ; F9 45 FC | Subtract with carry (absolute,Y)
	ADC #$46			 ; 69 46 | Add with carry (immediate)
	LDA $FC46,Y		  ; B9 46 FC | Read graphics status
	ASL $47			  ; 06 47 | Arithmetic shift left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA $FC48,X		  ; 1D 48 FC | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_045
; Address: $CEA612
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_045:
	PHA				  ; 48 | Push accumulator to stack
	EOR #$FC			 ; 49 FC | Exclusive OR with accumulator (immediate)
	STZ $FC49			; 9C 49 FC | Store zero to absolute
	PLY				  ; 7A | Pull Y register from stack
	JMP $03FC			; 4C FC 03 | Jump to address
	SBC $FC4C,Y		  ; F9 4C FC | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $03FC			; 4D FC 03 | Exclusive OR with accumulator (absolute)
	EOR $03FC			; 4D FC 03 | Exclusive OR with accumulator (absolute)
	LSR $03FC			; 4E FC 03 | Logical shift right (absolute)
	LSR $03FC			; 4E FC 03 | Logical shift right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	BVC $FC			  ; 50 FC | Branch if overflow clear
	ORA ($D1,X)		  ; 01 D1 | Logical OR with accumulator ((zero page,X))
	BVC $FC			  ; 50 FC | Branch if overflow clear
	LDA $51			  ; A5 51 | Read graphics status
	EOR ($54,X)		  ; 41 54 | Exclusive OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	CPY $54			  ; C4 54 | Compare Y register (zero page)
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	AND $FC56,X		  ; 3D 56 FC | Logical AND with accumulator (absolute,X)
	CMP $FC56,Y		  ; D9 56 FC | Compare accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	STA $FC59			; 8D 59 FC | Update graphics data
	EOR $03FC,Y		  ; 59 FC 03 | Exclusive OR with accumulator (absolute,Y)
	ORA ($5A,X)		  ; 01 5A | Logical OR with accumulator ((zero page,X))
	EOR ($5A,X)		  ; 41 5A | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	SBC $FC5A,Y		  ; F9 5A FC | Subtract with carry (absolute,Y)
	STX $5B			  ; 86 5B | Store X register to zero page
	LDY $FC5B,X		  ; BC 5B FC | Load from absolute,X into Y register
	SBC #$5B			 ; E9 5B | Subtract with carry (immediate)
	AND $FC5C,X		  ; 3D 5C FC | Logical AND with accumulator (absolute,X)
	AND $FC5C,X		  ; 3D 5C FC | Logical AND with accumulator (absolute,X)
	LDA $FC5C,X		  ; BD 5C FC | Read graphics status
	ASL $FC5D			; 0E 5D FC | Arithmetic shift left (absolute)
	ADC $FC5D,Y		  ; 79 5D FC | Add with carry (absolute,Y)
	EOR $03FC,X		  ; 5D FC 03 | Exclusive OR with accumulator (absolute,X)
	LSR $03FC,X		  ; 5E FC 03 | Logical shift right (absolute,X)
	ROR $FC5E,X		  ; 7E 5E FC | Rotate right (absolute,X)
	LDA $FC5E,Y		  ; B9 5E FC | Read graphics status
	LSR $03FC,X		  ; 5E FC 03 | Logical shift right (absolute,X)
	AND $FC5F,Y		  ; 39 5F FC | Logical AND with accumulator (absolute,Y)
	LDX $FC5F,Y		  ; BE 5F FC | Load from absolute,Y into X register
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	ADC ($FC,X)		  ; 61 FC | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_046
; Address: $CEA6F1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_046:
	ROL $FC62			; 2E 62 FC | Rotate left (absolute)
	LDY $FC62			; AC 62 FC | Load from absolute address into Y register
	ORA $93			  ; 05 93 | Logical OR with accumulator (zero page)
	STZ $FC			  ; 64 FC | Store zero to zero page
	STZ $FC			  ; 64 FC | Store zero to zero page
	STZ $FC			  ; 64 FC | Store zero to zero page
	STZ $65			  ; 64 65 | Store zero to zero page
	CLV				  ; B8 | Clear overflow flag
	ADC $FC			  ; 65 FC | Add with carry (zero page)
	ROR $FC			  ; 66 FC | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $FC			  ; 66 FC | Rotate right (zero page)
	CMP $FC66,Y		  ; D9 66 FC | Compare accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_047
; Address: $CEA741
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_047:
	JSL $03FC69		  ; 22 69 FC 03 | Jump to subroutine long
	ADC #$FC			 ; 69 FC | Add with carry (immediate)
	LDA ($69),Y		  ; B1 69 | Read graphics status
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $FC6A,X		  ; 5D 6A FC | Exclusive OR with accumulator (absolute,X)
	ASL $6B			  ; 06 6B | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_048
; Address: $CEA75E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_048:
	JMP ($03FC)		  ; 6C FC 03 | Jump to address (absolute indirect)
	PLB				  ; AB | Pull data bank register from stack
	JMP ($03FC)		  ; 6C FC 03 | Jump to address (absolute indirect)
	JMP ($05FC)		  ; 6C FC 05 | Jump to address (absolute indirect)
	ADC $03FC			; 6D FC 03 | Add with carry (absolute)
	STA $FC6D			; 8D 6D FC | Update graphics data
	ORA $FC6E			; 0D 6E FC | Logical OR with accumulator (absolute)
	STY $FC6E			; 8C 6E FC | Store Y register to absolute address
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	BVS $FC			  ; 70 FC | Branch if overflow set
	BVS $FC			  ; 70 FC | Branch if overflow set
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($FC),Y		  ; 71 FC | Add with carry ((zero page),Y)
	ORA $C4			  ; 05 C4 | Logical OR with accumulator (zero page)
	ADC ($FC),Y		  ; 71 FC | Add with carry ((zero page),Y)
	ADC ($FC),Y		  ; 71 FC | Add with carry ((zero page),Y)
	AND ($72,X)		  ; 21 72 | Logical AND with accumulator ((zero page,X))
	SBC ($72,X)		  ; E1 72 | Subtract with carry ((zero page,X))
	ORA $4D			  ; 05 4D | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	LDX #$74			 ; A2 74 | Load immediate value into X register
	CMP #$74			 ; C9 74 | Compare accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	ADC $FC75,Y		  ; 79 75 FC | Add with carry (absolute,Y)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_049
; Address: $CEA7D5
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_049:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$76			 ; C2 76 | Reset processor status bits
	STZ $77			  ; 64 77 | Store zero to zero page
	CPY $77			  ; C4 77 | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROR $78			  ; 66 78 | Rotate right (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($78),Y		  ; F1 78 | Subtract with carry ((zero page),Y)
	ADC $03FC,Y		  ; 79 FC 03 | Add with carry (absolute,Y)
	ADC $03FC,Y		  ; 79 FC 03 | Add with carry (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $03FC,Y		  ; 79 FC 03 | Add with carry (absolute,Y)
	ORA ($7A),Y		  ; 11 7A | Logical OR with accumulator ((zero page),Y)
	ROR $7A			  ; 66 7A | Rotate right (zero page)
	LDA $FC7A,X		  ; BD 7A FC | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$7C			 ; 29 7C | Logical AND with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	STA				  ; 9F 7C FC 03 | Update graphics data
	ADC $03FC,X		  ; 7D FC 03 | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $03FC,X		  ; 7D FC 03 | Add with carry (absolute,X)
	SBC $FC7D,X		  ; FD 7D FC | Subtract with carry (absolute,X)
	ROR $03FC,X		  ; 7E FC 03 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	ROR $03FC,X		  ; 7E FC 03 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	BRA $FC			  ; 80 FC | Branch always
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BRA $FC			  ; 80 FC | Branch always
	ADC $FC81,Y		  ; 79 81 FC | Add with carry (absolute,Y)
	LDA #$81			 ; A9 81 | Read graphics status
	CMP $FC81,Y		  ; D9 81 FC | Compare accumulator (absolute,Y)
	ORA #$82			 ; 09 82 | Logical OR with accumulator (immediate)
	ADC $82			  ; 65 82 | Add with carry (zero page)
	STZ $FC82,X		  ; 9E 82 FC | Store zero to absolute,X
	CPY $82			  ; C4 82 | Compare Y register (zero page)
	ORA $FC83,Y		  ; 19 83 FC | Logical OR with accumulator (absolute,Y)
	ROR $FC83			; 6E 83 FC | Rotate right (absolute)
	DEC $83			  ; C6 83 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	STY $FC			  ; 84 FC | Store Y register to zero page
	LSR $FC84,X		  ; 5E 84 FC | Logical shift right (absolute,X)
	STZ $FC84			; 9C 84 FC | Store zero to absolute
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	STA $FC			  ; 85 FC | Update graphics data
	STA $FC			  ; 85 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_04A
; Address: $CEA8A2
; Size: 119 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_04A:
	STX $FC			  ; 86 FC | Store X register to zero page
	TAX				  ; AA | Transfer accumulator to X register
	STX $FC			  ; 86 FC | Store X register to zero page
	STX $FC			  ; 86 FC | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BIT #$87			 ; 89 87 | Test bits in accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	AND $FC88,X		  ; 3D 88 FC | Logical AND with accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CMP $FC88			; CD 88 FC | Compare accumulator (absolute)
	INC $FC88,X		  ; FE 88 FC | Increment (absolute,X)
	BIT #$FC			 ; 89 FC | Test bits in accumulator (immediate)
	STY $FC89			; 8C 89 FC | Store Y register to absolute address
	BIT #$FC			 ; 89 FC | Test bits in accumulator (immediate)
	NOP				  ; EA | No operation
	BIT #$FC			 ; 89 FC | Test bits in accumulator (immediate)
	STA $8A			  ; 85 8A | Update graphics data
	LDA $FC8A,Y		  ; B9 8A FC | Read graphics status
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $FC8B,X		  ; 1D 8B FC | Logical OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	CMP $FC8B,Y		  ; D9 8B FC | Compare accumulator (absolute,Y)
	ASL $FC8C			; 0E 8C FC | Arithmetic shift left (absolute)
	STY $03FC			; 8C FC 03 | Store Y register to absolute address
	STA $FC8C,X		  ; 9D 8C FC | Update graphics data
	STY $03FC			; 8C FC 03 | Store Y register to absolute address
	PHY				  ; 5A | Push Y register to stack
	STA $03FC			; 8D FC 03 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $03FC			; 8D FC 03 | Update graphics data
	REP #$8D			 ; C2 8D | Reset processor status bits
	STA $03FC			; 8D FC 03 | Update graphics data
	STX $03FC			; 8E FC 03 | Store X register to absolute address
	STX $03FC			; 8E FC 03 | Store X register to absolute address
	STA ($8E),Y		  ; 91 8E | Update graphics data
	STX $05FC			; 8E FC 05 | Store X register to absolute address
	STX $03FC			; 8E FC 03 | Store X register to absolute address
	STA $4903FC		  ; 8F FC 03 49 | Update graphics data
	STA $6D03FC		  ; 8F FC 03 6D | Update graphics data
	STA $AB03FC		  ; 8F FC 03 AB | Update graphics data
	STA $ED03FC		  ; 8F FC 03 ED | Update graphics data
	STA $2D03FC		  ; 8F FC 03 2D | Update graphics data
	BCC $FC			  ; 90 FC | Branch if carry clear
	BRA $90			  ; 80 90 | Branch always
	CMP ($90,X)		  ; C1 90 | Compare accumulator ((zero page,X))
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	BCC $FC			  ; 90 FC | Branch if carry clear
	LDA $FC91			; AD 91 FC | Read graphics status
	STA ($FC),Y		  ; 91 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_04B
; Address: $CEA959
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_04B:
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR $FC95,X		  ; 5D 95 FC | Exclusive OR with accumulator (absolute,X)
	EOR ($96),Y		  ; 51 96 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($D5,X)		  ; 01 D5 | Logical OR with accumulator ((zero page,X))
	ADC $98			  ; 65 98 | Add with carry (zero page)
	DEC $98			  ; C6 98 | Decrement (zero page)
	SBC $FC98,X		  ; FD 98 FC | Subtract with carry (absolute,X)
	STA $FC99,X		  ; 9D 99 FC | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $FC9A			; 6E 9A FC | Rotate right (absolute)
	ORA ($A7,X)		  ; 01 A7 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $7D			  ; 05 7D | Logical OR with accumulator (zero page)
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	STZ $05FC			; 9C FC 05 | Store zero to absolute
	STZ $03FC			; 9C FC 03 | Store zero to absolute
	STZ $03FC			; 9C FC 03 | Store zero to absolute
	STA $05FC,X		  ; 9D FC 05 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_04C
; Address: $CEA9AE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_04C:
	STA $03FC,X		  ; 9D FC 03 | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	STA $03FC,X		  ; 9D FC 03 | Update graphics data
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	ORA $000D,Y		  ; 19 0D 00 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ASL $1B00			; 0E 00 1B | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0011,X		  ; 1D 11 00 | Logical OR with accumulator (absolute,X)
	ASL $0012,X		  ; 1E 12 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_04E
; Address: $CEA9D8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_04E:
	JSL $230016		  ; 22 16 00 23 | Jump to subroutine long
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	AND $19			  ; 25 19 | Logical AND with accumulator (zero page)
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$1D			 ; 29 1D | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $2B00,X		  ; 1E 00 2B | Arithmetic shift left (absolute,X)
	BIT $0020			; 2C 20 00 | Test bits in accumulator (absolute)
	AND $0021			; 2D 21 00 | Logical AND with accumulator (absolute)
	ROL $0022			; 2E 22 00 | Rotate left (absolute)
	BMI $24			  ; 30 24 | Branch if negative
	AND ($25),Y		  ; 31 25 | Logical AND with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_04F
; Address: $CEAA1B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_04F:
	BIT $3900			; 2C 00 39 | Test bits in accumulator (absolute)
	AND $3A00			; 2D 00 3A | Logical AND with accumulator (absolute)
	ROL $3B00			; 2E 00 3B | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND $0031,X		  ; 3D 31 00 | Logical AND with accumulator (absolute,X)
	ROL $0032,X		  ; 3E 32 00 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	WDM #$36			 ; 42 36 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	EOR $39			  ; 45 39 | Exclusive OR with accumulator (zero page)
	LSR $C9			  ; 46 C9 | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	PHA				  ; 48 | Push accumulator to stack
	EOR #$CC			 ; 49 CC | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $4B00			; CD 00 4B | Compare accumulator (absolute)
	DEC $4C00			; CE 00 4C | Decrement (absolute)
	EOR $00D0			; 4D D0 00 | Exclusive OR with accumulator (absolute)
	LSR $00D1			; 4E D1 00 | Logical shift right (absolute)
	BVC $D3			  ; 50 D3 | Branch if overflow clear
	EOR ($D4),Y		  ; 51 D4 | Exclusive OR with accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $5700,Y		  ; D9 00 57 | Compare accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $00DC,Y		  ; 59 DC 00 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	JMP $5D00F4		  ; 5C F4 00 5D | Jump to address long
	LSR $00F6,X		  ; 5E F6 00 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_050
; Address: $CEAA94
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_050:
	AND $1261,X		  ; 3D 61 12 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($63,X)		  ; 41 63 | Exclusive OR with accumulator ((zero page,X))
	WDM #$64			 ; 42 64 | Reserved instruction
	DEX				  ; CA | Decrement X register
	ADC $CA			  ; 65 CA | Add with carry (zero page)
	AND $CA66,X		  ; 3D 66 CA | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register
	EOR ($68,X)		  ; 41 68 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	WDM #$69			 ; 42 69 | Reserved instruction
	ROR				  ; 6A | Rotate right (accumulator)
	AND $176B,X		  ; 3D 6B 17 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	JMP ($4117)		  ; 6C 17 41 | Jump to address (absolute indirect)
	ADC $4217			; 6D 17 42 | Hardware register operation
	ROR $3BCF			; 6E CF 3B | Rotate right (absolute)
	AND $CF70,X		  ; 3D 70 CF | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_051
; Address: $CEAAC4
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_051:
	RTI				  ; 40 | Return from interrupt
	ADC ($CF),Y		  ; 71 CF | Add with carry ((zero page),Y)
	EOR ($72,X)		  ; 41 72 | Exclusive OR with accumulator ((zero page,X))
	WDM #$73			 ; 42 73 | Reserved instruction
	AND $1C75,X		  ; 3D 75 1C | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($77,X)		  ; 41 77 | Exclusive OR with accumulator ((zero page,X))
	WDM #$78			 ; 42 78 | Reserved instruction
	ORA $793D,X		  ; 1D 3D 79 | Logical OR with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	AND $D47B,X		  ; 3D 7B D4 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($7D,X)		  ; 41 7D | Exclusive OR with accumulator ((zero page,X))
	WDM #$7E			 ; 42 7E | Reserved instruction
	AND ($3B,X)		  ; 21 3B | Logical AND with accumulator ((zero page,X))
	AND ($3D,X)		  ; 21 3D | Logical AND with accumulator ((zero page,X))
	BRA $21			  ; 80 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	STA ($21,X)		  ; 81 21 | PPU graphics register access
	EOR ($82,X)		  ; 41 82 | Exclusive OR with accumulator ((zero page,X))
	AND ($42,X)		  ; 21 42 | Hardware register operation
	ROL $3B			  ; 26 3B | Rotate left (zero page)
	STY $26			  ; 84 26 | Store Y register to zero page
	AND $2685,X		  ; 3D 85 26 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STX $26			  ; 86 26 | Store X register to zero page
	EOR ($87,X)		  ; 41 87 | Exclusive OR with accumulator ((zero page,X))
	ROL $42			  ; 26 42 | Hardware register operation
	DEY				  ; 88 | Decrement Y register
	CMP $893B,Y		  ; D9 3B 89 | Compare accumulator (absolute,Y)
	CMP $8A3D,Y		  ; D9 3D 8A | Compare accumulator (absolute,Y)
	CMP $8B40,Y		  ; D9 40 8B | Compare accumulator (absolute,Y)
	CMP $8C41,Y		  ; D9 41 8C | Compare accumulator (absolute,Y)
	CMP $8D42,Y		  ; D9 42 8D | Compare accumulator (absolute,Y)
	STX $3DF3			; 8E F3 3D | Store X register to absolute address
	STA $9040F3		  ; 8F F3 40 90 | Update graphics data
	EOR ($91,X)		  ; 41 91 | Exclusive OR with accumulator ((zero page,X))
	WDM #$92			 ; 42 92 | Reserved instruction
	AND $2B94,X		  ; 3D 94 2B | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($96,X)		  ; 41 96 | Exclusive OR with accumulator ((zero page,X))
	WDM #$97			 ; 42 97 | Reserved instruction
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $3399,X		  ; 3D 99 33 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	EOR ($9B,X)		  ; 41 9B | Exclusive OR with accumulator ((zero page,X))
	WDM #$9C			 ; 42 9C | Reserved instruction
	ORA $0044,Y		  ; 19 44 00 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_052
; Address: $CEAB4D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_052:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA $0048,X		  ; 1D 48 00 | Logical OR with accumulator (absolute,X)
	ASL $0049,X		  ; 1E 49 00 | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_054
; Address: $CEAB64
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_054:
	JSL $23004D		  ; 22 4D 00 23 | Jump to subroutine long
	LSR $2400			; 4E 00 24 | Logical shift right (absolute)
	AND $50			  ; 25 50 | Logical AND with accumulator (zero page)
	ROL $51			  ; 26 51 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$54			 ; 29 54 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $0057			; 2C 57 00 | Test bits in accumulator (absolute)
	AND $0058			; 2D 58 00 | Logical AND with accumulator (absolute)
	ROL $0059			; 2E 59 00 | Rotate left (absolute)
	PHY				  ; 5A | Push Y register to stack
	BMI $5B			  ; 30 5B | Branch if negative
	AND ($5C),Y		  ; 31 5C | Logical AND with accumulator ((zero page),Y)
	EOR $3300,X		  ; 5D 00 33 | Exclusive OR with accumulator (absolute,X)
	LSR $3400,X		  ; 5E 00 34 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_055
; Address: $CEABA1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_055:
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	AND $0064,Y		  ; 39 64 00 | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	AND $0068,X		  ; 3D 68 00 | Logical AND with accumulator (absolute,X)
	ROL $0069,X		  ; 3E 69 00 | Rotate left (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_056
; Address: $CEABC1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_056:
	EOR ($6C,X)		  ; 41 6C | Exclusive OR with accumulator ((zero page,X))
	WDM #$6D			 ; 42 6D | Reserved instruction
	ROR $4400			; 6E 00 44 | Rotate right (absolute)
	EOR $70			  ; 45 70 | Exclusive OR with accumulator (zero page)
	LSR $DE			  ; 46 DE | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	EOR #$E1			 ; 49 E1 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$00			 ; E2 00 | Set processor status bits
	JMP $00E4			; 4C E4 00 | Jump to address
	EOR $00E5			; 4D E5 00 | Exclusive OR with accumulator (absolute)
	LSR $00E6			; 4E E6 00 | Logical shift right (absolute)
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	EOR ($E9),Y		  ; 51 E9 | Exclusive OR with accumulator ((zero page),Y)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_057
; Address: $CEABF8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_057:
	XBA				  ; EB | Exchange accumulator bytes
	CPX $5500			; EC 00 55 | Compare X register (absolute)
	SBC $5600			; ED 00 56 | Subtract with carry (absolute)
	INC $5700			; EE 00 57 | Increment (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	EOR $00F1,Y		  ; 59 F1 00 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	SED				  ; F8 | Set decimal mode flag
	JMP $5D00F9		  ; 5C F9 00 5D | Jump to address long
	PLX				  ; FA | Pull X register from stack
	LSR $00FB,X		  ; 5E FB 00 | Logical shift right (absolute,X)
	EOR #$72			 ; 49 72 | Exclusive OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_058
; Address: $CEAC1F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_058:
	EOR #$74			 ; 49 74 | Exclusive OR with accumulator (immediate)
	ADC ($49,X)		  ; 61 49 | Add with carry ((zero page,X))
	EOR #$78			 ; 49 78 | Exclusive OR with accumulator (immediate)
	EOR #$79			 ; 49 79 | Exclusive OR with accumulator (immediate)
	STZ $DF			  ; 64 DF | Store zero to zero page
	ADC $DF			  ; 65 DF | Add with carry (zero page)
	ROR $DF			  ; 66 DF | Rotate right (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	ADC $4E69,Y		  ; 79 69 4E | Add with carry (absolute,Y)
	ROR				  ; 6A | Rotate right (accumulator)
	LSR $6B74			; 4E 74 6B | Logical shift right (absolute)
	LSR $6C77			; 4E 77 6C | Logical shift right (absolute)
	LSR $6D78			; 4E 78 6D | Logical shift right (absolute)
	LSR $6E79			; 4E 79 6E | Logical shift right (absolute)
	CPX $72			  ; E4 72 | Compare X register (zero page)
	CPX $74			  ; E4 74 | Compare X register (zero page)
	BVS $E4			  ; 70 E4 | Branch if overflow set
	ADC ($E4),Y		  ; 71 E4 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $79			  ; E4 79 | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $5478,Y		  ; 79 78 54 | Add with carry (absolute,Y)
	ADC $72E9,Y		  ; 79 E9 72 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	SBC #$74			 ; E9 74 | Subtract with carry (immediate)
	SBC #$77			 ; E9 77 | Subtract with carry (immediate)
	SBC #$78			 ; E9 78 | Subtract with carry (immediate)
	ADC $79E9,X		  ; 7D E9 79 | Add with carry (absolute,X)
	ROR $7258,X		  ; 7E 58 72 | Rotate right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $58			  ; 80 58 | Branch always
	STA ($58,X)		  ; 81 58 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $5D83,Y		  ; 79 83 5D | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_059
; Address: $CEAC8A
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_059:
	STY $5D			  ; 84 5D | Store Y register to zero page
	STA $5D			  ; 85 5D | Update graphics data
	STX $5D			  ; 86 5D | Store X register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	EOR $8879,X		  ; 5D 79 88 | Exclusive OR with accumulator (absolute,X)
	INC $8972			; EE 72 89 | Increment (absolute)
	INC $8A74			; EE 74 8A | Increment (absolute)
	INC $8B77			; EE 77 8B | Increment (absolute)
	INC $8C78			; EE 78 8C | Increment (absolute)
	INC $8D79			; EE 79 8D | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	STX $74F8			; 8E F8 74 | Store X register to absolute address
	STA $9077F8		  ; 8F F8 77 90 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STA ($F8),Y		  ; 91 F8 | Update graphics data
	ADC $6292,Y		  ; 79 92 62 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $6A97,Y		  ; 79 97 6A | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	STA $776A,Y		  ; 99 6A 77 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $849C,Y		  ; 79 9C 84 | Add with carry (absolute,Y)
	STA $0086,X		  ; 9D 86 00 | Update graphics data
	STZ $007E,X		  ; 9E 7E 00 | Store zero to absolute,X
	STA				  ; 9F 7F 00 A0 | Update graphics data
	ADC $A100,X		  ; 7D 00 A1 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$3A			 ; A2 3A | Load immediate value into X register
	ORA $003B,Y		  ; 19 3B 00 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	AND $1C00,X		  ; 3D 00 1C | Logical AND with accumulator (absolute,X)
	ROL $1D00,X		  ; 3E 00 1D | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND $0042,X		  ; 3D 42 00 | Logical AND with accumulator (absolute,X)
	ROL $003F,X		  ; 3E 3F 00 | Rotate left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA $0072,Y		  ; 19 72 00 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ORA $0077,X		  ; 1D 77 00 | Logical OR with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	AND $0079,X		  ; 3D 79 00 | Logical AND with accumulator (absolute,X)
	ROL $0076,X		  ; 3E 76 00 | Rotate left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05A
; Address: $CEAD1C
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05A:
	CLV				  ; B8 | Clear overflow flag
	AND #$BB			 ; 29 BB | Logical AND with accumulator (immediate)
	AND #$BE			 ; 29 BE | Logical AND with accumulator (immediate)
	AND #$C1			 ; 29 C1 | Logical AND with accumulator (immediate)
	AND #$C4			 ; 29 C4 | Logical AND with accumulator (immediate)
	AND #$C7			 ; 29 C7 | Logical AND with accumulator (immediate)
	AND #$CA			 ; 29 CA | Logical AND with accumulator (immediate)
	AND #$CD			 ; 29 CD | Logical AND with accumulator (immediate)
	AND #$D0			 ; 29 D0 | Logical AND with accumulator (immediate)
	AND #$D3			 ; 29 D3 | Logical AND with accumulator (immediate)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	AND #$D9			 ; 29 D9 | Logical AND with accumulator (immediate)
	AND #$DC			 ; 29 DC | Logical AND with accumulator (immediate)
	AND #$DF			 ; 29 DF | Logical AND with accumulator (immediate)
	AND #$E2			 ; 29 E2 | Logical AND with accumulator (immediate)
	AND #$E5			 ; 29 E5 | Logical AND with accumulator (immediate)
	AND #$E8			 ; 29 E8 | Logical AND with accumulator (immediate)
	AND #$EB			 ; 29 EB | Logical AND with accumulator (immediate)
	AND #$EE			 ; 29 EE | Logical AND with accumulator (immediate)
	AND #$F1			 ; 29 F1 | Logical AND with accumulator (immediate)
	AND #$F4			 ; 29 F4 | Logical AND with accumulator (immediate)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	AND #$FA			 ; 29 FA | Logical AND with accumulator (immediate)
	AND #$FD			 ; 29 FD | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $212A,X		  ; 1E 2A 21 | PPU graphics register access
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2A			  ; 24 2A | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $302A			; 2D 2A 30 | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3C2A,Y		  ; 39 2A 3C | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$2A			 ; 42 2A | Reserved instruction

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05B
; Address: $CEAD7A
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05B:
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $512A			; 4E 2A 51 | Logical shift right (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $602A,X		  ; 5D 2A 60 | Exclusive OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $2A			  ; 66 2A | Rotate right (zero page)
	ADC #$2A			 ; 69 2A | Add with carry (immediate)
	JMP ($6F2A)		  ; 6C 2A 6F | Jump to address (absolute indirect)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $812A,X		  ; 7E 2A 81 | Rotate right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	STY $2A			  ; 84 2A | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	STA $902A			; 8D 2A 90 | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	STA $9C2A,Y		  ; 99 2A 9C | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	STA				  ; 9F 2A A2 2A | Update graphics data
	LDA $2A			  ; A5 2A | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $B12A			; AE 2A B1 | Load from absolute address into X register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $C02A,X		  ; BD 2A C0 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	DEC $2A			  ; C6 2A | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05C
; Address: $CEADD2
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05C:
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	CPY $CF2A			; CC 2A CF | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	DEC $E12A,X		  ; DE 2A E1 | Decrement (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $2A			  ; E4 2A | Compare X register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	NOP				  ; EA | No operation
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $F02A			; ED 2A F0 | Subtract with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $FC2A,Y		  ; F9 2A FC | Subtract with carry (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $2B			  ; 05 2B | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $112B			; 0E 2B 11 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $202B,X		  ; 1D 2B 20 | Logical OR with accumulator (absolute,X)
	ROL $2B			  ; 26 2B | Rotate left (zero page)
	AND #$2B			 ; 29 2B | Logical AND with accumulator (immediate)
	BIT $2F2B			; 2C 2B 2F | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	ROL $412B,X		  ; 3E 2B 41 | Rotate left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $502B			; 4D 2B 50 | Exclusive OR with accumulator (absolute)
	EOR $5C2B,Y		  ; 59 2B 5C | Exclusive OR with accumulator (absolute,Y)
	ADC $2B			  ; 65 2B | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05D
; Address: $CEAE40
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05D:
	ROR $712B			; 6E 2B 71 | Rotate right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ADC $802B,X		  ; 7D 2B 80 | Add with carry (absolute,X)
	STX $2B			  ; 86 2B | Store X register to zero page
	BIT #$2B			 ; 89 2B | Test bits in accumulator (immediate)
	STY $8F2B			; 8C 2B 8F | Store Y register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $A12B,X		  ; 9E 2B A1 | Store zero to absolute,X
	LDY $2B			  ; A4 2B | Load from zero page into Y register
	TAX				  ; AA | Transfer accumulator to X register
	LDA $B02B			; AD 2B B0 | Read graphics status
	LDA $BC2B,Y		  ; B9 2B BC | Read graphics status
	LDA				  ; BF 2B C2 2B | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05E
; Address: $CEAE7A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05E:
	CMP $2B			  ; C5 2B | Compare accumulator (zero page)
	INY				  ; C8 | Increment Y register
	DEC $D12B			; CE 2B D1 | Decrement (absolute)
	PHX				  ; DA | Push X register to stack
	CMP $E02B,X		  ; DD 2B E0 | Game work RAM access
	INC $2B			  ; E6 2B | Increment (zero page)
	SBC #$2B			 ; E9 2B | Subtract with carry (immediate)
	CPX $EF2B			; EC 2B EF | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	INC $012B,X		  ; FE 2B 01 | Increment (absolute,X)
	BIT $2C04			; 2C 04 2C | Test bits in accumulator (absolute)
	BIT $2C0A			; 2C 0A 2C | Test bits in accumulator (absolute)
	ORA $102C			; 0D 2C 10 | Logical OR with accumulator (absolute)
	BIT $2C13			; 2C 13 2C | Test bits in accumulator (absolute)
	BIT $2C19			; 2C 19 2C | Test bits in accumulator (absolute)
	BIT $2C1F			; 2C 1F 2C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_05F
; Address: $CEAEB8
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_05F:
	JSL $2C252C		  ; 22 2C 25 2C | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BIT $2C2B			; 2C 2B 2C | Test bits in accumulator (absolute)
	ROL $312C			; 2E 2C 31 | Rotate left (absolute)
	BIT $2C34			; 2C 34 2C | Test bits in accumulator (absolute)
	BIT $2C3A			; 2C 3A 2C | Test bits in accumulator (absolute)
	AND $402C,X		  ; 3D 2C 40 | Logical AND with accumulator (absolute,X)
	BIT $2C43			; 2C 43 2C | Test bits in accumulator (absolute)
	LSR $2C			  ; 46 2C | Logical shift right (zero page)
	EOR #$2C			 ; 49 2C | Exclusive OR with accumulator (immediate)
	JMP $4F2C			; 4C 2C 4F | Jump to address
	BIT $2C52			; 2C 52 2C | Test bits in accumulator (absolute)
	BIT $2C58			; 2C 58 2C | Test bits in accumulator (absolute)
	BIT $2C5E			; 2C 5E 2C | Test bits in accumulator (absolute)
	ADC ($2C,X)		  ; 61 2C | Add with carry ((zero page,X))
	STZ $2C			  ; 64 2C | Store zero to zero page
	BIT $2C6A			; 2C 6A 2C | Test bits in accumulator (absolute)
	ADC $702C			; 6D 2C 70 | Add with carry (absolute)
	BIT $2C73			; 2C 73 2C | Test bits in accumulator (absolute)
	BIT $2C79			; 2C 79 2C | Test bits in accumulator (absolute)
	BIT $2C7F			; 2C 7F 2C | Test bits in accumulator (absolute)
	BIT $2C85			; 2C 85 2C | Test bits in accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	BIT $2C8B			; 2C 8B 2C | Test bits in accumulator (absolute)
	STX $912C			; 8E 2C 91 | Store X register to absolute address
	BIT $2C94			; 2C 94 2C | Test bits in accumulator (absolute)
	BIT $2C9A			; 2C 9A 2C | Test bits in accumulator (absolute)
	STA $A02C,X		  ; 9D 2C A0 | Update graphics data
	BIT $2CA3			; 2C A3 2C | Test bits in accumulator (absolute)
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA #$2C			 ; A9 2C | Read graphics status
	LDY $AF2C			; AC 2C AF | Load from absolute address into Y register
	BIT $2CB2			; 2C B2 2C | Test bits in accumulator (absolute)
	BIT $2CB8			; 2C B8 2C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_060
; Address: $CEAF1F
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_060:
	BIT $2CBE			; 2C BE 2C | Test bits in accumulator (absolute)
	CMP ($2C,X)		  ; C1 2C | Compare accumulator ((zero page,X))
	CPY $2C			  ; C4 2C | Compare Y register (zero page)
	BIT $2CCA			; 2C CA 2C | Test bits in accumulator (absolute)
	CMP $D02C			; CD 2C D0 | Compare accumulator (absolute)
	BIT $2CD3			; 2C D3 2C | Test bits in accumulator (absolute)
	BIT $2CD9			; 2C D9 2C | Test bits in accumulator (absolute)
	BIT $2CDF			; 2C DF 2C | Test bits in accumulator (absolute)
	SEP #$2C			 ; E2 2C | Set processor status bits
	SBC $2C			  ; E5 2C | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	BIT $2CEB			; 2C EB 2C | Test bits in accumulator (absolute)
	INC $F12C			; EE 2C F1 | Increment (absolute)
	BIT $2CF4			; 2C F4 2C | Test bits in accumulator (absolute)
	BIT $2CFA			; 2C FA 2C | Test bits in accumulator (absolute)
	SBC $002C,X		  ; FD 2C 00 | Subtract with carry (absolute,X)
	AND $2D03			; 2D 03 2D | Logical AND with accumulator (absolute)
	ASL $2D			  ; 06 2D | Arithmetic shift left (zero page)
	ORA #$2D			 ; 09 2D | Logical OR with accumulator (immediate)
	AND $2D0F			; 2D 0F 2D | Logical AND with accumulator (absolute)
	AND $2D15			; 2D 15 2D | Logical AND with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $AFCD			; 2D CD AF | Logical AND with accumulator (absolute)
	STA $0ED0,Y		  ; 99 D0 0E | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_061
; Address: $CEAF66
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_061:
	JSL $C73023		  ; 22 23 30 C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	BCS $02			  ; B0 02 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_06C
; Address: $CEAF97
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_06C:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDA $6B6899		  ; AF 99 68 6B | Read graphics status
	LDX $C0FB			; AE FB C0 | Load from absolute address into X register
	BNE $09			  ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_071
; Address: $CEAFC9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_071:
	LDY $C0FB			; AC FB C0 | Load from absolute address into Y register
	BNE $0B			  ; D0 0B | Branch if not equal
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_087
; Address: $CEB026
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_087:
	JSL $C1D97A		  ; 22 7A D9 C1 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_090
; Address: $CEB04E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_090:
	JSL $C1D97A		  ; 22 7A D9 C1 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_099
; Address: $CEB076
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_099:
	JSL $C1D97A		  ; 22 7A D9 C1 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0A6
; Address: $CEB0AD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0A6:
	JSL $C1D97A		  ; 22 7A D9 C1 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0AA
; Address: $CEB0C2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0AA:
	LDA $C0DF			; AD DF C0 | Read graphics status
	STA $9850			; 8D 50 98 | Update graphics data
	LDA $C0E1			; AD E1 C0 | Read graphics status
	STA $9852			; 8D 52 98 | Update graphics data
	LDA $C0E3			; AD E3 C0 | Read graphics status
	STA $9854			; 8D 54 98 | Update graphics data
	LDA $C0E5			; AD E5 C0 | Read graphics status
	STA $9856			; 8D 56 98 | Update graphics data
	LDA $C0E7			; AD E7 C0 | Read graphics status
	STA $985C			; 8D 5C 98 | Update graphics data
	LDA $C0E9			; AD E9 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0AB
; Address: $CEB0E3
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0AB:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9860			; 8D 60 98 | Update graphics data
	STZ $985E			; 9C 5E 98 | Store zero to absolute
	JMP $C600AB		  ; 5C AB 00 C6 | Jump to address long
	LDA $C0EB			; AD EB C0 | Read graphics status
	BMI $2C			  ; 30 2C | Branch if negative
	STA $9850			; 8D 50 98 | Update graphics data
	LDA $C0ED			; AD ED C0 | Read graphics status
	STA $9852			; 8D 52 98 | Update graphics data
	LDA $C0EF			; AD EF C0 | Read graphics status
	STA $9854			; 8D 54 98 | Update graphics data
	LDA $C0F1			; AD F1 C0 | Read graphics status
	STA $9856			; 8D 56 98 | Update graphics data
	LDA $C0F3			; AD F3 C0 | Read graphics status
	STA $985C			; 8D 5C 98 | Update graphics data
	LDA $C0F5			; AD F5 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0AC
; Address: $CEB114
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0AC:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9860			; 8D 60 98 | Update graphics data
	STZ $985E			; 9C 5E 98 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0AE
; Address: $CEB123
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0AE:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C0EB			; 8D EB C0 | Update graphics data
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	BMI $2F			  ; 30 2F | Branch if negative
	LDA $99F9			; AD F9 99 | Read graphics status
	STA $C0EB			; 8D EB C0 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0AF
; Address: $CEB134
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0AF:
	JSL $C75575		  ; 22 75 55 C7 | Jump to subroutine long
	LDA $C129			; AD 29 C1 | Read graphics status
	STA $C0ED			; 8D ED C0 | Update graphics data
	LDA $C12B			; AD 2B C1 | Read graphics status
	STA $C0EF			; 8D EF C0 | Update graphics data
	LDA $C7A5,Y		  ; B9 A5 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C0F1			; 8D F1 C0 | Update graphics data
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C0F3			; 8D F3 C0 | Update graphics data
	LDA $7FFC5A		  ; AF 5A FC 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B0
; Address: $CEB156
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B0:
	JSL $C61F4E		  ; 22 4E 1F C6 | Jump to subroutine long
	STA $C0F5			; 8D F5 C0 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B1
; Address: $CEB15E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B1:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B2
; Address: $CEB166
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B2:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	STA $9850			; 8D 50 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B3
; Address: $CEB178
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $9852			; 8D 52 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B4
; Address: $CEB18A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B4:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	STA $9854			; 8D 54 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B5
; Address: $CEB19C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	STA $9856			; 8D 56 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B6
; Address: $CEB1AE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B8
; Address: $CEB1C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B8:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$07			 ; C0 07 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0B9
; Address: $CEB1CF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0B9:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9860			; 8D 60 98 | Update graphics data
	STZ $985E			; 9C 5E 98 | Store zero to absolute
	STZ $9862			; 9C 62 98 | Store zero to absolute
	JMP $C600AB		  ; 5C AB 00 C6 | Jump to address long
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0BA
; Address: $CEB1E8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0BA:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	LDA $03C8A3		  ; AF A3 C8 03 | Read graphics status
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0BC
; Address: $CEB206
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0BC:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	LDA $05C8A3		  ; AF A3 C8 05 | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$08			 ; A0 08 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0BE
; Address: $CEB224
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0BE:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	LDA $04C8A3		  ; AF A3 C8 04 | Read graphics status
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0BF
; Address: $CEB23D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0BF:
	JSL $C77C10		  ; 22 10 7C C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $DB05			; 8D 05 DB | Update graphics data
	STA $DB03			; 8D 03 DB | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C1
; Address: $CEB252
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C1:
	LDA $02C8A3		  ; AF A3 C8 02 | Read graphics status
	BEQ $1F			  ; F0 1F | Branch if equal
	JMP $C7315E		  ; 5C 5E 31 C7 | Jump to address long
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 7D 32 C7 | Read graphics status
	STA $9850			; 8D 50 98 | Update graphics data
	STZ $9856			; 9C 56 98 | Store zero to absolute
	STZ $985C			; 9C 5C 98 | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C2
; Address: $CEB26F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C2:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9860			; 8D 60 98 | Update graphics data
	STZ $985E			; 9C 5E 98 | Store zero to absolute
	JMP $C600AB		  ; 5C AB 00 C6 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C3
; Address: $CEB281
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C3:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	AND $7E35,X		  ; 3D 35 7E | Logical AND with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	LDA $352E			; AD 2E 35 | Read graphics status
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	JMP $C7315E		  ; 5C 5E 31 C7 | Jump to address long
	JMP $C732A0		  ; 5C A0 32 C7 | Jump to address long
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	BMI $FE			  ; 30 FE | Branch if negative
	LDA $99F9			; AD F9 99 | Read graphics status
	STA $9850			; 8D 50 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C4
; Address: $CEB2AB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C4:
	JSL $C75575		  ; 22 75 55 C7 | Jump to subroutine long
	LDA $C129			; AD 29 C1 | Read graphics status
	STA $9852			; 8D 52 98 | Update graphics data
	LDA $C12B			; AD 2B C1 | Read graphics status
	STA $9854			; 8D 54 98 | Update graphics data
	LDA $C7A5,Y		  ; B9 A5 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $9856			; 8D 56 98 | Update graphics data
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $985C			; 8D 5C 98 | Update graphics data
	LDA $7FFC5A		  ; AF 5A FC 7F | Read graphics status
	STA $9860			; 8D 60 98 | Update graphics data
	STZ $985E			; 9C 5E 98 | Store zero to absolute
	JMP $C600AB		  ; 5C AB 00 C6 | Jump to address long
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C5
; Address: $CEB2D8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $9852			; 8D 52 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C7
; Address: $CEB2EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C7:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	STA $9854			; 8D 54 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C8
; Address: $CEB2FD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C8:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	STA $9856			; 8D 56 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0C9
; Address: $CEB30F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0C9:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	STA $9850			; 8D 50 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0CA
; Address: $CEB321
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0CA:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	CPY #$03			 ; C0 03 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0CB
; Address: $CEB330
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0CB:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9860			; 8D 60 98 | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $985C			; 8D 5C 98 | Update graphics data
	JMP $C600AB		  ; 5C AB 00 C6 | Jump to address long
	CMP $99F7			; CD F7 99 | Compare accumulator (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0CD
; Address: $CEB34A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0CD:
	CMP $99F9			; CD F9 99 | Compare accumulator (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0D4
; Address: $CEB36B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0D4:
	JSL $C42BFD		  ; 22 FD 2B C4 | Jump to subroutine long
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0D6
; Address: $CEB377
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0D6:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0D8
; Address: $CEB37B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0D8:
	JSL $C42B9F		  ; 22 9F 2B C4 | Jump to subroutine long
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0D9
; Address: $CEB387
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0D9:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0DC
; Address: $CEB392
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0DC:
	JSL $C42B9F		  ; 22 9F 2B C4 | Jump to subroutine long
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BNE $07			  ; D0 07 | Branch if not equal
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0DD
; Address: $CEB3A2
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0DD:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0DE
; Address: $CEB3A5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0DE:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $98B3,Y		  ; D9 B3 98 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0DF
; Address: $CEB3B5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0DF:
	PHX				  ; DA | Push X register to stack
	LDA $98C3,Y		  ; B9 C3 98 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E0
; Address: $CEB3C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E0:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $98C7,Y		  ; D9 C7 98 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E2
; Address: $CEB3D5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E2:
	PHX				  ; DA | Push X register to stack
	LDA $98D7,Y		  ; B9 D7 98 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E3
; Address: $CEB3E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E3:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $98DB,Y		  ; D9 DB 98 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E4
; Address: $CEB3F5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E4:
	PHX				  ; DA | Push X register to stack
	LDA $98FB,Y		  ; B9 FB 98 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E5
; Address: $CEB405
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E5:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $9903,Y		  ; D9 03 99 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E6
; Address: $CEB415
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E6:
	PHX				  ; DA | Push X register to stack
	LDA $9933,Y		  ; B9 33 99 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E7
; Address: $CEB425
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E7:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $993F,Y		  ; D9 3F 99 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0E9
; Address: $CEB436
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0E9:
	LDA $994F,Y		  ; B9 4F 99 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0EA
; Address: $CEB445
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0EA:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $9953,Y		  ; D9 53 99 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0EB
; Address: $CEB455
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0EB:
	PHX				  ; DA | Push X register to stack
	LDA $995B,Y		  ; B9 5B 99 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0EC
; Address: $CEB465
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0EC:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $98DB,Y		  ; D9 DB 98 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0ED
; Address: $CEB475
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0ED:
	PHX				  ; DA | Push X register to stack
	LDA $98FB,Y		  ; B9 FB 98 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA				  ; 9F 02 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0EE
; Address: $CEB485
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0EE:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $9903,Y		  ; D9 03 99 | Compare accumulator (absolute,Y)
	BEQ $08			  ; F0 08 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0EF
; Address: $CEB495
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0EF:
	PHX				  ; DA | Push X register to stack
	LDA $9933,Y		  ; B9 33 99 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_0F0
; Address: $CEB49A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_0F0:
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $03			  ; F0 03 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA				  ; 9F 02 E4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_104
; Address: $CEB500
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_104:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $9684			; 8D 84 96 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_10D
; Address: $CEB528
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_10D:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_10E
; Address: $CEB532
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_10E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $D925,Y		  ; 99 25 D9 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D965,Y		  ; 99 65 D9 | Update graphics data
	STA $D9A5,Y		  ; 99 A5 D9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_10F
; Address: $CEB54B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_10F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_110
; Address: $CEB555
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_110:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	STA $C541			; 8D 41 C5 | Update graphics data
	STA $D925,Y		  ; 99 25 D9 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D965,Y		  ; 99 65 D9 | Update graphics data
	STA $D9A5,Y		  ; 99 A5 D9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_111
; Address: $CEB56E
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_111:
	STA $9680			; 8D 80 96 | Update graphics data
	STX $9682			; 8E 82 96 | Store X register to absolute address
	STY $9684			; 8C 84 96 | Store Y register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D925,X		  ; BD 25 D9 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	BNE $19			  ; D0 19 | Branch if not equal
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D9A5,X		  ; 9D A5 D9 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $11			  ; D0 11 | Branch if not equal
	STZ $D965,X		  ; 9E 65 D9 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_112
; Address: $CEB5A3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_112:
	STZ $D9A5,X		  ; 9E A5 D9 | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_113
; Address: $CEB5A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_113:
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D9A5,X		  ; 9D A5 D9 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_114
; Address: $CEB5B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_114:
	INY				  ; C8 | Increment Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	LDA $9684			; AD 84 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_115
; Address: $CEB5BC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_115:
	JSL $C734CF		  ; 22 CF 34 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $D965,X		  ; 9D 65 D9 | Update graphics data
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA				  ; BF 4A 36 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $C147			; 0D 47 C1 | Logical OR with accumulator (absolute)
	STA $C147			; 8D 47 C1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_116
; Address: $CEB5DC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_116:
	STA $9680			; 8D 80 96 | Update graphics data
	STX $9682			; 8E 82 96 | Store X register to absolute address
	STY $9684			; 8C 84 96 | Store Y register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D925,X		  ; BD 25 D9 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	BNE $19			  ; D0 19 | Branch if not equal
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D9A5,X		  ; 9D A5 D9 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $11			  ; D0 11 | Branch if not equal
	STZ $D965,X		  ; 9E 65 D9 | Store zero to absolute,X
	STZ $D9A5,X		  ; 9E A5 D9 | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_118
; Address: $CEB616
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_118:
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D9A5,X		  ; 9D A5 D9 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_119
; Address: $CEB61F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_119:
	INY				  ; C8 | Increment Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY $C117			; AC 17 C1 | Load from absolute address into Y register
	LDA $9684			; AD 84 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_11A
; Address: $CEB62A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_11A:
	JSL $C734DE		  ; 22 DE 34 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $D965,X		  ; 9D 65 D9 | Update graphics data
	LDX $C117			; AE 17 C1 | Load from absolute address into X register
	LDA				  ; BF 4A 36 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $C147			; 0D 47 C1 | Logical OR with accumulator (absolute)
	STA $C147			; 8D 47 C1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_11B
; Address: $CEB64A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_11B:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C6A5,Y		  ; B9 A5 C6 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA $9A1F,X		  ; BD 1F 9A | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_11C
; Address: $CEB676
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_11C:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $C925,Y		  ; 79 25 C9 | Add with carry (absolute,Y)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_11E
; Address: $CEB684
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_11E:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $18			  ; 85 18 | Update graphics data
	LDX $1C			  ; A6 1C | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_120
; Address: $CEB696
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_120:
	JSL $C06B66		  ; 22 66 6B C0 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $C15F			; 8D 5F C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_121
; Address: $CEB6A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_121:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$16			 ; A9 16 | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_123
; Address: $CEB6B1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_123:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$1E			 ; A9 1E | Read graphics status
	STA $2E			  ; 85 2E | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_129
; Address: $CEB6CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_129:
	JSR $5022			; 20 22 50 | Jump to subroutine
	DEC $6B			  ; C6 6B | Decrement (zero page)
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_130
; Address: $CEB6E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_130:
	JSR $0009			; 20 09 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_13C
; Address: $CEB71D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_13C:
	JSR $6222			; 20 22 62 | Jump to subroutine
	DEC $6B			  ; C6 6B | Decrement (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF E2 E3 7F | Read graphics status
	BPL $08			  ; 10 08 | Branch if positive
	LDA				  ; BF 72 E4 7F | Read graphics status
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($7A,X)		  ; 01 7A | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_13D
; Address: $CEB748
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_13D:
	LDA $9868			; AD 68 98 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	CPX $986A			; EC 6A 98 | Compare X register (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_13F
; Address: $CEB759
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_13F:
	LDA $9868			; AD 68 98 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	CPX $986A			; EC 6A 98 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_140
; Address: $CEB764
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_140:
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_142
; Address: $CEB76A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_142:
	LDA $9868			; AD 68 98 | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	CPX $986A			; EC 6A 98 | Compare X register (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_144
; Address: $CEB77B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_144:
	LDA $9868			; AD 68 98 | Read graphics status
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	CPX $986A			; EC 6A 98 | Compare X register (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_146
; Address: $CEB78C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_146:
	PLP				  ; 28 | Pull processor status from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_147
; Address: $CEB797
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_147:
	JSR $37D8			; 20 D8 37 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1A944		  ; 5C 44 A9 C1 | Jump to address long
	JMP $C1A92E		  ; 5C 2E A9 C1 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_148
; Address: $CEB7A4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_148:
	JSR $37D8			; 20 D8 37 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1A944		  ; 5C 44 A9 C1 | Jump to address long
	JMP $C1A92E		  ; 5C 2E A9 C1 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_149
; Address: $CEB7B1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_149:
	JSR $37D8			; 20 D8 37 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1A971		  ; 5C 71 A9 C1 | Jump to address long
	JMP $C1A95A		  ; 5C 5A A9 C1 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14A
; Address: $CEB7BE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14A:
	JSR $37D8			; 20 D8 37 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1A8EA		  ; 5C EA A8 C1 | Jump to address long
	JMP $C1A8D4		  ; 5C D4 A8 C1 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14B
; Address: $CEB7CB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14B:
	JSR $37D8			; 20 D8 37 | Jump to subroutine
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1A917		  ; 5C 17 A9 C1 | Jump to address long
	JMP $C1A900		  ; 5C 00 A9 C1 | Jump to address long
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14C
; Address: $CEB7D9
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14C:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $B471			; AD 71 B4 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	BCC $0A			  ; 90 0A | Branch if carry clear
	CMP #$80			 ; C9 80 | Compare accumulator (immediate)
	BCC $05			  ; 90 05 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14D
; Address: $CEB7F7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14D:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14E
; Address: $CEB7FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14E:
	JSL $C3165B		  ; 22 5B 16 C3 | Jump to subroutine long
	STA $C13B			; 8D 3B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_14F
; Address: $CEB804
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_14F:
	JSL $C316E5		  ; 22 E5 16 C3 | Jump to subroutine long
	STA $C13B			; 8D 3B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_150
; Address: $CEB80C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_150:
	JSL $C316FE		  ; 22 FE 16 C3 | Jump to subroutine long
	STA $C13B			; 8D 3B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_152
; Address: $CEB815
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_152:
	JSL $C3165B		  ; 22 5B 16 C3 | Jump to subroutine long
	STA $C13B			; 8D 3B C1 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_153
; Address: $CEB81E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_153:
	JSL $C31F16		  ; 22 16 1F C3 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_158
; Address: $CEB836
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_158:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_159
; Address: $CEB842
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_159:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D4E5,Y		  ; B9 E5 D4 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $E3			  ; 80 E3 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_15A
; Address: $CEB860
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_15A:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_15B
; Address: $CEB86C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_15B:
	JSL $C024A7		  ; 22 A7 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D4E5,Y		  ; B9 E5 D4 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $E3			  ; 80 E3 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_15C
; Address: $CEB88A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_15C:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $BDF1			; AD F1 BD | Read graphics status
	AND #$30			 ; 29 30 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	BNE $04			  ; D0 04 | Branch if not equal
	INC				  ; 1A | Increment accumulator
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	JMP $C74B45		  ; 5C 45 4B C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_15D
; Address: $CEB8A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_15D:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	AND $7F70			; 2D 70 7F | Logical AND with accumulator (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_160
; Address: $CEB8B5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_160:
	LDY $C36D			; AC 6D C3 | Load from absolute address into Y register
	LDA $D565,Y		  ; B9 65 D5 | Read graphics status
	STA $001D9A		  ; 8F 9A 1D 00 | Update graphics data
	LDA $D5A5,Y		  ; B9 A5 D5 | Read graphics status
	STA $001D9C		  ; 8F 9C 1D 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_164
; Address: $CEB8D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_164:
	JSL $C1BACC		  ; 22 CC BA C1 | Jump to subroutine long
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	INX				  ; E8 | Increment X register
	BRA $F4			  ; 80 F4 | Branch always
	STX $C163			; 8E 63 C1 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_165
; Address: $CEB8E2
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_165:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	LDA $18			  ; A5 18 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA $00			  ; A5 00 | Read graphics status
	STA $ACFB,Y		  ; 99 FB AC | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $AD05,Y		  ; 99 05 AD | Update graphics data
	BRA $0A			  ; 80 0A | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_166
; Address: $CEB92A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_166:
	LDA $00			  ; A5 00 | Read graphics status
	STA $AD0F,Y		  ; 99 0F AD | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $AD19,Y		  ; 99 19 AD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_167
; Address: $CEB935
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_167:
	JSL $C7556C		  ; 22 6C 55 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX $C129			; AE 29 C1 | Load from absolute address into X register
	LDY $C12B			; AC 2B C1 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_168
; Address: $CEB942
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_168:
	JSL $C7365B		  ; 22 5B 36 C7 | Jump to subroutine long
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	SEC				  ; 38 | Set carry flag
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $1A			  ; 85 1A | Update graphics data
	LDA $C15F			; AD 5F C1 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	AND $AC48,Y		  ; 39 48 AC | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_16A
; Address: $CEB982
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_16A:
	TXA				  ; 8A | Transfer X register to accumulator
	AND $3992,Y		  ; 39 92 39 | Logical AND with accumulator (absolute,Y)
	TXA				  ; 8A | Transfer X register to accumulator
	AND $3992,Y		  ; 39 92 39 | Logical AND with accumulator (absolute,Y)
	LDA $18			  ; A5 18 | Read graphics status
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA #$03			 ; A9 03 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_16B
; Address: $CEB992
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_16B:
	LDA $1A			  ; A5 1A | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_16E
; Address: $CEB99E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_16E:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	SBC ($39),Y		  ; F1 39 | Subtract with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_16F
; Address: $CEB9AF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_16F:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND $C1A3			; 2D A3 C1 | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA #$04			 ; A9 04 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_171
; Address: $CEB9D0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_171:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $9AE1,X		  ; 7D E1 9A | Add with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND $C1A3			; 2D A3 C1 | Logical AND with accumulator (absolute)
	BEQ $E9			  ; F0 E9 | Branch if equal
	LDA #$06			 ; A9 06 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_173
; Address: $CEB9F2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_173:
	AND $39AF,Y		  ; 39 AF 39 | Logical AND with accumulator (absolute,Y)
	AND $39D0,Y		  ; 39 D0 39 | Logical AND with accumulator (absolute,Y)
	AND $39CF,Y		  ; 39 CF 39 | Logical AND with accumulator (absolute,Y)
	AND $39CF,Y		  ; 39 CF 39 | Logical AND with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_175
; Address: $CEBA13
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_175:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $9AE1,X		  ; 7D E1 9A | Add with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND $C1A3			; 2D A3 C1 | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA #$05			 ; A9 05 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_177
; Address: $CEBA34
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_177:
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $C825,Y		  ; B9 25 C8 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $9AE1,X		  ; FD E1 9A | Subtract with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND $C1A3			; 2D A3 C1 | Logical AND with accumulator (absolute)
	BEQ $E9			  ; F0 E9 | Branch if equal
	LDA #$07			 ; A9 07 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_179
; Address: $CEBA56
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_179:
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	CPY $DAA5			; CC A5 DA | Compare Y register (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	JMP $3A87			; 4C 87 3A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_17A
; Address: $CEBA78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_17A:
	CPY $DAA5			; CC A5 DA | Compare Y register (absolute)
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_17B
; Address: $CEBA84
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_17B:
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_17D
; Address: $CEBA9A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_17D:
	JSR $3ACA			; 20 CA 3A | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_17F
; Address: $CEBAA6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_17F:
	JSR $3ACA			; 20 CA 3A | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_181
; Address: $CEBAB2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_181:
	JSR $3ACA			; 20 CA 3A | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$07			 ; A9 07 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_183
; Address: $CEBABE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_183:
	JSR $3ACA			; 20 CA 3A | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$0F			 ; A9 0F | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_185
; Address: $CEBACA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_185:
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	ROL $AF			  ; 26 AF | Rotate left (zero page)
	ROR $0429,X		  ; 7E 29 04 | Rotate right (absolute,X)
	BNE $1D			  ; D0 1D | Branch if not equal
	LDA $7E3545		  ; AF 45 35 7E | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $7E3545		  ; AF 45 35 7E | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $C4E5,Y		  ; B9 E5 C4 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_188
; Address: $CEBAFC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_188:
	JSL $C43115		  ; 22 15 31 C4 | Jump to subroutine long
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	LDA $18			  ; A5 18 | Read graphics status
	BEQ $19			  ; F0 19 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	BEQ $02			  ; F0 02 | Branch if equal
	BCS $07			  ; B0 07 | Branch if carry set
	LDA $18			  ; A5 18 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	BEQ $09			  ; F0 09 | Branch if equal
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_189
; Address: $CEBB15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_189:
	JSL $C431D7		  ; 22 D7 31 C4 | Jump to subroutine long
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_18B
; Address: $CEBB21
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_18B:
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	LDA $C8A5,Y		  ; B9 A5 C8 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_18D
; Address: $CEBB3A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_18D:
	CPY $DAA5			; CC A5 DA | Compare Y register (absolute)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$60			 ; A9 60 | Read graphics status
	INC $00A2,X		  ; FE A2 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_190
; Address: $CEBB54
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_190:
	CPY $DAA5			; CC A5 DA | Compare Y register (absolute)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$A0			 ; A9 A0 | Read graphics status
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_194
; Address: $CEBB6E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_194:
	CPY $DAA5			; CC A5 DA | Compare Y register (absolute)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$60			 ; A9 60 | Read graphics status
	SBC $E0A2,X		  ; FD A2 E0 | Game work RAM access
	INC $E320,X		  ; FE 20 E3 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_196
; Address: $CEBB80
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_196:
	PHY				  ; 5A | Push Y register to stack
	STA $C0AF			; 8D AF C0 | Update graphics data
	STX $C0B1			; 8E B1 C0 | Store X register to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $14			  ; 30 14 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C0B1			; 6D B1 C0 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C0AF			; 6D AF C0 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_197
; Address: $CEBBA0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_197:
	JSL $C759AD		  ; 22 AD 59 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $DE			  ; 90 DE | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_198
; Address: $CEBBAE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_198:
	PHY				  ; 5A | Push Y register to stack
	STA $C0AF			; 8D AF C0 | Update graphics data
	STX $C0B1			; 8E B1 C0 | Store X register to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $1B			  ; 30 1B | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_199
; Address: $CEBBC2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_199:
	JSL $C75A47		  ; 22 47 5A C7 | Jump to subroutine long
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C0B1			; 6D B1 C0 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C0AF			; 6D AF C0 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_19B
; Address: $CEBBDA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_19B:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $D7			  ; 90 D7 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_19C
; Address: $CEBBE3
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_19C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $7FE36C		  ; AF 6C E3 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $7FE36C		  ; 8F 6C E3 7F | Update graphics data
	STA $7FE36E		  ; 8F 6E E3 7F | Update graphics data
	STA $7FE370		  ; 8F 70 E3 7F | Update graphics data
	STA $7FE374		  ; 8F 74 E3 7F | Update graphics data
	LDA $7FE376		  ; AF 76 E3 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	STA $7FE378		  ; 8F 78 E3 7F | Update graphics data
	STA $7FE37A		  ; 8F 7A E3 7F | Update graphics data
	STA $7FE37E		  ; 8F 7E E3 7F | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_19D
; Address: $CEBC16
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_19D:
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	BPL $07			  ; 10 07 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_19E
; Address: $CEBC23
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_19E:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C141			; 8D 41 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_19F
; Address: $CEBC2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_19F:
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	STA $C18B			; 8D 8B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A0
; Address: $CEBC36
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A0:
	LDA $7F2A			; AD 2A 7F | Read graphics status
	CMP $DAA5			; CD A5 DA | Compare accumulator (absolute)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A2
; Address: $CEBC42
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A2:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A3
; Address: $CEBC4A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A3:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	EOR $42			  ; 45 42 | Hardware register operation
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A4
; Address: $CEBC68
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A4:
	JSR $418D			; 20 8D 41 | Jump to subroutine
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4243			; 8D 43 42 | Hardware register operation
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A5
; Address: $CEBC75
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A5:
	JSL $C73C7C		  ; 22 7C 3C C7 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A6
; Address: $CEBC7C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A6:
	JSL $C79C43		  ; 22 43 9C C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D7E5,Y		  ; 99 E5 D7 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D825,Y		  ; 99 25 D8 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A8
; Address: $CEBC96
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A8:
	STA $18			  ; 85 18 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	STX $4245			; 8E 45 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1A9
; Address: $CEBCA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1A9:
	JSR $418D			; 20 8D 41 | Jump to subroutine
	WDM #$A9			 ; 42 A9 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA $4243			; 8D 43 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1AA
; Address: $CEBCAF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1AA:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	LDA $18			  ; A5 18 | Read graphics status
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDY $1E			  ; A4 1E | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1AB
; Address: $CEBCB8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1AB:
	JSL $C79C43		  ; 22 43 9C C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D7E5,Y		  ; 99 E5 D7 | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $D825,Y		  ; 99 25 D8 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1AD
; Address: $CEBCD1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1AD:
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $09			  ; 30 09 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1AE
; Address: $CEBCEA
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1AE:
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1AF
; Address: $CEBCED
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1AF:
	STX $4247			; 8E 47 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $11			  ; 30 11 | Branch if negative
	LDA $4332,X		  ; BD 32 43 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B0
; Address: $CEBD0C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B0:
	JSL $C79ED3		  ; 22 D3 9E C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B2
; Address: $CEBD13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B2:
	PHX				  ; DA | Push X register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B3
; Address: $CEBD1C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B3:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $0F			  ; 30 0F | Branch if negative
	LDA $1C			  ; A5 1C | Read graphics status
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	LDA $1E			  ; A5 1E | Read graphics status
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP $3CED			; 4C ED 3C | Jump to address
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B4
; Address: $CEBD3F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B4:
	PHX				  ; DA | Push X register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B5
; Address: $CEBD48
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B5:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $10			  ; 30 10 | Branch if negative
	LDA $1C			  ; A5 1C | Read graphics status
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	LDA $1E			  ; A5 1E | Read graphics status
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	PLX				  ; FA | Pull X register from stack
	LDA $24			  ; A5 24 | Read graphics status
	JMP $3CED			; 4C ED 3C | Jump to address
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B7
; Address: $CEBD6B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B7:
	PHX				  ; DA | Push X register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B8
; Address: $CEBD74
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B8:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $1E			  ; 30 1E | Branch if negative
	LDA $1C			  ; A5 1C | Read graphics status
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	LDA $1E			  ; A5 1E | Read graphics status
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	LDX $20			  ; A6 20 | Load from zero page into X register
	CLC				  ; 18 | Clear carry flag
	ADC $98A7,X		  ; 7D A7 98 | Add with carry (absolute,X)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	LDA $24			  ; A5 24 | Read graphics status
	JMP $3CED			; 4C ED 3C | Jump to address
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1B9
; Address: $CEBDA5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1B9:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1BA
; Address: $CEBDAF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1BA:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $20			  ; 30 20 | Branch if negative
	LDA $1C			  ; A5 1C | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1BB
; Address: $CEBDC2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1BB:
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	LDX $20			  ; A6 20 | Load from zero page into X register
	CLC				  ; 18 | Clear carry flag
	ADC $98A7,X		  ; 7D A7 98 | Add with carry (absolute,X)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	LDA $24			  ; A5 24 | Read graphics status
	JMP $3CED			; 4C ED 3C | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1BC
; Address: $CEBDE3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1BC:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1BD
; Address: $CEBDED
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1BD:
	JSR $411F			; 20 1F 41 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $20			  ; 30 20 | Branch if negative
	LDA $1C			  ; A5 1C | Read graphics status
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	LDX $20			  ; A6 20 | Load from zero page into X register
	CLC				  ; 18 | Clear carry flag
	ADC $98A7,X		  ; 7D A7 98 | Add with carry (absolute,X)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	LDA $24			  ; A5 24 | Read graphics status
	JMP $3E21			; 4C 21 3E | Jump to address
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1BF
; Address: $CEBE21
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1BF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $11			  ; 30 11 | Branch if negative
	LDA $4332,X		  ; BD 32 43 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1C0
; Address: $CEBE3D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1C0:
	JSL $C7C2F4		  ; 22 F4 C2 C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1C1
; Address: $CEBE43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1C1:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $04			  ; 30 04 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1C3
; Address: $CEBE56
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1C3:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $04			  ; 30 04 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1C5
; Address: $CEBE69
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1C5:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $05			  ; 30 05 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1C8
; Address: $CEBE7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1C8:
	JSL $C73E69		  ; 22 69 3E C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	BRA $F7			  ; 80 F7 | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CA
; Address: $CEBE89
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CA:
	STA $18			  ; 85 18 | Update graphics data
	STX $1A			  ; 86 1A | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $12			  ; 30 12 | Branch if negative
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CB
; Address: $CEBEAE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CB:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D865,Y		  ; 99 65 D8 | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $D8A5,Y		  ; 99 A5 D8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D8E5,Y		  ; 99 E5 D8 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CC
; Address: $CEBED4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CC:
	STZ $1C			  ; 64 1C | Store zero to zero page
	STZ $1E			  ; 64 1E | Store zero to zero page
	STZ $20			  ; 64 20 | Store zero to zero page
	STZ $22			  ; 64 22 | Store zero to zero page
	JMP $3F0F			; 4C 0F 3F | Jump to address
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STZ $20			  ; 64 20 | Store zero to zero page
	STZ $22			  ; 64 22 | Store zero to zero page
	JMP $3F0F			; 4C 0F 3F | Jump to address
	STZ $1C			  ; 64 1C | Store zero to zero page
	STZ $1E			  ; 64 1E | Store zero to zero page
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $20			  ; 85 20 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $22			  ; 85 22 | Update graphics data
	JMP $3F0F			; 4C 0F 3F | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CD
; Address: $CEBF01
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CD:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	STA $20			  ; 85 20 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STA $22			  ; 85 22 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D865,X		  ; BD 65 D8 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$C7			 ; A9 C7 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $D8E5,X		  ; BD E5 D8 | Read graphics status
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $D8A5,X		  ; BD A5 D8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $D8A5,X		  ; 9D A5 D8 | Update graphics data
	LDA $D8A5,X		  ; BD A5 D8 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$02			 ; A9 02 | Read graphics status
	STA $D8A5,X		  ; 9D A5 D8 | Update graphics data
	BRA $EC			  ; 80 EC | Branch always
	LDA $D8E5,X		  ; BD E5 D8 | Read graphics status
	BNE $08			  ; D0 08 | Branch if not equal
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D8E5,X		  ; 9D E5 D8 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	EOR $1C			  ; 45 1C | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	EOR $20			  ; 45 20 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $22			  ; 65 22 | Add with carry (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CE
; Address: $CEBF75
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CE:
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1CF
; Address: $CEBF7C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1CF:
	JSL $C73E8D		  ; 22 8D 3E C7 | Jump to subroutine long
	LDA $D8E5,Y		  ; B9 E5 D8 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D8E5,Y		  ; 99 E5 D8 | Update graphics data
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D8A5,Y		  ; B9 A5 D8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D1
; Address: $CEBF9F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D1:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	LDA $42D2,X		  ; BD D2 42 | Hardware register operation
	STA $C125			; 8D 25 C1 | Update graphics data
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	STA $C127			; 8D 27 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D2
; Address: $CEBFB8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D2:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $07			  ; 30 07 | Branch if negative
	LDA $45D2,X		  ; BD D2 45 | Read graphics status
	STA $C137			; 8D 37 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D3
; Address: $CEBFCD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D3:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C137			; 8D 37 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D4
; Address: $CEBFD4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D4:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $05			  ; 30 05 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D7
; Address: $CEBFE9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D7:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $04			  ; 30 04 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1D9
; Address: $CEBFFC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1D9:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $03			  ; 30 03 | Branch if negative
	STA $4312,X		  ; 9D 12 43 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1DA
; Address: $CEC00E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1DA:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D825,Y		  ; BE 25 D8 | Load from absolute,Y into X register
	LDA $98A7,X		  ; BD A7 98 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $03			  ; 30 03 | Branch if negative
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1DB
; Address: $CEC027
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1DB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D825,Y		  ; BE 25 D8 | Load from absolute,Y into X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $98A7,X		  ; BD A7 98 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $03			  ; 30 03 | Branch if negative
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1DD
; Address: $CEC046
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1DD:
	LDA $D7A5,Y		  ; B9 A5 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $13			  ; 30 13 | Branch if negative
	LDA $44F2,X		  ; BD F2 44 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1DE
; Address: $CEC064
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1DE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D7A5,Y		  ; B9 A5 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $13			  ; 30 13 | Branch if negative
	LDA $44F2,X		  ; BD F2 44 | Read graphics status
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1DF
; Address: $CEC086
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1DF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $06			  ; 30 06 | Branch if negative
	LDA #$00			 ; A9 00 | Read graphics status
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E0
; Address: $CEC09B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E0:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $0A			  ; 30 0A | Branch if negative
	LDA $44F2,X		  ; BD F2 44 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E1
; Address: $CEC0AC
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E1:
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E3
; Address: $CEC0B4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E3:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $03			  ; 30 03 | Branch if negative
	STA $42B2,X		  ; 9D B2 42 | Hardware register operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E4
; Address: $CEC0C7
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E4:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $39			  ; 30 39 | Branch if negative
	LDA $42B2,Y		  ; B9 B2 42 | Hardware register operation
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BIT $B9AA			; 2C AA B9 | Test bits in accumulator (absolute)
	WDM #$38			 ; 42 38 | Reserved instruction
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $18			  ; 85 18 | Update graphics data
	LDA $42F2,Y		  ; B9 F2 42 | Hardware register operation
	SEC				  ; 38 | Set carry flag
	STA $1A			  ; 85 1A | Update graphics data
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA $18			  ; A5 18 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $42D2,Y		  ; 99 D2 42 | Hardware register operation
	LDA $1A			  ; A5 1A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA $42F2,Y		  ; 99 F2 42 | Hardware register operation
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	WDM #$68			 ; 42 68 | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E5
; Address: $CEC112
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E5:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D7E5,Y		  ; 99 E5 D7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E7
; Address: $CEC11F
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E7:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D7A5,Y		  ; B9 A5 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	BVC $D2			  ; 50 D2 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	STA $1C			  ; 85 1C | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	INY				  ; C8 | Increment Y register
	STA $1E			  ; 85 1E | Update graphics data
	LDA $C7E5,Y		  ; B9 E5 C7 | Read graphics status
	STA $20			  ; 85 20 | Update graphics data
	LDA				  ; BF 60 D2 C8 | Read graphics status
	STA $22			  ; 85 22 | Update graphics data
	LDA				  ; BF 68 D2 C8 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E8
; Address: $CEC158
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E8:
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $10			  ; 30 10 | Branch if negative
	LDA $42F2,X		  ; BD F2 42 | Hardware register operation
	LDX $D825,Y		  ; BE 25 D8 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ADC $98A7,X		  ; 7D A7 98 | Add with carry (absolute,X)
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1E9
; Address: $CEC16E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1E9:
	LDA $1E			  ; A5 1E | Read graphics status
	LDX $20			  ; A6 20 | Load from zero page into X register
	CLC				  ; 18 | Clear carry flag
	ADC $98A7,X		  ; 7D A7 98 | Add with carry (absolute,X)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	BMI $03			  ; 30 03 | Branch if negative
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1EB
; Address: $CEC185
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1EB:
	JSR $41B5			; 20 B5 41 | Jump to subroutine
	BRA $08			  ; 80 08 | Branch always
	STA $7FE314		  ; 8F 14 E3 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1EC
; Address: $CEC18E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1EC:
	JSL $C0505A		  ; 22 5A 50 C0 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 6C E3 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	STA $C14B,X		  ; 9D 4B C1 | Update graphics data
	LDA				  ; BF 76 E3 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	STA $C155,X		  ; 9D 55 C1 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1ED
; Address: $CEC1B5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1ED:
	LDY $AD6B			; AC 6B AD | Load from absolute address into Y register
	LDA $7FE314		  ; AF 14 E3 7F | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	REP #$41			 ; C2 41 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1EE
; Address: $CEC1C2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1EE:
	INX				  ; E8 | Increment X register
	EOR ($D9,X)		  ; 41 D9 | Exclusive OR with accumulator ((zero page,X))
	EOR ($F7,X)		  ; 41 F7 | Exclusive OR with accumulator ((zero page,X))
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	EOR ($BB,X)		  ; 41 BB | Exclusive OR with accumulator ((zero page,X))
	LDA				  ; BF 6C E3 7F | Read graphics status
	CMP $AD63			; CD 63 AD | Compare accumulator (absolute)
	BEQ $31			  ; F0 31 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1F0
; Address: $CEC1DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1F0:
	LDA				  ; BF 6C E3 7F | Read graphics status
	CMP $AD65			; CD 65 AD | Compare accumulator (absolute)
	BEQ $22			  ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1F2
; Address: $CEC1E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1F2:
	LDA				  ; BF 76 E3 7F | Read graphics status
	CMP $AD67			; CD 67 AD | Compare accumulator (absolute)
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1F4
; Address: $CEC1F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1F4:
	LDA				  ; BF 76 E3 7F | Read graphics status
	CMP $AD69			; CD 69 AD | Compare accumulator (absolute)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1F6
; Address: $CEC206
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1F6:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1F9
; Address: $CEC217
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1F9:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FE36C		  ; AF 6C E3 7F | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FE376		  ; AF 76 E3 7F | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1FA
; Address: $CEC23A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1FA:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1FB
; Address: $CEC23D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1FB:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $7FE370		  ; 8F 70 E3 7F | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $7FE37A		  ; 8F 7A E3 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1FD
; Address: $CEC250
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1FD:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SBC $968E			; ED 8E 96 | Subtract with carry (absolute)
	STA $AD6D			; 8D 6D AD | Update graphics data
	LDA $7FE37E		  ; AF 7E E3 7F | Read graphics status
	STA $AD6F			; 8D 6F AD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_1FF
; Address: $CEC266
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_1FF:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SBC $9690			; ED 90 96 | Subtract with carry (absolute)
	STA $AD6F			; 8D 6F AD | Update graphics data
	LDA $7FE374		  ; AF 74 E3 7F | Read graphics status
	STA $AD6D			; 8D 6D AD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_201
; Address: $CEC27D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_201:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SBC $968E			; ED 8E 96 | Subtract with carry (absolute)
	STA $AD6D			; 8D 6D AD | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_202
; Address: $CEC289
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_202:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SBC $9690			; ED 90 96 | Subtract with carry (absolute)
	STA $AD6F			; 8D 6F AD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_203
; Address: $CEC295
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_203:
	LDX $AD6B			; AE 6B AD | Load from absolute address into X register
	LDA $AD6D			; AD 6D AD | Read graphics status
	BEQ $28			  ; F0 28 | Branch if equal
	BCC $13			  ; 90 13 | Branch if carry clear
	LDA $AD65			; AD 65 AD | Read graphics status
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	BNE $05			  ; D0 05 | Branch if not equal
	STA $AD6D			; 8D 6D AD | Update graphics data
	BRA $18			  ; 80 18 | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $38			  ; 80 38 | Branch always
	LDA $AD63			; AD 63 AD | Read graphics status
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	BNE $05			  ; D0 05 | Branch if not equal
	STA $AD6D			; 8D 6D AD | Update graphics data
	BRA $05			  ; 80 05 | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	BRA $25			  ; 80 25 | Branch always
	LDA $AD6F			; AD 6F AD | Read graphics status
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BEQ $21			  ; F0 21 | PPU graphics register access
	BCC $0E			  ; 90 0E | Branch if carry clear
	LDA $AD69			; AD 69 AD | Read graphics status
	BEQ $16			  ; F0 16 | Branch if equal
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $0C			  ; 80 0C | Branch always
	LDA $AD67			; AD 67 AD | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_204
; Address: $CEC2F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_204:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_205
; Address: $CEC2FB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_205:
	LDX $AD6B			; AE 6B AD | Load from absolute address into X register
	LDA $AD6F			; AD 6F AD | Read graphics status
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BEQ $28			  ; F0 28 | Branch if equal
	BCC $13			  ; 90 13 | Branch if carry clear
	LDA $AD69			; AD 69 AD | Read graphics status
	BNE $05			  ; D0 05 | Branch if not equal
	STA $AD6F			; 8D 6F AD | Update graphics data
	BRA $18			  ; 80 18 | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_206
; Address: $CEC317
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_206:
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $38			  ; 80 38 | Branch always
	LDA $AD67			; AD 67 AD | Read graphics status
	BNE $05			  ; D0 05 | Branch if not equal
	STA $AD6F			; 8D 6F AD | Update graphics data
	BRA $05			  ; 80 05 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $25			  ; 80 25 | Branch always
	LDA $AD6D			; AD 6D AD | Read graphics status
	BEQ $21			  ; F0 21 | PPU graphics register access
	BCC $0E			  ; 90 0E | Branch if carry clear
	LDA $AD65			; AD 65 AD | Read graphics status
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	BEQ $16			  ; F0 16 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $0C			  ; 80 0C | Branch always
	LDA $AD63			; AD 63 AD | Read graphics status
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_207
; Address: $CEC359
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_207:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_208
; Address: $CEC361
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_208:
	LDA $AD6F			; AD 6F AD | Read graphics status
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BEQ $3C			  ; F0 3C | Branch if equal
	BCC $1D			  ; 90 1D | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status
	LDA $AD6D			; AD 6D AD | Read graphics status
	BEQ $0C			  ; F0 0C | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$05			 ; A9 05 | Read graphics status
	BRA $3A			  ; 80 3A | Branch always
	LDA #$06			 ; A9 06 | Read graphics status
	BRA $35			  ; 80 35 | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $30			  ; 80 30 | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	LDA $AD6D			; AD 6D AD | Read graphics status
	BEQ $0C			  ; F0 0C | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$04			 ; A9 04 | Read graphics status
	BRA $1D			  ; 80 1D | Branch always
	LDA #$07			 ; A9 07 | Read graphics status
	BRA $18			  ; 80 18 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_209
; Address: $CEC3A4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_209:
	BRA $13			  ; 80 13 | Branch always
	LDA $AD6D			; AD 6D AD | Read graphics status
	BEQ $0F			  ; F0 0F | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_20A
; Address: $CEC3BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_20A:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C11F			; 8D 1F C1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_211
; Address: $CEC3E5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_211:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D925,Y		  ; 99 25 D9 | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $D965,Y		  ; 99 65 D9 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D9A5,Y		  ; 99 A5 D9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_212
; Address: $CEC40B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_212:
	STA $1C			  ; 85 1C | Update graphics data
	STZ $1E			  ; 64 1E | Store zero to zero page
	STZ $20			  ; 64 20 | Store zero to zero page
	JMP $4435			; 4C 35 44 | Jump to address
	STA $1C			  ; 85 1C | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STZ $20			  ; 64 20 | Store zero to zero page
	JMP $4435			; 4C 35 44 | Jump to address
	STA $1C			  ; 85 1C | Update graphics data
	STZ $1E			  ; 64 1E | Store zero to zero page
	LDA #$01			 ; A9 01 | Read graphics status
	STA $20			  ; 85 20 | Update graphics data
	JMP $4435			; 4C 35 44 | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_213
; Address: $CEC42C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_213:
	STA $1C			  ; 85 1C | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	STA $20			  ; 85 20 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D925,X		  ; BD 25 D9 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$C7			 ; A9 C7 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $D965,X		  ; 9D 65 D9 | Update graphics data
	LDA $D965,X		  ; BD 65 D9 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $C139			; 8D 39 C1 | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$02			 ; A9 02 | Read graphics status
	STA $D965,X		  ; 9D 65 D9 | Update graphics data
	BRA $E9			  ; 80 E9 | Branch always
	LDA $D9A5,X		  ; BD A5 D9 | Read graphics status
	BNE $08			  ; D0 08 | Branch if not equal
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D9A5,X		  ; 9D A5 D9 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $1A			  ; 85 1A | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_214
; Address: $CEC4A3
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_214:
	JSR $44CE			; 20 CE 44 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D9A5,Y		  ; B9 A5 D9 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D9A5,Y		  ; 99 A5 D9 | Update graphics data
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D965,Y		  ; B9 65 D9 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_216
; Address: $CEC4CE
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_216:
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $1E			  ; A5 1E | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4623			; 4C 23 46 | Jump to address
	LDA $20			  ; A5 20 | Read graphics status
	BNE $70			  ; D0 70 | Branch if not equal
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $E39E			; AD 9E E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $E39E			; 8D 9E E3 | Update graphics data
	LDA $E3A8			; AD A8 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $E3A8			; 8D A8 E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $E3A0			; AD A0 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $E3A0			; 8D A0 E3 | Update graphics data
	LDA $E3AA			; AD AA E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $E3AA			; 8D AA E3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_217
; Address: $CEC50B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_217:
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $E3A2			; AD A2 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $E3A2			; 8D A2 E3 | Update graphics data
	LDA $E3AC			; AD AC E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $E3AC			; 8D AC E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $E3A4			; AD A4 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $E3A4			; 8D A4 E3 | Update graphics data
	LDA $E3AE			; AD AE E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $E3AE			; 8D AE E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $E3A6			; AD A6 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $E3A6			; 8D A6 E3 | Update graphics data
	LDA $E3B0			; AD B0 E3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $E3B0			; 8D B0 E3 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_218
; Address: $CEC54F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_218:
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $26			  ; 90 26 | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2DE			; AD DE E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_219
; Address: $CEC55B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_219:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E39E			; 6D 9E E3 | Add with carry (absolute)
	STA $E39E			; 8D 9E E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EA			; AD EA E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21A
; Address: $CEC56E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21A:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3A8			; 6D A8 E3 | Add with carry (absolute)
	STA $E3A8			; 8D A8 E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $26			  ; 90 26 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21B
; Address: $CEC57D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21B:
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E0			; AD E0 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21C
; Address: $CEC585
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21C:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3A0			; 6D A0 E3 | Add with carry (absolute)
	STA $E3A0			; 8D A0 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EC			; AD EC E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21D
; Address: $CEC598
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21D:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3AA			; 6D AA E3 | Add with carry (absolute)
	STA $E3AA			; 8D AA E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $26			  ; 90 26 | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E2			; AD E2 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21E
; Address: $CEC5AF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21E:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3A2			; 6D A2 E3 | Add with carry (absolute)
	STA $E3A2			; 8D A2 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EE			; AD EE E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_21F
; Address: $CEC5C2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_21F:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3AC			; 6D AC E3 | Add with carry (absolute)
	STA $E3AC			; 8D AC E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $26			  ; 90 26 | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E4			; AD E4 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_220
; Address: $CEC5D9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_220:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3A4			; 6D A4 E3 | Add with carry (absolute)
	STA $E3A4			; 8D A4 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2F0			; AD F0 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_221
; Address: $CEC5EC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_221:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3AE			; 6D AE E3 | Add with carry (absolute)
	STA $E3AE			; 8D AE E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $26			  ; 90 26 | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_223
; Address: $CEC603
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_223:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3A6			; 6D A6 E3 | Add with carry (absolute)
	STA $E3A6			; 8D A6 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2F2			; AD F2 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_224
; Address: $CEC616
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_224:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $E3B0			; 6D B0 E3 | Add with carry (absolute)
	STA $E3B0			; 8D B0 E3 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_225
; Address: $CEC623
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_225:
	LDA $20			  ; A5 20 | Read graphics status
	BNE $48			  ; D0 48 | Branch if not equal
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $E39E			; 8D 9E E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $E3A8			; 8D A8 E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $E3A0			; 8D A0 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $E3AA			; 8D AA E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $E3A2			; 8D A2 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $E3AC			; 8D AC E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $E3A4			; 8D A4 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $E3AE			; 8D AE E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $E3A6			; 8D A6 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $E3B0			; 8D B0 E3 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_227
; Address: $CEC673
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_227:
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2DE			; AD DE E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_228
; Address: $CEC67B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_228:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E39E			; 8D 9E E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EA			; AD EA E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_229
; Address: $CEC68A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_229:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A8			; 8D A8 E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E0			; AD E0 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22A
; Address: $CEC69D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22A:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A0			; 8D A0 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EC			; AD EC E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22B
; Address: $CEC6AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22B:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3AA			; 8D AA E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E2			; AD E2 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22C
; Address: $CEC6BF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22C:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A2			; 8D A2 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2EE			; AD EE E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22D
; Address: $CEC6CE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22D:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3AC			; 8D AC E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2E4			; AD E4 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22E
; Address: $CEC6E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22E:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A4			; 8D A4 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2F0			; AD F0 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_22F
; Address: $CEC6F0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_22F:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3AE			; 8D AE E3 | Update graphics data
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_231
; Address: $CEC703
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_231:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3A6			; 8D A6 E3 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $FC56			; 8D 56 FC | Update graphics data
	LDA $E2F2			; AD F2 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_232
; Address: $CEC712
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_232:
	JSL $C05799		  ; 22 99 57 C0 | Jump to subroutine long
	STA $E3B0			; 8D B0 E3 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_233
; Address: $CEC71B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_233:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FC8			; 8D C8 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_234
; Address: $CEC723
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_234:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FCA			; 8D CA 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_235
; Address: $CEC72B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_235:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FCC			; 8D CC 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_236
; Address: $CEC733
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_236:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FCE			; 8D CE 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_237
; Address: $CEC73B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_237:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FD0			; 8D D0 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_238
; Address: $CEC743
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_238:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FD2			; 8D D2 7F | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_239
; Address: $CEC74B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_239:
	AND #$33			 ; 29 33 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FBA			; AD BA 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_23B
; Address: $CEC75F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_23B:
	AND #$33			 ; 29 33 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FBC			; AD BC 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDY $687F,X		  ; BC 7F 68 | Load from absolute,X into Y register
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_23C
; Address: $CEC76F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_23C:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	AND #$33			 ; 29 33 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FBE			; AD BE 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX $687F,Y		  ; BE 7F 68 | Load from absolute,Y into X register
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_23E
; Address: $CEC783
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_23E:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FC2			; 8D C2 7F | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_23F
; Address: $CEC78E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_23F:
	SEP #$20			 ; E2 20 | Set processor status bits
	INC $7FC2			; EE C2 7F | Increment (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_240
; Address: $CEC796
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_240:
	SEP #$20			 ; E2 20 | Set processor status bits
	DEC $7FC2			; CE C2 7F | Decrement (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_241
; Address: $CEC79E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_241:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $7FC3			; 8D C3 7F | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_242
; Address: $CEC7A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_242:
	SEP #$20			 ; E2 20 | Set processor status bits
	INC $7FC3			; EE C3 7F | Increment (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_243
; Address: $CEC7B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_243:
	SEP #$20			 ; E2 20 | Set processor status bits
	DEC $7FC3			; CE C3 7F | Decrement (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_24E
; Address: $CEC7DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_24E:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C0AF			; 8D AF C0 | Update graphics data
	STA $C0B1			; 8D B1 C0 | Update graphics data
	STA $C0B3			; 8D B3 C0 | Update graphics data
	STA $C0B5			; 8D B5 C0 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_24F
; Address: $CEC7E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_24F:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_250
; Address: $CEC7F3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_250:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $C0AF,Y		  ; 99 AF C0 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $EF			  ; 90 EF | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_251
; Address: $CEC805
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_251:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_252
; Address: $CEC811
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_252:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_253
; Address: $CEC81E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_253:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_254
; Address: $CEC82A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_254:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_255
; Address: $CEC837
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_255:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C0AF,Y		  ; B9 AF C0 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_258
; Address: $CEC847
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_258:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	INC $2001,X		  ; FE 01 20 | Increment (absolute,X)
	WDM #$49			 ; 42 49 | Reserved instruction

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_259
; Address: $CEC851
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_259:
	JSR $495B			; 20 5B 49 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $DF			  ; 90 DF | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_25A
; Address: $CEC85C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_25A:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C10F,Y		  ; B9 0F C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_25C
; Address: $CEC871
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_25C:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	INC $2001,X		  ; FE 01 20 | Increment (absolute,X)
	EOR #$80			 ; 49 80 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_25D
; Address: $CEC87D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_25D:
	JSR $4974			; 20 74 49 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_25E
; Address: $CEC885
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_25E:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	INC $C801,X		  ; FE 01 C8 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $CC			  ; 90 CC | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_25F
; Address: $CEC894
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_25F:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C10F,Y		  ; B9 0F C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_261
; Address: $CEC8A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_261:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	INC $2001,X		  ; FE 01 20 | Increment (absolute,X)
	EOR #$80			 ; 49 80 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_262
; Address: $CEC8B5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_262:
	JSR $497D			; 20 7D 49 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_263
; Address: $CEC8BD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_263:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	INC $C801,X		  ; FE 01 C8 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $CC			  ; 90 CC | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_265
; Address: $CEC8CD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_265:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_266
; Address: $CEC8E2
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_266:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_268
; Address: $CEC8E6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_268:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_269
; Address: $CEC8FB
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_269:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_26A
; Address: $CEC8FE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_26A:
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $C10F,X		  ; BD 0F C1 | Read graphics status
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	AND ($E8,X)		  ; 21 E8 | Logical AND with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $C10F,X		  ; BD 0F C1 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $18			  ; 80 18 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C10F,X		  ; 9D 0F C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_26C
; Address: $CEC92F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_26C:
	CLC				  ; 18 | Clear carry flag
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_26D
; Address: $CEC93F
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_26D:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_26E
; Address: $CEC942
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_26E:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $C10F,X		  ; DD 0F C1 | Compare accumulator (absolute,X)
	BEQ $08			  ; F0 08 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_26F
; Address: $CEC952
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_26F:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C10F,X		  ; 9D 0F C1 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_270
; Address: $CEC95B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_270:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $C0AF,X		  ; DD AF C0 | Compare accumulator (absolute,X)
	BEQ $08			  ; F0 08 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_271
; Address: $CEC96B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_271:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C0AF,X		  ; 9D AF C0 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_272
; Address: $CEC974
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_272:
	JSR $4986			; 20 86 49 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_273
; Address: $CEC97D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_273:
	JSR $4986			; 20 86 49 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_274
; Address: $CEC986
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_274:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $C0AF,X		  ; BD AF C0 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_275
; Address: $CEC98F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_275:
	BNE $0B			  ; D0 0B | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_276
; Address: $CEC99C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_276:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C0AF,X		  ; 9D AF C0 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_278
; Address: $CEC9A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_278:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_279
; Address: $CEC9B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_279:
	JSL $C44045		  ; 22 45 40 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_27A
; Address: $CEC9BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_27A:
	JSL $C43154		  ; 22 54 31 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_27C
; Address: $CEC9C7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_27C:
	LDA $3502			; AD 02 35 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C13D			; 8D 3D C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_27D
; Address: $CEC9D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_27D:
	PHA				  ; 48 | Push accumulator to stack
	LDA $3502			; AD 02 35 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_27E
; Address: $CEC9DF
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_27E:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_27F
; Address: $CEC9E2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_27F:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_280
; Address: $CEC9ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_280:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_28B
; Address: $CECA20
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_28B:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_28E
; Address: $CECA37
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_28E:
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_293
; Address: $CECA4A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_293:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D9E5,Y		  ; 99 E5 D9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_294
; Address: $CECA57
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_294:
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $DA25,Y		  ; B9 25 DA | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $D9E5,Y		  ; 79 E5 D9 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_295
; Address: $CECA6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_295:
	STA $DA25,Y		  ; 99 25 DA | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_296
; Address: $CECA7B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_296:
	JSL $C02271		  ; 22 71 22 C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F4			  ; D0 F4 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_297
; Address: $CECA85
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_297:
	STA $7FD6			; 8D D6 7F | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $DA25,Y		  ; B9 25 DA | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $D9E5,Y		  ; 79 E5 D9 | Add with carry (absolute,Y)
	STA $DA25,Y		  ; 99 25 DA | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_298
; Address: $CECAA5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_298:
	JSL $C022C1		  ; 22 C1 22 C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_299
; Address: $CECAAD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_299:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D9E5,Y		  ; 99 E5 D9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_29A
; Address: $CECABA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_29A:
	JSR $4B0A			; 20 0A 4B | Jump to subroutine
	BEQ $1C			  ; F0 1C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_29B
; Address: $CECAD5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_29B:
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $05			  ; F0 05 | Branch if equal
	DEX				  ; CA | Decrement X register
	BNE $E5			  ; D0 E5 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_29D
; Address: $CECADF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_29D:
	JSR $4B0A			; 20 0A 4B | Jump to subroutine
	BEQ $22			  ; F0 22 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BCS $18			  ; B0 18 | Branch if carry set
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	DEX				  ; CA | Decrement X register
	BNE $DF			  ; D0 DF | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_29F
; Address: $CECB0A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_29F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $DA25,Y		  ; B9 25 DA | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $D9E5,Y		  ; 79 E5 D9 | Add with carry (absolute,Y)
	STA $DA25,Y		  ; 99 25 DA | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A0
; Address: $CECB25
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A0:
	LDA $7F88			; AD 88 7F | Read graphics status
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A1
; Address: $CECB2F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A1:
	LDA $7F88			; AD 88 7F | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A3
; Address: $CECB39
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A3:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	LDA $D4E5,Y		  ; B9 E5 D4 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $F4			  ; 80 F4 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A4
; Address: $CECB52
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A4:
	LDA $99B9			; AD B9 99 | Read graphics status
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BNE $FC			  ; D0 FC | Branch if not equal
	INC $99B9			; EE B9 99 | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A7
; Address: $CECB6C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A7:
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7EA8,X		  ; 9D A8 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A8
; Address: $CECB7C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A8:
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7EA8,X		  ; 9D A8 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2A9
; Address: $CECB8C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2A9:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	BMI $04			  ; 30 04 | Branch if negative
	STA $D765,Y		  ; 99 65 D7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2AA
; Address: $CECB9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2AA:
	BRA $FE			  ; 80 FE | Branch always
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $C36D			; AD 6D C3 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2AC
; Address: $CECBA6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2AC:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $DAB7,X		  ; DD B7 DA | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2AD
; Address: $CECBB7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2AD:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	STA $D765,Y		  ; 99 65 D7 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2AE
; Address: $CECBC2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2AE:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $D765,Y		  ; 99 65 D7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2AF
; Address: $CECBCA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2AF:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	STA $D7A5,Y		  ; 99 A5 D7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B0
; Address: $CECBD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B0:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $C36D			; AD 6D C3 | Read graphics status
	STA $D7A5,Y		  ; 99 A5 D7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B1
; Address: $CECBE0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B1:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $DAB7,X		  ; DD B7 DA | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B2
; Address: $CECBF1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B2:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	STA $D7A5,Y		  ; 99 A5 D7 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B3
; Address: $CECBFC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B3:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $D7A5,Y		  ; 99 A5 D7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B5
; Address: $CECC08
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B5:
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B6
; Address: $CECC1A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B6:
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B7
; Address: $CECC1D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B7:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $30			  ; D0 30 | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	BMI $2B			  ; 30 2B | Branch if negative
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	BMI $1A			  ; 30 1A | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	BMI $07			  ; 30 07 | Branch if negative
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $02			  ; B0 02 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2B9
; Address: $CECC60
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2B9:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2BA
; Address: $CECC6C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2BA:
	AND #$DF			 ; 29 DF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2BB
; Address: $CECC73
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2BB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2BC
; Address: $CECC86
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2BC:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2BE
; Address: $CECCA3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2BE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2BF
; Address: $CECCB6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2BF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	AND $C4			  ; 25 C4 | Logical AND with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2C1
; Address: $CECCD0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2C1:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $EA23			; 8D 23 EA | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $EA21			; 8D 21 EA | Update graphics data
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2C3
; Address: $CECCF1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2C3:
	JSL $C63343		  ; 22 43 33 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2C4
; Address: $CECCF7
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2C4:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $EA23			; 8D 23 EA | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $EA21			; 8D 21 EA | Update graphics data
	LDA $CF65,X		  ; BD 65 CF | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2C6
; Address: $CECD21
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2C6:
	JSL $C63343		  ; 22 43 33 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2C7
; Address: $CECD27
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2C7:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $EA23			; 8D 23 EA | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $EA21			; 8D 21 EA | Update graphics data
	LDA $CF65,Y		  ; B9 65 CF | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2CA
; Address: $CECD48
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2CA:
	JSL $C63343		  ; 22 43 33 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2CB
; Address: $CECD4E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2CB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CF65,Y		  ; B9 65 CF | Read graphics status
	STA $C18D			; 8D 8D C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2CC
; Address: $CECD5E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2CC:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2CD
; Address: $CECD71
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2CD:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $99			  ; 10 99 | Branch if positive
	LDA $C3			  ; A5 C3 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2CE
; Address: $CECD87
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2CE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D0
; Address: $CECD9D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D0:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D1
; Address: $CECDA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D1:
	LDA #$FF			 ; A9 FF | Read graphics status
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BMI $99			  ; 30 99 | Branch if negative
	LDA $C3			  ; A5 C3 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D2
; Address: $CECDB3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D2:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C665,Y		  ; 99 65 C6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D3
; Address: $CECDC1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D3:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $CFE5,Y		  ; 99 E5 CF | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D4
; Address: $CECDCE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D4:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$08			 ; A9 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D5
; Address: $CECDE8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D5:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D6
; Address: $CECDFB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D6:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$10			 ; A9 10 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D7
; Address: $CECE0A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D7:
	PHA				  ; 48 | Push accumulator to stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2D9
; Address: $CECE19
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2D9:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2DB
; Address: $CECE30
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2DB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$40			 ; A9 40 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2DC
; Address: $CECE4A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2DC:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2DD
; Address: $CECE5D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2DD:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $CDA5,Y		  ; 99 A5 CD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2DE
; Address: $CECE6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2DE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2DF
; Address: $CECE72
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2DF:
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$04			 ; A9 04 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E0
; Address: $CECE84
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E0:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E1
; Address: $CECE97
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E1:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E2
; Address: $CECEAA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E2:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E3
; Address: $CECEC0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E3:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E4
; Address: $CECED3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E4:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E5
; Address: $CECEDA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E5:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$80			 ; A9 80 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E6
; Address: $CECEE9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E6:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E8
; Address: $CECEFE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E8:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2E9
; Address: $CECF11
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2E9:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$20			 ; A9 20 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C425,Y		  ; 39 25 C4 | Logical AND with accumulator (absolute,Y)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2EA
; Address: $CECF27
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2EA:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2EB
; Address: $CECF3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2EB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2EC
; Address: $CECF41
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2EC:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$10			 ; A9 10 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C425,Y		  ; 39 25 C4 | Logical AND with accumulator (absolute,Y)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2ED
; Address: $CECF50
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2ED:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2EE
; Address: $CECF63
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2EE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2EF
; Address: $CECF79
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2EF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ORA $C3E5,Y		  ; 19 E5 C3 | Logical OR with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F0
; Address: $CECF89
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F0:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3E5,Y		  ; 39 E5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F1
; Address: $CECF9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F1:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F2
; Address: $CECFA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F2:
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F3
; Address: $CECFAF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F3:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3E5,Y		  ; 39 E5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F4
; Address: $CECFC5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F4:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $99			  ; 10 99 | Branch if positive
	SBC $C3			  ; E5 C3 | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F5
; Address: $CECFD8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F5:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	BPL $49			  ; 10 49 | Branch if positive
	AND $C3E5,Y		  ; 39 E5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F6
; Address: $CECFEE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F6:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2F8
; Address: $CED001
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2F8:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FA
; Address: $CED010
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FA:
	AND $C3E5,Y		  ; 39 E5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FB
; Address: $CED017
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FB:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FC
; Address: $CED02A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FC:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3E5,Y		  ; 39 E5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FD
; Address: $CED040
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FD:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FE
; Address: $CED053
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FE:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$02			 ; A9 02 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C425,Y		  ; 39 25 C4 | Logical AND with accumulator (absolute,Y)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_2FF
; Address: $CED069
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_2FF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_301
; Address: $CED07C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_301:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$08			 ; A9 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C425,Y		  ; 39 25 C4 | Logical AND with accumulator (absolute,Y)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_302
; Address: $CED092
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_302:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_304
; Address: $CED0A7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_304:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_306
; Address: $CED0BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_306:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_307
; Address: $CED0C5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_307:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $C8E5,Y		  ; 99 E5 C8 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_308
; Address: $CED0CD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_308:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C8E5,Y		  ; B9 E5 C8 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_309
; Address: $CED0D9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_309:
	JSL $C61F4E		  ; 22 4E 1F C6 | Jump to subroutine long
	STA $C135			; 8D 35 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_30A
; Address: $CED0E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_30A:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_30C
; Address: $CED0EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_30C:
	JSL $C64973		  ; 22 73 49 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $C965,Y		  ; 99 65 C9 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_30F
; Address: $CED100
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_30F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_311
; Address: $CED10E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_311:
	JSL $C64973		  ; 22 73 49 C6 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF 2E 51 C7 | Read graphics status
	STA $CEA5,Y		  ; 99 A5 CE | Update graphics data
	LDA				  ; BF 32 51 C7 | Read graphics status
	STA $CE65,Y		  ; 99 65 CE | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_315
; Address: $CED12E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_315:
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C6A5,Y		  ; B9 A5 C6 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C133			; 8D 33 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_316
; Address: $CED149
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_316:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_317
; Address: $CED151
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_317:
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C7A5,Y		  ; B9 A5 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C131			; 8D 31 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_318
; Address: $CED15A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_318:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	CMP $C7A5,Y		  ; D9 A5 C7 | Compare accumulator (absolute,Y)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31A
; Address: $CED16D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31A:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $C7E5,Y		  ; 99 E5 C7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31B
; Address: $CED17B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31B:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C7A5,Y		  ; B9 A5 C7 | Read graphics status
	STA $C7E5,Y		  ; 99 E5 C7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31C
; Address: $CED18C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31C:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31D
; Address: $CED1A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31D:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31E
; Address: $CED1AB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31E:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D3A5,Y		  ; B9 A5 D3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $19			  ; F0 19 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $CFA5,X		  ; BD A5 CF | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF CF 51 C7 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_31F
; Address: $CED1D1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_31F:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C11D			; 8D 1D C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_320
; Address: $CED1F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_320:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_322
; Address: $CED203
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_322:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_325
; Address: $CED219
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_325:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_327
; Address: $CED22F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_327:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_329
; Address: $CED245
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_329:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_32A
; Address: $CED258
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_32A:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_32C
; Address: $CED26F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_32C:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_32D
; Address: $CED281
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_32D:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$00			 ; A9 00 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $C3A5,Y		  ; 39 A5 C3 | Logical AND with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_32E
; Address: $CED297
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_32E:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D065,Y		  ; 99 65 D0 | Update graphics data
	STA $D0A5,Y		  ; 99 A5 D0 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_32F
; Address: $CED2A7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_32F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_330
; Address: $CED2BA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_330:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_331
; Address: $CED2C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_331:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_332
; Address: $CED2D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_332:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C5A5,Y		  ; 99 A5 C5 | Update graphics data
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_333
; Address: $CED2DD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_333:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C39B,Y		  ; B9 9B C3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $C39B,Y		  ; 99 9B C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_334
; Address: $CED2F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_334:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_336
; Address: $CED305
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_336:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_338
; Address: $CED313
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_338:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_33A
; Address: $CED321
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_33A:
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_33C
; Address: $CED332
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_33C:
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D7A5,Y		  ; B9 A5 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_33F
; Address: $CED346
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_33F:
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_341
; Address: $CED354
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_341:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D7A5,X		  ; BD A5 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_343
; Address: $CED365
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_343:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	ORA $293A			; 0D 3A 29 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BCS $05			  ; B0 05 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_344
; Address: $CED39D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_344:
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_345
; Address: $CED3A2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_345:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_346
; Address: $CED3A7
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_346:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	ORA $293A			; 0D 3A 29 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BCS $05			  ; B0 05 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_347
; Address: $CED3DA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_347:
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_348
; Address: $CED3DF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_348:
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DA65,Y		  ; B9 65 DA | Read graphics status
	STA $D3A5,X		  ; 9D A5 D3 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34A
; Address: $CED3F6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34A:
	TAX				  ; AA | Transfer accumulator to X register
	LDA $350C,X		  ; BD 0C 35 | Read graphics status
	STA $26			  ; 85 26 | Update graphics data
	LDA $3518,X		  ; BD 18 35 | Read graphics status
	STA $28			  ; 85 28 | Update graphics data
	LDA				  ; BF 2A 54 C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34B
; Address: $CED40B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34B:
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $DAA5			; AD A5 DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34C
; Address: $CED418
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34C:
	JSL $C6584A		  ; 22 4A 58 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	CPX $DB05			; EC 05 DB | Compare X register (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34D
; Address: $CED430
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34D:
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34E
; Address: $CED446
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34E:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_34F
; Address: $CED44F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_34F:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	STA $D625,Y		  ; 99 25 D6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_350
; Address: $CED45D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_350:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_351
; Address: $CED466
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_351:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	STA $D625,Y		  ; 99 25 D6 | Update graphics data
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_352
; Address: $CED474
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_352:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_353
; Address: $CED47E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_353:
	JSL $C7553C		  ; 22 3C 55 C7 | Jump to subroutine long
	STA $D625,Y		  ; 99 25 D6 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_354
; Address: $CED486
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_354:
	JSL $C75526		  ; 22 26 55 C7 | Jump to subroutine long
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_356
; Address: $CED48F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_356:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_357
; Address: $CED49F
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_357:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	JMP $5474			; 4C 74 54 | Jump to address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAB7,X		  ; BD B7 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $1F			  ; 80 1F | Branch always
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,X		  ; BD E5 C5 | Read graphics status
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $C625,X		  ; BD 25 C6 | Read graphics status
	STA $D625,Y		  ; 99 25 D6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_359
; Address: $CED4E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_359:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35A
; Address: $CED4F2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35A:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC $C5E5,Y		  ; 79 E5 C5 | Add with carry (absolute,Y)
	STA $D6A5,Y		  ; 99 A5 D6 | Update graphics data
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ADC $D6			  ; 65 D6 | Add with carry (zero page)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC $C625,Y		  ; 79 25 C6 | Add with carry (absolute,Y)
	STA $D725,Y		  ; 99 25 D7 | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	SBC $D6			  ; E5 D6 | Subtract with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35B
; Address: $CED519
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35B:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D665,Y		  ; 99 65 D6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35C
; Address: $CED526
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35C:
	PHA				  ; 48 | Push accumulator to stack
	LDA $C6A5,Y		  ; B9 A5 C6 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $9A0F,X		  ; BD 0F 9A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35D
; Address: $CED53C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35D:
	PHA				  ; 48 | Push accumulator to stack
	LDA $C6A5,Y		  ; B9 A5 C6 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $9A17,X		  ; BD 17 9A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35E
; Address: $CED54C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35E:
	SBC $C925,Y		  ; F9 25 C9 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_35F
; Address: $CED556
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_35F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	STA $C125			; 8D 25 C1 | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	STA $C127			; 8D 27 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_360
; Address: $CED56C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_360:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C6A5,Y		  ; B9 A5 C6 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC $9A0F,X		  ; FD 0F 9A | Subtract with carry (absolute,X)
	STA $C129			; 8D 29 C1 | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC $9A17,X		  ; FD 17 9A | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $C12B			; 8D 2B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_361
; Address: $CED59A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_361:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $C665,Y		  ; BE 65 C6 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_362
; Address: $CED5A6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_362:
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	SEC				  ; 38 | Set carry flag
	JMP ($7FE3)		  ; 6C E3 7F | Jump to address (absolute indirect)
	STA $C12D			; 8D 2D C1 | Update graphics data
	BCC $19			  ; 90 19 | Branch if carry clear
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	STA $C12F			; 8D 2F C1 | Update graphics data
	BCC $07			  ; 90 07 | Branch if carry clear
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $02			  ; B0 02 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_364
; Address: $CED5CE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_364:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_365
; Address: $CED5DF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_365:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	INC				  ; 1A | Increment accumulator
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_366
; Address: $CED5F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_366:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_367
; Address: $CED601
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_367:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_368
; Address: $CED60D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_368:
	INC				  ; 1A | Increment accumulator
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_369
; Address: $CED612
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_369:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $C5E5,Y		  ; 79 E5 C5 | Add with carry (absolute,Y)
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $C625,Y		  ; 79 25 C6 | Add with carry (absolute,Y)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_36A
; Address: $CED62B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_36A:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $00			  ; A5 00 | Read graphics status
	STA $D565,Y		  ; 99 65 D5 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D5A5,Y		  ; 99 A5 D5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_36B
; Address: $CED662
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_36B:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_36E
; Address: $CED674
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_36E:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP $0000,X		  ; DD 00 00 | Compare accumulator (absolute,X)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_371
; Address: $CED68C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_371:
	JSL $C04911		  ; 22 11 49 C0 | Jump to subroutine long
	STZ $DB0F			; 9C 0F DB | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_372
; Address: $CED694
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_372:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D865,Y		  ; 99 65 D8 | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $D8A5,Y		  ; 99 A5 D8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D8E5,Y		  ; 99 E5 D8 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_373
; Address: $CED6BA
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_373:
	STZ $1C			  ; 64 1C | Store zero to zero page
	STZ $20			  ; 64 20 | Store zero to zero page
	STZ $1E			  ; 64 1E | Store zero to zero page
	STZ $22			  ; 64 22 | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $D865,X		  ; BD 65 D8 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$C7			 ; A9 C7 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $D8E5,X		  ; BD E5 D8 | Read graphics status
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $D8A5,X		  ; BD A5 D8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $D8A5,X		  ; 9D A5 D8 | Update graphics data
	LDA $D8A5,X		  ; BD A5 D8 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_374
; Address: $CED6EA
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_374:
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$02			 ; A9 02 | Read graphics status
	STA $D8A5,X		  ; 9D A5 D8 | Update graphics data
	BRA $EC			  ; 80 EC | Branch always
	LDA $D8E5,X		  ; BD E5 D8 | Read graphics status
	BNE $08			  ; D0 08 | Branch if not equal
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D8E5,X		  ; 9D E5 D8 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	EOR $1C			  ; 45 1C | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	EOR $20			  ; 45 20 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $22			  ; 65 22 | Add with carry (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AB BE C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	LDA $D8E5,Y		  ; B9 E5 D8 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $D8E5,Y		  ; 99 E5 D8 | Update graphics data
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $D8A5,Y		  ; B9 A5 D8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_375
; Address: $CED75A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_375:
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_378
; Address: $CED76A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_378:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_37C
; Address: $CED784
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_37C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_37F
; Address: $CED79C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_37F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $D525,Y		  ; 99 25 D5 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_380
; Address: $CED7AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_380:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_382
; Address: $CED7BD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_382:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_385
; Address: $CED7D5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_385:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_387
; Address: $CED7E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_387:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_389
; Address: $CED7F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_389:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	INC $0003,X		  ; FE 03 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_38C
; Address: $CED80E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_38C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_391
; Address: $CED829
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_391:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_395
; Address: $CED843
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_395:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_399
; Address: $CED861
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_399:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_39B
; Address: $CED873
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_39B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3A1
; Address: $CED89D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3A1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3A3
; Address: $CED8AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3A3:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	INC $0003,X		  ; FE 03 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3A6
; Address: $CED8C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3A6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B0
; Address: $CED908
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B0:
	JSR $5D0D			; 20 0D 5D | Jump to subroutine
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B3
; Address: $CED929
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B3:
	JSL $C63991		  ; 22 91 39 C6 | Jump to subroutine long
	JMP $58EE			; 4C EE 58 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B4
; Address: $CED934
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B4:
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	BRA $06			  ; 80 06 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $37			  ; F0 37 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $DA65,X		  ; DD 65 DA | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$52			 ; E0 52 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $06			  ; 80 06 | Branch always
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $DA65,X		  ; 9D 65 DA | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B6
; Address: $CED965
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B6:
	JSL $C64973		  ; 22 73 49 C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B7
; Address: $CED972
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B7:
	JSL $C09185		  ; 22 85 91 C0 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7DE8,Y		  ; 99 E8 7D | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3B9
; Address: $CED981
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3B9:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3BC
; Address: $CED991
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3BC:
	JSR $5A3F			; 20 3F 5A | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3BD
; Address: $CED997
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3BD:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3C1
; Address: $CED9A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3C1:
	JSR $5A3F			; 20 3F 5A | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3C2
; Address: $CED9AD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3C2:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3C5
; Address: $CED9BD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3C5:
	JSR $5A3F			; 20 3F 5A | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3C6
; Address: $CED9C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3C6:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3C9
; Address: $CED9D3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3C9:
	JSR $5E2C			; 20 2C 5E | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3CE
; Address: $CED9EA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3CE:
	LDA $C5E5,X		  ; BD E5 C5 | Read graphics status
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	LDA $C625,X		  ; BD 25 C6 | Read graphics status
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	LDA $C6A5,X		  ; BD A5 C6 | Read graphics status
	STA $C6A5,Y		  ; 99 A5 C6 | Update graphics data
	LDA $C6E5,X		  ; BD E5 C6 | Read graphics status
	STA $C6E5,Y		  ; 99 E5 C6 | Update graphics data
	LDA $C725,X		  ; BD 25 C7 | Read graphics status
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	LDA $C765,X		  ; BD 65 C7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3CF
; Address: $CEDA0B
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3CF:
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	LDA $C7A5,X		  ; BD A5 C7 | Read graphics status
	STA $C7A5,Y		  ; 99 A5 C7 | Update graphics data
	LDA $C7E5,X		  ; BD E5 C7 | Read graphics status
	STA $C7E5,Y		  ; 99 E5 C7 | Update graphics data
	LDA $C825,X		  ; BD 25 C8 | Read graphics status
	STA $C825,Y		  ; 99 25 C8 | Update graphics data
	LDA $C865,X		  ; BD 65 C8 | Read graphics status
	STA $C865,Y		  ; 99 65 C8 | Update graphics data
	LDA $C8A5,X		  ; BD A5 C8 | Read graphics status
	STA $C8A5,Y		  ; 99 A5 C8 | Update graphics data
	LDA $CEE5,X		  ; BD E5 CE | Read graphics status
	STA $CEE5,Y		  ; 99 E5 CE | Update graphics data
	LDA $D125,X		  ; BD 25 D1 | Read graphics status
	STA $D125,Y		  ; 99 25 D1 | Update graphics data
	LDA $C8E5,X		  ; BD E5 C8 | Read graphics status
	STA $C8E5,Y		  ; 99 E5 C8 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D3
; Address: $CEDA4B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D3:
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $D765,Y		  ; 99 65 D7 | Update graphics data
	STA $D7A5,Y		  ; 99 A5 D7 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $9877			; 0D 77 98 | Logical OR with accumulator (absolute)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	LDA $9879			; AD 79 98 | Read graphics status
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C8A5,Y		  ; 99 A5 C8 | Update graphics data
	STA $D0E5,Y		  ; 99 E5 D0 | Update graphics data
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	STA $C7A5,Y		  ; 99 A5 C7 | Update graphics data
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	STA $C6A5,Y		  ; 99 A5 C6 | Update graphics data
	STA $C6E5,Y		  ; 99 E5 C6 | Update graphics data
	STA $C7E5,Y		  ; 99 E5 C7 | Update graphics data
	STA $C865,Y		  ; 99 65 C8 | Update graphics data
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	STA $C825,Y		  ; 99 25 C8 | Update graphics data
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	STA $D3E5,Y		  ; 99 E5 D3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D4
; Address: $CEDA9A
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D4:
	STA $D425,Y		  ; 99 25 D4 | Update graphics data
	STA $D465,Y		  ; 99 65 D4 | Update graphics data
	STA $D4A5,Y		  ; 99 A5 D4 | Update graphics data
	STA $D4E5,Y		  ; 99 E5 D4 | Update graphics data
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	STA $D625,Y		  ; 99 25 D6 | Update graphics data
	STA $D1E5,Y		  ; 99 E5 D1 | Update graphics data
	STA $D225,Y		  ; 99 25 D2 | Update graphics data
	STA $D265,Y		  ; 99 65 D2 | Update graphics data
	STA $D2A5,Y		  ; 99 A5 D2 | Update graphics data
	STA $D2E5,Y		  ; 99 E5 D2 | Update graphics data
	STA $D825,Y		  ; 99 25 D8 | Update graphics data
	STA $D865,Y		  ; 99 65 D8 | Update graphics data
	STA $D8A5,Y		  ; 99 A5 D8 | Update graphics data
	STA $D8E5,Y		  ; 99 E5 D8 | Update graphics data
	STA $D925,Y		  ; 99 25 D9 | Update graphics data
	STA $D965,Y		  ; 99 65 D9 | Update graphics data
	STA $D9A5,Y		  ; 99 A5 D9 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $C665,Y		  ; 99 65 C6 | Update graphics data
	LDA $9875			; AD 75 98 | Read graphics status
	STA $CFE5,Y		  ; 99 E5 CF | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $C925,Y		  ; 99 25 C9 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $99			  ; 30 99 | Branch if negative
	AND $D0			  ; 25 D0 | Logical AND with accumulator (zero page)
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D5
; Address: $CEDAEB
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D5:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $C8E5,Y		  ; 99 E5 C8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D525,Y		  ; 99 25 D5 | Update graphics data
	LDA #$5E			 ; A9 5E | Read graphics status
	LDY $6599			; AC 99 65 | Load from absolute address into Y register
	LDA #$CD			 ; A9 CD | Read graphics status
	STA $D5A5,Y		  ; 99 A5 D5 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	STA $C4E5,Y		  ; 99 E5 C4 | Update graphics data
	STA $C565,Y		  ; 99 65 C5 | Update graphics data
	STA $C5A5,Y		  ; 99 A5 C5 | Update graphics data
	STA $D325,Y		  ; 99 25 D3 | Update graphics data
	STA $D7E5,Y		  ; 99 E5 D7 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C525,Y		  ; 99 25 C5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D665,Y		  ; 99 65 D6 | Update graphics data
	STA $D6E5,Y		  ; 99 E5 D6 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D6A5,Y		  ; 99 A5 D6 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D6
; Address: $CEDB2E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D6:
	STA $D725,Y		  ; 99 25 D7 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $CF25,Y		  ; 99 25 CF | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $CF65,Y		  ; 99 65 CF | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $DA25,Y		  ; 99 25 DA | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	SBC $D9			  ; E5 D9 | Subtract with carry (zero page)
	LDA $9871			; AD 71 98 | Read graphics status
	STA $D065,Y		  ; 99 65 D0 | Update graphics data
	STA $D0A5,Y		  ; 99 A5 D0 | Update graphics data
	LDA #$3C			 ; A9 3C | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D7
; Address: $CEDB55
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D7:
	JSR $5F27			; 20 27 5F | Jump to subroutine
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D125,Y		  ; 99 25 D1 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $CDA5,Y		  ; 99 A5 CD | Update graphics data
	LDA #$09			 ; A9 09 | Read graphics status
	STA $CDE5,Y		  ; 99 E5 CD | Update graphics data
	LDA #$06			 ; A9 06 | Read graphics status
	STA $CE25,Y		  ; 99 25 CE | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $CE65,Y		  ; 99 65 CE | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $CEA5,Y		  ; 99 A5 CE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C965,Y		  ; 99 65 C9 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3D9
; Address: $CEDB87
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3D9:
	JSR $5F27			; 20 27 5F | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C8E5,Y		  ; 99 E5 C8 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $C3E5,Y		  ; 99 E5 C3 | Update graphics data
	LDA $DAF7			; AD F7 DA | Read graphics status
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $11			  ; D0 11 | Branch if not equal
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3DB
; Address: $CEDBBD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3DB:
	JSL $C759D9		  ; 22 D9 59 C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	BRA $21			  ; 80 21 | PPU graphics register access
	LDA $985C			; AD 5C 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E1
; Address: $CEDBE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E1:
	JSR $5E2C			; 20 2C 5E | Jump to subroutine
	LDX $DAF7			; AE F7 DA | Load from absolute address into X register
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E2
; Address: $CEDBED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E2:
	JSL $C091C9		  ; 22 C9 91 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E3
; Address: $CEDBF5
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E3:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $305C1D		  ; 5C 1D 5C 30 | Jump to address long
	JMP $00FCAA		  ; 5C AA FC 00 | Jump to address long
	JMP $5C3960		  ; 5C 60 39 5C | Jump to address long
	ROR $6E5C			; 6E 5C 6E | Rotate right (absolute)
	JMP $6E5C6E		  ; 5C 6E 5C 6E | Jump to address long
	JMP $0FFCAA		  ; 5C AA FC 0F | Jump to address long
	JMP $5C3960		  ; 5C 60 39 5C | Jump to address long
	ROR $6E5C			; 6E 5C 6E | Rotate right (absolute)
	JMP $6E5C6E		  ; 5C 6E 5C 6E | Jump to address long
	JMP $6E5C6E		  ; 5C 6E 5C 6E | Jump to address long
	JMP $22FCAA		  ; 5C AA FC 22 | Jump to address long
	JMP $5C3960		  ; 5C 60 39 5C | Jump to address long
	ROR $6E5C			; 6E 5C 6E | Rotate right (absolute)
	JMP $6E5C6E		  ; 5C 6E 5C 6E | Jump to address long
	JMP $B65CA0		  ; 5C A0 5C B6 | Jump to address long
	JMP $35FCAA		  ; 5C AA FC 35 | Jump to address long
	JMP $5C3960		  ; 5C 60 39 5C | Jump to address long
	ROR $A95C			; 6E 5C A9 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $CDE5,Y		  ; 99 E5 CD | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $CE25,Y		  ; 99 25 CE | Update graphics data
	LDA #$06			 ; A9 06 | Read graphics status
	STA $CE65,Y		  ; 99 65 CE | Update graphics data
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E5
; Address: $CEDC59
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E5:
	JSR $E599			; 20 99 E5 | Jump to subroutine
	PHY				  ; 5A | Push Y register to stack
	LDA #$8B			 ; A9 8B | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$7E			 ; A0 7E | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E8
; Address: $CEDC6E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E8:
	JSR $5CCC			; 20 CC 5C | Jump to subroutine
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA $DAA3,X		  ; BD A3 DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA #$1F			 ; A9 1F | Read graphics status
	LDY #$CC			 ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3E9
; Address: $CEDC81
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3E9:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3EA
; Address: $CEDC87
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3EA:
	JSR $5CCC			; 20 CC 5C | Jump to subroutine
	ORA $AA			  ; 05 AA | Logical OR with accumulator (zero page)
	LDA $DA9F,X		  ; BD 9F DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA #$1F			 ; A9 1F | Read graphics status
	LDY #$CC			 ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3EB
; Address: $CEDC9A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3EB:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3EC
; Address: $CEDCA0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3EC:
	JSR $5CCC			; 20 CC 5C | Jump to subroutine
	LDA $DAA9			; AD A9 DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA #$3C			 ; A9 3C | Read graphics status
	LDY #$CC			 ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3ED
; Address: $CEDCB0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3ED:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3EE
; Address: $CEDCB6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3EE:
	JSR $5CCC			; 20 CC 5C | Jump to subroutine
	LDA $DAA9			; AD A9 DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA #$59			 ; A9 59 | Read graphics status
	LDY #$CC			 ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3EF
; Address: $CEDCC6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3EF:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F1
; Address: $CEDCCF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F1:
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $C3			  ; A5 C3 | Read graphics status
	LDA #$0C			 ; A9 0C | Read graphics status
	STA $C965,Y		  ; 99 65 C9 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $CDE5,Y		  ; 99 E5 CD | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $CE25,Y		  ; 99 25 CE | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $CE65,Y		  ; 99 65 CE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F2
; Address: $CEDCF4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F2:
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DA65,Y		  ; B9 65 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ADC $DA			  ; 65 DA | Add with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F3
; Address: $CEDD0B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F3:
	BRA $FE			  ; 80 FE | Branch always
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F4
; Address: $CEDD1F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F4:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F5
; Address: $CEDD26
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F5:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $D565,X		  ; 9D 65 D5 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D5A5,X		  ; 9D A5 D5 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F7
; Address: $CEDD3C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F7:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$80			 ; A9 80 | Read graphics status
	ORA $C3A5,Y		  ; 19 A5 C3 | Logical OR with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F8
; Address: $CEDD4B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F8:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $EA21			; 8D 21 EA | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $EA23			; 8D 23 EA | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3F9
; Address: $CEDD5A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3F9:
	JSL $C632F8		  ; 22 F8 32 C6 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FA
; Address: $CEDD60
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FA:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FB
; Address: $CEDD65
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FB:
	LDA #$00			 ; A9 00 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C6A5,Y		  ; 99 A5 C6 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FC
; Address: $CEDD6F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FC:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C7A5,Y		  ; 99 A5 C7 | Update graphics data
	STA $C7E5,Y		  ; 99 E5 C7 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $C6A5,Y		  ; 79 A5 C6 | Add with carry (absolute,Y)
	STA $C6E5,Y		  ; 99 E5 C6 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FD
; Address: $CEDD7E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FD:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A61,X		  ; FD 61 9A | Subtract with carry (absolute,X)
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ADC $9A0F,X		  ; 7D 0F 9A | Add with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FE
; Address: $CEDD9A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FE:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A0F,X		  ; FD 0F 9A | Subtract with carry (absolute,X)
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A61,X		  ; FD 61 9A | Subtract with carry (absolute,X)
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_3FF
; Address: $CEDDB6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_3FF:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $9A61,X		  ; 7D 61 9A | Add with carry (absolute,X)
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ADC $9A0F,X		  ; 7D 0F 9A | Add with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C5E5,Y		  ; 99 E5 C5 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_400
; Address: $CEDDD2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_400:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A81,X		  ; FD 81 9A | Subtract with carry (absolute,X)
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ADC $9A17,X		  ; 7D 17 9A | Add with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_401
; Address: $CEDDF0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_401:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A17,X		  ; FD 17 9A | Subtract with carry (absolute,X)
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $9A81,X		  ; FD 81 9A | Subtract with carry (absolute,X)
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_402
; Address: $CEDE0E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_402:
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $9A81,X		  ; 7D 81 9A | Add with carry (absolute,X)
	LDX $C6A5,Y		  ; BE A5 C6 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ADC $9A17,X		  ; 7D 17 9A | Add with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_403
; Address: $CEDE2C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_403:
	PHX				  ; DA | Push X register to stack
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $2D			  ; D0 2D | Branch if not equal
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $9AE1,X		  ; BD E1 9A | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $04			  ; 85 04 | Update graphics data
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_404
; Address: $CEDE45
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_404:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDX $C6E5,Y		  ; BE E5 C6 | Load from absolute,Y into X register
	LDA $04			  ; A5 04 | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_405
; Address: $CEDE4F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_405:
	ADC $C725,Y		  ; 79 25 C7 | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $9A41,X		  ; 7D 41 9A | Add with carry (absolute,X)
	STA $C825,Y		  ; 99 25 C8 | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	STA $CEE5,Y		  ; 99 E5 CE | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_406
; Address: $CEDE63
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_406:
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	AND $9C03			; 2D 03 9C | Logical AND with accumulator (absolute)
	STA $C765,Y		  ; 99 65 C7 | Update graphics data
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	AND $9C01			; 2D 01 9C | Logical AND with accumulator (absolute)
	STA $C725,Y		  ; 99 25 C7 | Update graphics data
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_407
; Address: $CEDE7F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_407:
	JSL $C65394		  ; 22 94 53 C6 | Jump to subroutine long
	STA $C8A5,Y		  ; 99 A5 C8 | Update graphics data
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $04			  ; 85 04 | Update graphics data
	LDA $9AE1			; AD E1 9A | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $9AE1			; AD E1 9A | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	BRA $05			  ; 80 05 | Branch always
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	CLC				  ; 18 | Clear carry flag
	ADC $04			  ; 65 04 | Add with carry (zero page)
	STA $04			  ; 85 04 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $C825,Y		  ; 99 25 C8 | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_408
; Address: $CEDEC2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_408:
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D2 5E C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C865,Y		  ; 99 65 C8 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_409
; Address: $CEDED2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_409:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BRA $22			  ; 80 22 | Branch always
	DEC $99			  ; C6 99 | Decrement (zero page)
	SBC $C8			  ; E5 C8 | Subtract with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_40A
; Address: $CEDEE2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_40A:
	STA $D065,Y		  ; 99 65 D0 | Update graphics data
	STA $D0A5,Y		  ; 99 A5 D0 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_40B
; Address: $CEDEE9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_40B:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$04			 ; A9 04 | Read graphics status
	ORA $C3A5,Y		  ; 19 A5 C3 | Logical OR with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_40C
; Address: $CEDEF8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_40C:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$08			 ; A9 08 | Read graphics status
	ORA $C3A5,Y		  ; 19 A5 C3 | Logical OR with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_40D
; Address: $CEDF07
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_40D:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$10			 ; A9 10 | Read graphics status
	ORA $C3A5,Y		  ; 19 A5 C3 | Logical OR with accumulator (absolute,Y)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_411
; Address: $CEDF20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_411:
	JSL $C64CA2		  ; 22 A2 4C C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_412
; Address: $CEDF27
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_412:
	PHX				  ; DA | Push X register to stack
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC #$12			 ; 69 12 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF FF BF C8 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_413
; Address: $CEDF34
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_413:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D365,Y		  ; 99 65 D3 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_414
; Address: $CEDF3C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_414:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_415
; Address: $CEDF49
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_415:
	LDA $99B9			; AD B9 99 | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BNE $FC			  ; D0 FC | Branch if not equal
	LDY #$3C			 ; A0 3C | Load immediate value into Y register
	LDA $DB1D			; AD 1D DB | Read graphics status
	BEQ $04			  ; F0 04 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BNE $F7			  ; D0 F7 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_417
; Address: $CEDF6B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_417:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_418
; Address: $CEDF7F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_418:
	LDA ($5F,X)		  ; A1 5F | Read graphics status
	BCS $5F			  ; B0 5F | Branch if carry set
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CMP $D6E5,Y		  ; D9 E5 D6 | Compare accumulator (absolute,Y)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_419
; Address: $CEDF92
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_419:
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CMP $D6A5,Y		  ; D9 A5 D6 | Compare accumulator (absolute,Y)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_41A
; Address: $CEDFA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_41A:
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	CMP $D725,Y		  ; D9 25 D7 | Compare accumulator (absolute,Y)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_41C
; Address: $CEDFB0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_41C:
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	CMP $D665,Y		  ; D9 65 D6 | Compare accumulator (absolute,Y)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_41D
; Address: $CEDFBF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_41D:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_41E
; Address: $CEDFC8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_41E:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	LDA $D5E5,Y		  ; B9 E5 D5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BEQ $0C			  ; F0 0C | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $21			  ; 80 21 | PPU graphics register access
	LDA #$03			 ; A9 03 | Read graphics status
	BRA $1C			  ; 80 1C | Branch always
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	LDA $D625,Y		  ; B9 25 D6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_41F
; Address: $CEE00B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_41F:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_420
; Address: $CEE013
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_420:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_422
; Address: $CEE020
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_422:
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	LDA $D625,Y		  ; B9 25 D6 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BEQ $0C			  ; F0 0C | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $21			  ; 80 21 | PPU graphics register access
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $1C			  ; 80 1C | Branch always
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $18			  ; 85 18 | Update graphics data
	LDA $D5E5,Y		  ; B9 E5 D5 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_423
; Address: $CEE05F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_423:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_424
; Address: $CEE067
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_424:
	JSR $6083			; 20 83 60 | Jump to subroutine
	LDA $DB11			; AD 11 DB | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_426
; Address: $CEE075
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_426:
	JSR $6083			; 20 83 60 | Jump to subroutine
	LDA $DB13			; AD 13 DB | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_428
; Address: $CEE083
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_428:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_429
; Address: $CEE08D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_429:
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_42A
; Address: $CEE092
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_42A:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C5E5,X		  ; BD E5 C5 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	LDA $C925,X		  ; BD 25 C9 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1C			  ; 85 1C | Update graphics data
	LDA $C625,X		  ; BD 25 C6 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_42C
; Address: $CEE0AD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_42C:
	CMP $60			  ; C5 60 | Compare accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_42E
; Address: $CEE0B3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_42E:
	LDA $18			  ; A5 18 | Read graphics status
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $D625,Y		  ; 99 25 D6 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_430
; Address: $CEE0C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_430:
	LDA $18			  ; A5 18 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $D625,Y		  ; 99 25 D6 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_432
; Address: $CEE0D8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_432:
	LDA $18			  ; A5 18 | Read graphics status
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $C925,Y		  ; B9 25 C9 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1C			  ; 85 1C | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $1C			  ; E5 1C | Subtract with carry (zero page)
	STA $D625,Y		  ; 99 25 D6 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_434
; Address: $CEE0F2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_434:
	LDA $18			  ; A5 18 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $D5E5,Y		  ; 99 E5 D5 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $D625,Y		  ; 99 25 D6 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_436
; Address: $CEE105
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_436:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $C3A5,X		  ; BD A5 C3 | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $4D			  ; F0 4D | Branch if equal
	LDA $D465,Y		  ; B9 65 D4 | Read graphics status
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_437
; Address: $CEE11F
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_437:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA $D3E5,Y		  ; B9 E5 D3 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	CMP #$FE			 ; C9 FE | Compare accumulator (immediate)
	BNE $1A			  ; D0 1A | Branch if not equal
	LDA $D4A5,Y		  ; B9 A5 D4 | Read graphics status
	STA $D465,Y		  ; 99 65 D4 | Update graphics data
	LDA $D425,Y		  ; B9 25 D4 | Read graphics status
	STA $D3E5,Y		  ; 99 E5 D3 | Update graphics data
	LDA $D225,X		  ; BD 25 D2 | Read graphics status
	STA $D4A5,Y		  ; 99 A5 D4 | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $D425,Y		  ; 99 25 D4 | Update graphics data
	BRA $D1			  ; 80 D1 | Branch always
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $18			  ; D0 18 | Branch if not equal
	LDA $D4A5,Y		  ; B9 A5 D4 | Read graphics status
	STA $D465,Y		  ; 99 65 D4 | Update graphics data
	LDA $D425,Y		  ; B9 25 D4 | Read graphics status
	STA $D3E5,Y		  ; 99 E5 D3 | Update graphics data
	LDA $D225,X		  ; BD 25 D2 | Read graphics status
	STA $D4A5,Y		  ; 99 A5 D4 | Update graphics data
	LDA $D1E5,X		  ; BD E5 D1 | Read graphics status
	STA $D425,Y		  ; 99 25 D4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_438
; Address: $CEE166
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_438:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_439
; Address: $CEE16D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_439:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_43B
; Address: $CEE176
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_43B:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $C3A5,X		  ; BD A5 C3 | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	LDA $D165,X		  ; BD 65 D1 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_43C
; Address: $CEE18C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_43C:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_43D
; Address: $CEE193
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_43D:
	JSR $61BD			; 20 BD 61 | Jump to subroutine
	BCC $09			  ; 90 09 | Branch if carry clear
	STA $EC2062		  ; 8F 62 20 EC | Update graphics data
	ADC ($90,X)		  ; 61 90 | Add with carry ((zero page,X))
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_43F
; Address: $CEE1B0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_43F:
	JSR $61EC			; 20 EC 61 | Jump to subroutine
	BCC $01			  ; 90 01 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_440
; Address: $CEE1B6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_440:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_441
; Address: $CEE1BD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_441:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_442
; Address: $CEE1C6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_442:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $C3A5,X		  ; BD A5 C3 | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	LDA $C725,X		  ; BD 25 C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA $C765,X		  ; BD 65 C7 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDA $D165,X		  ; BD 65 D1 | Read graphics status
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_445
; Address: $CEE1EC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_445:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $DB17			; AD 17 DB | Read graphics status
	BNE $09			  ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_446
; Address: $CEE1FA
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_446:
	JSL $C65394		  ; 22 94 53 C6 | Jump to subroutine long
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $C725,X		  ; BD 25 C7 | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA $C765,X		  ; BD 65 C7 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $C725,Y		  ; F9 25 C7 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $39			  ; B0 39 | Branch if carry set
	LDA $1C			  ; A5 1C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $C765,Y		  ; F9 65 C7 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $29			  ; B0 29 | Branch if carry set
	STA $1C			  ; 85 1C | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 5D 62 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1C			  ; 85 1C | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_447
; Address: $CEE248
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_447:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $C397			; 8D 97 C3 | Update graphics data
	LDA				  ; BF 5D 62 C7 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_449
; Address: $CEE269
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_449:
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $9F			  ; 05 9F | Logical OR with accumulator (zero page)
	LDA $62B762		  ; AF 62 B7 62 | Read graphics status
	LDA $62B762		  ; AF 62 B7 62 | Read graphics status
	STA				  ; 9F 62 A7 62 | Update graphics data
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STA $1A			  ; 85 1A | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_44A
; Address: $CEE2A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_44A:
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STA $1C			  ; 85 1C | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_44B
; Address: $CEE2AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_44B:
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $1A			  ; 85 1A | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_44C
; Address: $CEE2B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_44C:
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $1C			  ; 85 1C | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_44E
; Address: $CEE2C3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_44E:
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	CMP $DB05			; CD 05 DB | Compare accumulator (absolute)
	BNE $0E			  ; D0 0E | Branch if not equal
	CMP $DB03			; CD 03 DB | Compare accumulator (absolute)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $DAA5			; AD A5 DA | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	JMP $6105			; 4C 05 61 | Jump to address
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_44F
; Address: $CEE2E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_44F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_450
; Address: $CEE2F1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_450:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA $C5A5,Y		  ; B9 A5 C5 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_451
; Address: $CEE304
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_451:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_452
; Address: $CEE30D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_452:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA $C207			; AD 07 C2 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 6C 63 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_453
; Address: $CEE331
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_453:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	EOR $6B00,Y		  ; 59 00 6B | Exclusive OR with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_454
; Address: $CEE33F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_454:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C5A5,Y		  ; 99 A5 C5 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_455
; Address: $CEE348
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_455:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D165,Y		  ; BE 65 D1 | Load from absolute,Y into X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCS $0A			  ; B0 0A | Branch if carry set
	LDA				  ; BF 64 63 C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_456
; Address: $CEE365
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_456:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	CMP $D165,Y		  ; D9 65 D1 | Compare accumulator (absolute,Y)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_458
; Address: $CEE386
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_458:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_459
; Address: $CEE397
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_459:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45A
; Address: $CEE3A4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45A:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	LDA $6B63			; AD 63 6B | Read graphics status
	BIT #$66			 ; 89 66 | Test bits in accumulator (immediate)
	INC $67			  ; E6 67 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45B
; Address: $CEE3B2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45B:
	PLA				  ; 68 | Pull accumulator from stack
	CMP $65			  ; C5 65 | Compare accumulator (zero page)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	STA $A067,Y		  ; 99 67 A0 | Update graphics data
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45C
; Address: $CEE3D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45C:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45D
; Address: $CEE3DF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45D:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	INX				  ; E8 | Increment X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45E
; Address: $CEE3E8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45E:
	BIT #$66			 ; 89 66 | Test bits in accumulator (immediate)
	INC $67			  ; E6 67 | Increment (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CMP $65			  ; C5 65 | Compare accumulator (zero page)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	STA $A067,Y		  ; 99 67 A0 | Update graphics data
	AND $4868,Y		  ; 39 68 48 | Logical AND with accumulator (absolute,Y)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_45F
; Address: $CEE40D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_45F:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_460
; Address: $CEE41A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_460:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	STZ $6B			  ; 64 6B | Store zero to zero page
	CMP $65			  ; C5 65 | Compare accumulator (zero page)
	INC $67			  ; E6 67 | Increment (zero page)
	ROR $C5			  ; 66 C5 | Rotate right (zero page)
	ADC $B2			  ; 65 B2 | Add with carry (zero page)
	ROR $8B			  ; 66 8B | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_461
; Address: $CEE431
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_461:
	STA $A067,Y		  ; 99 67 A0 | Update graphics data
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $2C			  ; D0 2C | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_462
; Address: $CEE448
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_462:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_463
; Address: $CEE46C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_463:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $04			  ; B0 04 | Branch if carry set
	STZ $6B			  ; 64 6B | Store zero to zero page
	STZ $C1D3			; 9C D3 C1 | Store zero to absolute
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $F4			  ; D0 F4 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_464
; Address: $CEE488
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_464:
	ROR $73			  ; 66 73 | Rotate right (zero page)
	ROR $31			  ; 66 31 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $A7			  ; 66 A7 | Rotate right (zero page)
	LDA ($67),Y		  ; B1 67 | Read graphics status
	CMP $67			  ; C5 67 | Compare accumulator (zero page)
	PHX				  ; DA | Push X register to stack
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_465
; Address: $CEE4AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_465:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_466
; Address: $CEE4B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_466:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	REP #$64			 ; C2 64 | Reset processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_467
; Address: $CEE4C3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_467:
	ROR $E6			  ; 66 E6 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CMP $65			  ; C5 65 | Compare accumulator (zero page)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	STA $A067,Y		  ; 99 67 A0 | Update graphics data
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_468
; Address: $CEE4E7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_468:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_469
; Address: $CEE4F4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_469:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	SBC $6B64,X		  ; FD 64 6B | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR $55			  ; 66 55 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $8B			  ; 66 8B | Rotate right (zero page)
	STA $A067,Y		  ; 99 67 A0 | Update graphics data
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46A
; Address: $CEE522
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46A:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	BEQ $20			  ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46B
; Address: $CEE530
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46B:
	CPY $68			  ; C4 68 | Compare Y register (zero page)
	BCS $04			  ; B0 04 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	ADC $6B			  ; 65 6B | Add with carry (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$01			 ; A9 01 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46C
; Address: $CEE548
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46C:
	BIT #$66			 ; 89 66 | Test bits in accumulator (immediate)
	INC $67			  ; E6 67 | Increment (zero page)
	ROR $C5			  ; 66 C5 | Rotate right (zero page)
	ADC $B2			  ; 65 B2 | Add with carry (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $48			  ; 66 48 | Rotate right (zero page)
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46D
; Address: $CEE56D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46D:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46E
; Address: $CEE57A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46E:
	JSR $68C4			; 20 C4 68 | Jump to subroutine
	BCS $03			  ; B0 03 | Branch if carry set
	ADC $6B			  ; 65 6B | Add with carry (zero page)
	EOR $6268,X		  ; 5D 68 62 | Exclusive OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR $88			  ; 66 88 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	STA $9768			; 8D 68 97 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_46F
; Address: $CEE5A1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_46F:
	BEQ $09			  ; F0 09 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3E5,Y		  ; B9 E5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $D0			  ; 80 D0 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_470
; Address: $CEE5B6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_470:
	LDA $7F70			; AD 70 7F | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $7F72			; 2D 72 7F | Logical AND with accumulator (absolute)
	STA $7F72			; 8D 72 7F | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_475
; Address: $CEE5D5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_475:
	LDA $99F9			; AD F9 99 | Read graphics status
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	BNE $31			  ; D0 31 | Branch if not equal
	LDA $7E353E		  ; AF 3E 35 7E | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_476
; Address: $CEE5E6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_476:
	JSL $CC9366		  ; 22 66 93 CC | Jump to subroutine long
	BCC $22			  ; 90 22 | Branch if carry clear
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $1A			  ; D0 1A | Branch if not equal
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	CMP $3514			; CD 14 35 | Compare accumulator (absolute)
	BNE $0F			  ; D0 0F | Branch if not equal
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	CMP $3520			; CD 20 35 | Compare accumulator (absolute)
	BNE $07			  ; D0 07 | Branch if not equal
	LDA #$08			 ; A9 08 | Read graphics status
	JMP $C77DB9		  ; 5C B9 7D C7 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_47A
; Address: $CEE61F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_47A:
	JSL $C6769D		  ; 22 9D 76 C6 | Jump to subroutine long
	LDA $C371			; AD 71 C3 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_47F
; Address: $CEE63C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_47F:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $9C00,X		  ; 3D 00 9C | Logical AND with accumulator (absolute,X)
	ADC ($C3),Y		  ; 71 C3 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_486
; Address: $CEE661
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_486:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_48A
; Address: $CEE677
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_48A:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $2200,X		  ; 3D 00 22 | Logical AND with accumulator (absolute,X)
	EOR $C66F,Y		  ; 59 6F C6 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_490
; Address: $CEE699
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_490:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $2200,X		  ; 3D 00 22 | Logical AND with accumulator (absolute,X)
	BCC $C7			  ; 90 C7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_497
; Address: $CEE6C0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_497:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $2200,X		  ; 3D 00 22 | Logical AND with accumulator (absolute,X)
	BCC $C7			  ; 90 C7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_49E
; Address: $CEE6E5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_49E:
	ROR $E3			  ; 66 E3 | Rotate right (zero page)
	ROR $E3			  ; 66 E3 | Rotate right (zero page)
	ROR $E3			  ; 66 E3 | Rotate right (zero page)
	ROR $F0			  ; 66 F0 | Rotate right (zero page)
	ROR $E3			  ; 66 E3 | Rotate right (zero page)
	ROR $20			  ; 66 20 | Rotate right (zero page)
	AND ($67),Y		  ; 31 67 | Logical AND with accumulator ((zero page),Y)
	BCC $1B			  ; 90 1B | Branch if carry clear
	LDA $C8A5,Y		  ; B9 A5 C8 | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	CMP #$90			 ; C9 90 | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	LDA $C8A5,Y		  ; B9 A5 C8 | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A0
; Address: $CEE710
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A0:
	LDA $C1C3			; AD C3 C1 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA #$07			 ; A9 07 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A2
; Address: $CEE71E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A2:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	BIT $2201			; 2C 01 22 | Test bits in accumulator (absolute)
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A3
; Address: $CEE728
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A3:
	JSL $C639D0		  ; 22 D0 39 C6 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $C1C3			; 8D C3 C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A4
; Address: $CEE731
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A4:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 65 67 C7 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A5
; Address: $CEE73D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A5:
	STA $18			  ; 85 18 | Update graphics data
	LDA				  ; BF 67 67 C7 | Read graphics status
	CMP $C765,Y		  ; D9 65 C7 | Compare accumulator (absolute,Y)
	BNE $11			  ; D0 11 | Branch if not equal
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BEQ $14			  ; F0 14 | Branch if equal
	INC $18			  ; E6 18 | Increment (zero page)
	LDA				  ; BF 69 67 C7 | Read graphics status
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BCS $EF			  ; B0 EF | Branch if carry set
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $D3			  ; 80 D3 | Branch always
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A7
; Address: $CEE765
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A7:
	INY				  ; C8 | Increment Y register
	PLB				  ; AB | Pull data bank register from stack
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	LDA $D801			; AD 01 D8 | Read graphics status
	DEC $00			  ; C6 00 | Decrement (zero page)
	LDA $00D401		  ; AF 01 D4 00 | Read graphics status
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDA ($01),Y		  ; B1 01 | Read graphics status
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ORA ($D2,X)		  ; 01 D2 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A8
; Address: $CEE792
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A8:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4A9
; Address: $CEE799
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4A9:
	LDA #$02			 ; A9 02 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4AA
; Address: $CEE7A0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4AA:
	LDA #$03			 ; A9 03 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4AB
; Address: $CEE7A7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4AB:
	LDA #$00			 ; A9 00 | Read graphics status
	CMP $D165,Y		  ; D9 65 D1 | Compare accumulator (absolute,Y)
	BEQ $2B			  ; F0 2B | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4AC
; Address: $CEE7AF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4AC:
	BRA $1C			  ; 80 1C | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	CMP $D165,Y		  ; D9 65 D1 | Compare accumulator (absolute,Y)
	BEQ $21			  ; F0 21 | PPU graphics register access
	BRA $12			  ; 80 12 | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	CMP $D165,Y		  ; D9 65 D1 | Compare accumulator (absolute,Y)
	BEQ $17			  ; F0 17 | Branch if equal
	BRA $08			  ; 80 08 | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	CMP $D165,Y		  ; D9 65 D1 | Compare accumulator (absolute,Y)
	BEQ $0D			  ; F0 0D | Branch if equal
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	INC $C1D3			; EE D3 C1 | Increment (absolute)
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4AD
; Address: $CEE7DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4AD:
	LDA $C1D3			; AD D3 C1 | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4AE
; Address: $CEE7E6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4AE:
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BMI $0C			  ; 30 0C | Branch if negative
	JMP $65C5			; 4C C5 65 | Jump to address
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BMI $03			  ; 30 03 | Branch if negative
	JMP $6632			; 4C 32 66 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4B1
; Address: $CEE807
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4B1:
	JSL $C639D0		  ; 22 D0 39 C6 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4B3
; Address: $CEE816
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4B3:
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $09			  ; 10 09 | Branch if positive
	LDA $7E3500		  ; AF 00 35 7E | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4B9
; Address: $CEE839
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4B9:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	CMP $0B90			; CD 90 0B | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4BA
; Address: $CEE845
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4BA:
	JSL $C73831		  ; 22 31 38 C7 | Jump to subroutine long
	LDA #$5D			 ; A9 5D | Read graphics status
	JMP $C732D7		  ; 5C D7 32 C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4BF
; Address: $CEE862
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4BF:
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $1F			  ; 10 1F | Branch if positive
	STZ $33B8			; 9C B8 33 | Store zero to absolute
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4C0
; Address: $CEE86E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4C0:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ASL $BCAD			; 0E AD BC | Arithmetic shift left (absolute)
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$06			 ; A9 06 | Read graphics status
	STA $C1ED			; 8D ED C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4C2
; Address: $CEE888
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4C2:
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $0F			  ; 80 0F | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $0A			  ; 80 0A | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $05			  ; 80 05 | Branch always
	LDA #$03			 ; A9 03 | Read graphics status
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4C3
; Address: $CEE89C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4C3:
	JSL $C56245		  ; 22 45 62 C5 | Jump to subroutine long
	BCC $04			  ; 90 04 | Branch if carry clear
	STA $D165,Y		  ; 99 65 D1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4C6
; Address: $CEE8AD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4C6:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $09			  ; 80 09 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4CB
; Address: $CEE8C5
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4CB:
	JSL $C02423		  ; 22 23 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	LDA $7F72			; AD 72 7F | Read graphics status
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $1A			  ; 85 1A | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDA $18			  ; A5 18 | Read graphics status
	STA $7F72			; 8D 72 7F | Update graphics data
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	STA $18			  ; 85 18 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $41			  ; D0 41 | Branch if not equal
	LDA $18			  ; A5 18 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4CC
; Address: $CEE8EE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4CC:
	JSR $3ED0			; 20 D0 3E | Jump to subroutine
	LDA $18			  ; A5 18 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $D0			  ; 80 D0 | Branch always
	SEC				  ; 38 | Set carry flag
	LDA $18			  ; A5 18 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $35			  ; D0 35 | Branch if not equal
	LDA $18			  ; A5 18 | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $42			  ; D0 42 | Hardware register operation
	LDA $18			  ; A5 18 | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $2B			  ; D0 2B | Branch if not equal
	LDA $18			  ; A5 18 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $28			  ; D0 28 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4CD
; Address: $CEE91B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4CD:
	LDA $18			  ; A5 18 | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $25			  ; D0 25 | Branch if not equal
	LDA $18			  ; A5 18 | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $22			  ; D0 22 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4D9
; Address: $CEE954
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4D9:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $34			  ; B0 34 | Branch if carry set
	LDA $DB15			; AD 15 DB | Read graphics status
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	JMP $69AC			; 4C AC 69 | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4DF
; Address: $CEE992
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4DF:
	JSL $C659EA		  ; 22 EA 59 C6 | Jump to subroutine long
	BCS $10			  ; B0 10 | Branch if carry set
	LDA $C399			; AD 99 C3 | Read graphics status
	BNE $09			  ; D0 09 | Branch if not equal
	INC $C399			; EE 99 C3 | Increment (absolute)
	BRA $04			  ; 80 04 | Branch always
	STZ $C399			; 9C 99 C3 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4E2
; Address: $CEE9AF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4E2:
	JSL $C65C68		  ; 22 68 5C C6 | Jump to subroutine long
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $C399			; AD 99 C3 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $C399			; EE 99 C3 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4E3
; Address: $CEE9BD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4E3:
	JSL $C77E93		  ; 22 93 7E C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4E5
; Address: $CEE9C7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4E5:
	JSL $C77E93		  ; 22 93 7E C7 | Jump to subroutine long
	STZ $C399			; 9C 99 C3 | Store zero to absolute
	LDA $C825,Y		  ; B9 25 C8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $9A41			; 6D 41 9A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND $C865,Y		  ; 39 65 C8 | Logical AND with accumulator (absolute,Y)
	BEQ $1D			  ; F0 1D | Branch if equal
	LDA $CEE5,Y		  ; B9 E5 CE | Read graphics status
	BNE $18			  ; D0 18 | Branch if not equal
	LDA $DB05			; AD 05 DB | Read graphics status
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4EB
; Address: $CEEA0B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4EB:
	JSL $C1C259		  ; 22 59 C2 C1 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4EC
; Address: $CEEA11
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4EC:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $11			  ; B0 11 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4F0
; Address: $CEEA36
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4F0:
	JSL $C79178		  ; 22 78 91 C7 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4F2
; Address: $CEEA3F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4F2:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6A70			; 4C 70 6A | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4F8
; Address: $CEEA78
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4F8:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4F9
; Address: $CEEA8A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4F9:
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $6AA9			; 4C A9 6A | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_4FF
; Address: $CEEAB1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_4FF:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $1B			  ; B0 1B | Branch if carry set
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $CFA5,X		  ; BD A5 CF | Read graphics status
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_502
; Address: $CEEAE9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_502:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $08			  ; B0 08 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_505
; Address: $CEEB0B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_505:
	JSR $6B11			; 20 11 6B | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_506
; Address: $CEEB11
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_506:
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	LDA $CFA5,X		  ; BD A5 CF | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 23 6B C7 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_507
; Address: $CEEB24
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_507:
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $38			  ; B0 38 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_509
; Address: $CEEB48
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_509:
	JSL $C65A59		  ; 22 59 5A C6 | Jump to subroutine long
	BCS $35			  ; B0 35 | Branch if carry set
	LDA $D3A5,Y		  ; B9 A5 D3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $1D			  ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_50A
; Address: $CEEB56
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_50A:
	JSL $C659EA		  ; 22 EA 59 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	LDA $986D			; AD 6D 98 | Read graphics status
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_50B
; Address: $CEEB6B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_50B:
	JSL $C6572A		  ; 22 2A 57 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	BCS $10			  ; B0 10 | Branch if carry set
	LDA $C399			; AD 99 C3 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $C399			; EE 99 C3 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_50F
; Address: $CEEB87
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_50F:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $38			  ; B0 38 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_511
; Address: $CEEBA4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_511:
	JSL $C65AC8		  ; 22 C8 5A C6 | Jump to subroutine long
	BCS $35			  ; B0 35 | Branch if carry set
	LDA $D3A5,Y		  ; B9 A5 D3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $1D			  ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_512
; Address: $CEEBB2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_512:
	JSL $C659EA		  ; 22 EA 59 C6 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D3A5,Y		  ; 99 A5 D3 | Update graphics data
	LDA $986D			; AD 6D 98 | Read graphics status
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_513
; Address: $CEEBC7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_513:
	JSL $C6572A		  ; 22 2A 57 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	BCS $10			  ; B0 10 | Branch if carry set
	LDA $C399			; AD 99 C3 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	INC $C399			; EE 99 C3 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_514
; Address: $CEEBD9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_514:
	STZ $C399			; 9C 99 C3 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_516
; Address: $CEEBE3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_516:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_517
; Address: $CEEBF2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_517:
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C5A5,Y		  ; 99 A5 C5 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_51B
; Address: $CEEC0E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_51B:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_51C
; Address: $CEEC17
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_51C:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	SBC $CD			  ; E5 CD | Subtract with carry (zero page)
	LDA #$02			 ; A9 02 | Read graphics status
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_51E
; Address: $CEEC35
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_51E:
	STZ $C399			; 9C 99 C3 | Store zero to absolute
	LDX $C825,Y		  ; BE 25 C8 | Load from absolute,Y into X register
	LDA				  ; BF 00 00 7F | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA $CEE5,Y		  ; B9 E5 CE | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_51F
; Address: $CEEC4C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_51F:
	JSL $C61923		  ; 22 23 19 C6 | Jump to subroutine long
	LDA				  ; BF 00 00 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_525
; Address: $CEEC6C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_525:
	JSL $C1C259		  ; 22 59 C2 C1 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_526
; Address: $CEEC72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_526:
	LDX $DB05			; AE 05 DB | Load from absolute address into X register
	ADC $606C,Y		  ; 79 6C 60 | Add with carry (absolute,Y)
	STA $6C			  ; 85 6C | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_527
; Address: $CEEC7B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_527:
	STA $6C			  ; 85 6C | Update graphics data
	JMP ($6C85)		  ; 6C 85 6C | Jump to address (absolute indirect)
	JMP ($6C85)		  ; 6C 85 6C | Jump to address (absolute indirect)
	LDA $7E3500		  ; AF 00 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	LDA $7E3628		  ; AF 28 36 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $1B			  ; D0 1B | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_52C
; Address: $CEECB3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_52C:
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	LDA $D165,Y		  ; B9 65 D1 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D2 6C C7 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	STA $CFA5,Y		  ; 99 A5 CF | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_52D
; Address: $CEECD8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_52D:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_52E
; Address: $CEECEE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_52E:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	JMP $6954			; 4C 54 69 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_530
; Address: $CEED08
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_530:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_531
; Address: $CEED14
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_531:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	JMP $6A78			; 4C 78 6A | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D165,Y		  ; 99 65 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_532
; Address: $CEED27
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_532:
	JSL $C6594A		  ; 22 4A 59 C6 | Jump to subroutine long
	JMP $6A11			; 4C 11 6A | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_534
; Address: $CEED3F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_534:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $D1A5,X		  ; BD A5 D1 | Read graphics status
	STA $D1A5,Y		  ; 99 A5 D1 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_536
; Address: $CEED59
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_536:
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $C397			; 8D 97 C3 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_538
; Address: $CEED6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_538:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_539
; Address: $CEED72
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_539:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $99FF			; 9C FF 99 | Store zero to absolute
	STZ $DB05			; 9C 05 DB | Store zero to absolute
	STZ $DB01			; 9C 01 DB | Store zero to absolute
	STZ $BDED			; 9C ED BD | Store zero to absolute
	STZ $C36F			; 9C 6F C3 | Store zero to absolute
	STZ $33D4			; 9C D4 33 | Store zero to absolute
	STZ $C36B			; 9C 6B C3 | Store zero to absolute
	STZ $BE6B			; 9C 6B BE | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	STA $3440			; 8D 40 34 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1FD			; 8D FD C1 | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $C1C5			; 8D C5 C1 | Update graphics data
	STZ $33F6			; 9C F6 33 | Store zero to absolute
	STZ $C30B			; 9C 0B C3 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_53A
; Address: $CEEDA4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_53A:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	JMP ($7E98)		  ; 6C 98 7E | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_53B
; Address: $CEEDAE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_53B:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	AND $7E35,X		  ; 3D 35 7E | Logical AND with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_53C
; Address: $CEEDB8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_53C:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C0EB			; 8D EB C0 | Update graphics data
	LDA #$50			 ; A9 50 | Read graphics status
	STA $986F			; 8D 6F 98 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $99AF			; 8D AF 99 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $352E			; 8D 2E 35 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_53D
; Address: $CEEDE6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_53D:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_53E
; Address: $CEEDEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_53E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_541
; Address: $CEEDFE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_541:
	JSL $C908F0		  ; 22 F0 08 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_542
; Address: $CEEE07
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_542:
	JSL $C908F0		  ; 22 F0 08 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0005,X		  ; 7E 05 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_543
; Address: $CEEE10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_543:
	JSL $C908F0		  ; 22 F0 08 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0033,X		  ; 7E 33 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_544
; Address: $CEEE19
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_544:
	JSL $C908F0		  ; 22 F0 08 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0007,X		  ; 7E 07 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_546
; Address: $CEEE26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_546:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_547
; Address: $CEEE30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_547:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_548
; Address: $CEEE3A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_548:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROL $7E35,X		  ; 3E 35 7E | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_54A
; Address: $CEEE4F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_54A:
	JSL $C42C2C		  ; 22 2C 2C C4 | Jump to subroutine long
	LDA #$18			 ; A9 18 | Read graphics status
	STA $352C			; 8D 2C 35 | Update graphics data
	LDA #$AC			 ; A9 AC | Read graphics status
	STA $3714			; 8D 14 37 | Update graphics data
	LDA #$25			 ; A9 25 | Read graphics status
	PEA #$3538		   ; F4 38 35 | Push effective address to stack
	PEA #$003F		   ; F4 3F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_54B
; Address: $CEEE6C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_54B:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$3538		   ; F4 38 35 | Push effective address to stack
	PEA #$3FC0		   ; F4 C0 3F | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_54E
; Address: $CEEE86
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_54E:
	JSL $C7906D		  ; 22 6D 90 C7 | Jump to subroutine long
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_556
; Address: $CEEED0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_556:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	BRA $3C			  ; 80 3C | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_55C
; Address: $CEEF0E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_55C:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_55D
; Address: $CEEF20
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_55D:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $49			  ; F0 49 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_563
; Address: $CEEF6C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_563:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	STZ $C36B			; 9C 6B C3 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_564
; Address: $CEEF7A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_564:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $3640,X		  ; 9E 40 36 | Store zero to absolute,X
	STZ $3660,X		  ; 9E 60 36 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $F3			  ; D0 F3 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_566
; Address: $CEEF8C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_566:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $C13F			; 8D 3F C1 | Update graphics data
	JMP $705F			; 4C 5F 70 | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_567
; Address: $CEEF98
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_567:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	STA $C13F			; 8D 3F C1 | Update graphics data
	JMP $705F			; 4C 5F 70 | Jump to address
	LDA $C10D			; AD 0D C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_568
; Address: $CEEFA7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_568:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($6B,X)		  ; 01 6B | Logical OR with accumulator ((zero page,X))
	LDA $C10D			; AD 0D C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_569
; Address: $CEEFB2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_569:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_56B
; Address: $CEEFBD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_56B:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $6B			  ; 05 6B | Logical OR with accumulator (zero page)
	LDA $C10D			; AD 0D C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_56D
; Address: $CEEFCC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_56D:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $6B			  ; 05 6B | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_56E
; Address: $CEEFD8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_56E:
	JSL $C446A4		  ; 22 A4 46 C4 | Jump to subroutine long
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	SBC $3088,X		  ; FD 88 30 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_571
; Address: $CEEFE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_571:
	JSL $C45399		  ; 22 99 53 C4 | Jump to subroutine long
	BRA $EF			  ; 80 EF | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_572
; Address: $CEEFF4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_572:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $3524,Y		  ; 99 24 35 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_573
; Address: $CEF002
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_573:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_574
; Address: $CEF00C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_574:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $3524,Y		  ; 99 24 35 | Update graphics data
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BCC $EF			  ; 90 EF | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_575
; Address: $CEF01E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_575:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_576
; Address: $CEF027
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_576:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	PEA #$00A0		   ; F4 A0 00 | Push effective address to stack
	LDA $3524,Y		  ; B9 24 35 | Read graphics status
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_577
; Address: $CEF038
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_577:
	JSL $C42A6D		  ; 22 6D 2A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_57E
; Address: $CEF05F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_57E:
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_580
; Address: $CEF065
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_580:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $3502			; 8D 02 35 | Update graphics data
	STZ $3503			; 9C 03 35 | Store zero to absolute
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $3503			; 8D 03 35 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_582
; Address: $CEF07D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_582:
	JSL $C63084		  ; 22 84 30 C6 | Jump to subroutine long
	STA $C18D			; 8D 8D C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_583
; Address: $CEF085
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_583:
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_584
; Address: $CEF08E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_584:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	STA $C199			; 8D 99 C1 | Update graphics data
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$01F0		   ; F4 F0 01 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_585
; Address: $CEF09F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_585:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	STA $C19B			; 8D 9B C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_586
; Address: $CEF0A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_586:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_587
; Address: $CEF0B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_587:
	JSL $C74C69		  ; 22 69 4C C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_588
; Address: $CEF0C0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_588:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $70C9			; 4C C9 70 | Jump to address
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_589
; Address: $CEF0CC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_589:
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_58A
; Address: $CEF0D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_58A:
	JSL $C74C7C		  ; 22 7C 4C C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_58B
; Address: $CEF0DE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_58B:
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_58C
; Address: $CEF104
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_58C:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	STA $7EC0AF		  ; 8F AF C0 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	STA $7EC0B1		  ; 8F B1 C0 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	STA $7EC0B3		  ; 8F B3 C0 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	STA $7EC0B5		  ; 8F B5 C0 7E | Update graphics data
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_58D
; Address: $CEF142
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_58D:
	PLB				  ; AB | Pull data bank register from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C0B7			; 8D B7 C0 | Update graphics data
	STA $C0B9			; 8D B9 C0 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $C0AF,X		  ; BD AF C0 | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$08			 ; A9 08 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $34			  ; 85 34 | Update graphics data
	LDA $DAA7,X		  ; BD A7 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $D3A5,Y		  ; BE A5 D3 | Load from absolute,Y into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	LDA $C5E5,X		  ; BD E5 C5 | Read graphics status
	STA $30			  ; 85 30 | Update graphics data
	LDA $C625,X		  ; BD 25 C6 | Read graphics status
	STA $32			  ; 85 32 | Update graphics data
	LDX $34			  ; A6 34 | Load from zero page into X register
	LDA ($71,X)		  ; A1 71 | Read graphics status
	LDA $30			  ; A5 30 | Read graphics status
	LDX $32			  ; A6 32 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_58E
; Address: $CEF182
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_58E:
	JSL $C759AD		  ; 22 AD 59 C7 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCC $C1			  ; 90 C1 | Branch if carry clear
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_592
; Address: $CEF1A2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_592:
	ADC ($D4),Y		  ; 71 D4 | Add with carry ((zero page),Y)
	ADC ($DD),Y		  ; 71 DD | Add with carry ((zero page),Y)
	ADC ($E6),Y		  ; 71 E6 | Add with carry ((zero page),Y)
	ADC ($B3),Y		  ; 71 B3 | Add with carry ((zero page),Y)
	ADC ($B9),Y		  ; 71 B9 | Add with carry ((zero page),Y)
	ADC ($C5),Y		  ; 71 C5 | Add with carry ((zero page),Y)
	ADC ($BF),Y		  ; 71 BF | Add with carry ((zero page),Y)
	ADC ($EE),Y		  ; 71 EE | Add with carry ((zero page),Y)
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	ADC ($4C),Y		  ; 71 4C | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_593
; Address: $CEF1B8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_593:
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	JMP $71F8			; 4C F8 71 | Jump to address

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_595
; Address: $CEF1C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_595:
	JSR $7201			; 20 01 72 | Jump to subroutine
	JMP $720A			; 4C 0A 72 | Jump to address
	LDA $32			  ; A5 32 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $32			  ; 85 32 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_596
; Address: $CEF1D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_596:
	LDA $30			  ; A5 30 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $30			  ; 85 30 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_597
; Address: $CEF1DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_597:
	LDA $32			  ; A5 32 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $32			  ; 85 32 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_598
; Address: $CEF1E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_598:
	LDA $30			  ; A5 30 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $30			  ; 85 30 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_599
; Address: $CEF1EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_599:
	LDA $32			  ; A5 32 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	STA $32			  ; 85 32 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_59A
; Address: $CEF1F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_59A:
	LDA $30			  ; A5 30 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $30			  ; 85 30 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_59B
; Address: $CEF201
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_59B:
	LDA $32			  ; A5 32 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	STA $32			  ; 85 32 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_59C
; Address: $CEF20A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_59C:
	LDA $30			  ; A5 30 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	STA $30			  ; 85 30 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_59D
; Address: $CEF213
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_59D:
	STZ $C0AB			; 9C AB C0 | Store zero to absolute
	JMP $7234			; 4C 34 72 | Jump to address
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_59E
; Address: $CEF21C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_59E:
	STA $C0AB			; 8D AB C0 | Update graphics data
	JMP $7234			; 4C 34 72 | Jump to address
	LDA #$04			 ; A9 04 | Read graphics status
	STA $C0AB			; 8D AB C0 | Update graphics data
	JMP $7234			; 4C 34 72 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C0AB			; 8D AB C0 | Update graphics data
	JMP $7234			; 4C 34 72 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $DB17			; 8D 17 DB | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $28			  ; F0 28 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $2B			  ; F0 2B | Branch if equal
	LDA $D1A5,Y		  ; B9 A5 D1 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$13			 ; 69 13 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF FF BF C8 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A0
; Address: $CEF268
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A0:
	JSR $72A1			; 20 A1 72 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BNE $FA			  ; D0 FA | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $C7			  ; 90 C7 | Branch if carry clear
	STZ $DB17			; 9C 17 DB | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A1
; Address: $CEF27A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A1:
	JSR $72CB			; 20 CB 72 | Jump to subroutine
	BRA $EF			  ; 80 EF | Branch always
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $C0AB			; AE AB C0 | Load from absolute address into X register
	STY $7A72			; 8C 72 7A | Store Y register to absolute address
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A4
; Address: $CEF297
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A4:
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A5
; Address: $CEF2A1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A5:
	PHY				  ; 5A | Push Y register to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $D1E5,X		  ; 9D E5 D1 | Update graphics data
	LDA $D1A5,X		  ; BD A5 D1 | Read graphics status
	STA $D225,X		  ; 9D 25 D2 | Update graphics data
	LDA $C3A5,X		  ; BD A5 C3 | Read graphics status
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $C3A5,X		  ; 9D A5 C3 | Update graphics data
	LDA $C3A5,X		  ; BD A5 C3 | Read graphics status
	AND #$FD			 ; 29 FD | Logical AND with accumulator (immediate)
	STA $C3A5,X		  ; 9D A5 C3 | Update graphics data
	LDA $D365,X		  ; BD 65 D3 | Read graphics status
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	BNE $FC			  ; D0 FC | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A6
; Address: $CEF2CB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A6:
	LDA $C0AB			; AD AB C0 | Read graphics status
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A7
; Address: $CEF2D3
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A7:
	JSR $7297			; 20 97 72 | Jump to subroutine
	STY $18			  ; 84 18 | Store Y register to zero page
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $31			  ; F0 31 | Branch if equal
	LDA $D3A5,Y		  ; B9 A5 D3 | Read graphics status
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	BNE $2A			  ; D0 2A | Branch if not equal
	TAX				  ; AA | Transfer accumulator to X register
	LDA $18			  ; A5 18 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $D3E5,X		  ; BD E5 D3 | Read graphics status
	STA $D3E5,Y		  ; 99 E5 D3 | Update graphics data
	LDA $D425,X		  ; BD 25 D4 | Read graphics status
	STA $D425,Y		  ; 99 25 D4 | Update graphics data
	LDA $D465,X		  ; BD 65 D4 | Read graphics status
	STA $D465,Y		  ; 99 65 D4 | Update graphics data
	LDA $D4A5,X		  ; BD A5 D4 | Read graphics status
	STA $D4A5,Y		  ; 99 A5 D4 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A8
; Address: $CEF303
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A8:
	JSL $C759D9		  ; 22 D9 59 C7 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	STY $18			  ; 84 18 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5A9
; Address: $CEF30A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5A9:
	JSR $72D8			; 20 D8 72 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5AA
; Address: $CEF30F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5AA:
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5AB
; Address: $CEF319
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5AB:
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	LDX $DAA5,Y		  ; BE A5 DA | Load from absolute,Y into X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	LDA $C3E5,X		  ; BD E5 C3 | Read graphics status
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	AND #$FD			 ; 29 FD | Logical AND with accumulator (immediate)
	AND #$FB			 ; 29 FB | Logical AND with accumulator (immediate)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	AND #$EF			 ; 29 EF | Logical AND with accumulator (immediate)
	STA $C3E5,X		  ; 9D E5 C3 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $DC			  ; 90 DC | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5AC
; Address: $CEF341
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5AC:
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5AD
; Address: $CEF34F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5AD:
	JSL $C74E22		  ; 22 22 4E C7 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5AE
; Address: $CEF355
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5AE:
	JSL $C74DF1		  ; 22 F1 4D C7 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E4			  ; 90 E4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5B0
; Address: $CEF365
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5B0:
	TAX				  ; AA | Transfer accumulator to X register
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5B1
; Address: $CEF36A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5B1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5B6
; Address: $CEF394
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5B6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $3F			  ; F0 3F | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5B9
; Address: $CEF3AF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5B9:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5BB
; Address: $CEF3C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5BB:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $24			  ; 80 24 | Branch always

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5BC
; Address: $CEF3D5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5BC:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $000F,X		  ; FE 0F 00 | Increment (absolute,X)
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5BE
; Address: $CEF3EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5BE:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C0
; Address: $CEF3FE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C0:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C1
; Address: $CEF42A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C1:
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	ASL $5D20,X		  ; 1E 20 5D | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C2
; Address: $CEF438
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C2:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	ASL $8E20,X		  ; 1E 20 8E | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C3
; Address: $CEF470
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C3:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C4
; Address: $CEF48E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C4:
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	ASL $BF20,X		  ; 1E 20 BF | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C5
; Address: $CEF4AA
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C5:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	ASL $F420,X		  ; 1E 20 F4 | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C6
; Address: $CEF4E4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C6:
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C7
; Address: $CEF4FE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C7:
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	ASL $2520,X		  ; 1E 20 25 | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5C9
; Address: $CEF522
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5C9:
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $995D,Y		  ; 99 5D 99 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5CC
; Address: $CEF533
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5CC:
	STA $9973			; 8D 73 99 | Update graphics data
	STX $9975			; 8E 75 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5CD
; Address: $CEF53A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5CD:
	STA $9981			; 8D 81 99 | Update graphics data
	STX $9983			; 8E 83 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5CE
; Address: $CEF541
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5CE:
	STA $9987			; 8D 87 99 | Update graphics data
	STX $9989			; 8E 89 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5CF
; Address: $CEF548
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5CF:
	STA $998D			; 8D 8D 99 | Update graphics data
	STX $998F			; 8E 8F 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D0
; Address: $CEF54F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D0:
	STA $9993			; 8D 93 99 | Update graphics data
	STX $9995			; 8E 95 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D1
; Address: $CEF556
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D1:
	STA $9999			; 8D 99 99 | Update graphics data
	STX $999B			; 8E 9B 99 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D2
; Address: $CEF55D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D2:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D3
; Address: $CEF564
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D3:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $98DB,X		  ; BD DB 98 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $13			  ; 80 13 | Branch always
	STA $98DB,X		  ; 9D DB 98 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $98F3,X		  ; 9D F3 98 | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	STA $98E3,X		  ; 9D E3 98 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $98EB,X		  ; 9D EB 98 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D4
; Address: $CEF58E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D4:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $98B3,X		  ; BD B3 98 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $13			  ; 80 13 | Branch always
	STA $98B3,X		  ; 9D B3 98 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $98BF,X		  ; 9D BF 98 | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	STA $98B7,X		  ; 9D B7 98 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $98BB,X		  ; 9D BB 98 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D5
; Address: $CEF5BF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D5:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $9903,X		  ; BD 03 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D6
; Address: $CEF5D1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D6:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $13			  ; 80 13 | Branch always
	STA $9903,X		  ; 9D 03 99 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $9927,X		  ; 9D 27 99 | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	STA $990F,X		  ; 9D 0F 99 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $991B,X		  ; 9D 1B 99 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D8
; Address: $CEF5F4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D8:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $993F,X		  ; BD 3F 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $13			  ; 80 13 | Branch always
	STA $993F,X		  ; 9D 3F 99 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $994B,X		  ; 9D 4B 99 | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status
	STA $9943,X		  ; 9D 43 99 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $9947,X		  ; 9D 47 99 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5D9
; Address: $CEF625
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5D9:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	STA $9965,Y		  ; 99 65 99 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5DB
; Address: $CEF635
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5DB:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5DC
; Address: $CEF640
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5DC:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5DD
; Address: $CEF64B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5DD:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5DE
; Address: $CEF656
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5DE:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5DF
; Address: $CEF661
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5DF:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E0
; Address: $CEF66C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E0:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E1
; Address: $CEF677
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E1:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E2
; Address: $CEF682
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E2:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E3
; Address: $CEF68D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E3:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E4
; Address: $CEF698
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E4:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E6
; Address: $CEF6A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E6:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $99FF			; 8D FF 99 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E7
; Address: $CEF6AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E7:
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$99C5		   ; F4 C5 99 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5E9
; Address: $CEF6BF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5E9:
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$99C5		   ; F4 C5 99 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5EB
; Address: $CEF6D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5EB:
	LDA #$02			 ; A9 02 | Read graphics status
	PEA #$99C5		   ; F4 C5 99 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5ED
; Address: $CEF6E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5ED:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5EE
; Address: $CEF6EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5EE:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F2
; Address: $CEF6FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F2:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F3
; Address: $CEF708
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F3:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F4
; Address: $CEF713
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F4:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F5
; Address: $CEF71E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F5:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC $99			  ; C6 99 | Decrement (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F6
; Address: $CEF729
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F6:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F7
; Address: $CEF734
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F7:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F8
; Address: $CEF73F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F8:
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$14			 ; A9 14 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5F9
; Address: $CEF744
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5F9:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $986D			; 8D 6D 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FA
; Address: $CEF74E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FA:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FB
; Address: $CEF759
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FB:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FC
; Address: $CEF764
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FC:
	LDA $9879			; AD 79 98 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $9879			; 8D 79 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FD
; Address: $CEF76E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FD:
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $9879			; 2D 79 98 | Logical AND with accumulator (absolute)
	STA $9879			; 8D 79 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FE
; Address: $CEF77B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FE:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_5FF
; Address: $CEF786
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_5FF:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_600
; Address: $CEF791
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_600:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $18			  ; 85 18 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1C			  ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_601
; Address: $CEF7B6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_601:
	INY				  ; C8 | Increment Y register
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1E			  ; 85 1E | Update graphics data
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA				  ; BF F1 77 C7 | Read graphics status
	STA $98A7			; 8D A7 98 | Update graphics data
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA				  ; BF F1 77 C7 | Read graphics status
	STA $98A9			; 8D A9 98 | Update graphics data
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA				  ; BF F1 77 C7 | Read graphics status
	STA $98AB			; 8D AB 98 | Update graphics data
	LDX $1E			  ; A6 1E | Load from zero page into X register
	LDA				  ; BF F1 77 C7 | Read graphics status
	STA $98AD			; 8D AD 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_602
; Address: $CEF7F1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_602:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	STA $98AF			; 8D AF 98 | Update graphics data
	STX $98B1			; 8E B1 98 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_603
; Address: $CEF800
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_603:
	STA $9858			; 8D 58 98 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	STA $985A			; 8D 5A 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_604
; Address: $CEF808
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_604:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	STA $C87E,Y		  ; 99 7E C8 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LDA ($99,X)		  ; A1 99 | Read graphics status
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LDA $99			  ; A5 99 | Read graphics status
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_605
; Address: $CEF82E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_605:
	STA				  ; 9F 99 7E A3 | Update graphics data
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_606
; Address: $CEF843
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_606:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $987F			; 8D 7F 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $9881			; 8D 81 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_607
; Address: $CEF851
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_607:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $9887			; 8D 87 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $9889			; 8D 89 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_608
; Address: $CEF85F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_608:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $988B			; 8D 8B 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $988D			; 8D 8D 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_609
; Address: $CEF86D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_609:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $988F			; 8D 8F 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $9891			; 8D 91 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_60A
; Address: $CEF87B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_60A:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $9893			; 8D 93 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $9895			; 8D 95 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_60B
; Address: $CEF889
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_60B:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $9897			; 8D 97 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $9899			; 8D 99 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_60D
; Address: $CEF89A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_60D:
	LDA $00			  ; A5 00 | Read graphics status
	STA $989B			; 8D 9B 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $989D			; 8D 9D 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_60E
; Address: $CEF8A5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_60E:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $989F			; 8D 9F 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $98A1			; 8D A1 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_60F
; Address: $CEF8B3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_60F:
	JSR $792C			; 20 2C 79 | Jump to subroutine
	LDA $00			  ; A5 00 | Read graphics status
	STA $98A3			; 8D A3 98 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	STA $98A5			; 8D A5 98 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_611
; Address: $CEF8C5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_611:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $99BB			; 8D BB 99 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_612
; Address: $CEF8CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_612:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $99BD			; 8D BD 99 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_618
; Address: $CEF8EB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_618:
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA				  ; 9F 22 FD 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_619
; Address: $CEF8FA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_619:
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCS $04			  ; B0 04 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_61B
; Address: $CEF909
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_61B:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $19			  ; F0 19 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $99C9,X		  ; BD C9 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $05			  ; 80 05 | Branch always
	STA $99C9,X		  ; 9D C9 99 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_61C
; Address: $CEF92C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_61C:
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$5C			 ; A9 5C | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $01			  ; 85 01 | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $02			  ; 85 02 | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_623
; Address: $CEF964
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_623:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_627
; Address: $CEF983
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_627:
	JSL $C77656		  ; 22 56 76 C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ASL $C775,X		  ; 1E 75 C7 | Arithmetic shift left (absolute,X)
	LDX $C30B			; AE 0B C3 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_628
; Address: $CEF991
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_628:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_629
; Address: $CEF9A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_629:
	JSL $C7752B		  ; 22 2B 75 C7 | Jump to subroutine long
	LDA #$5C			 ; A9 5C | Read graphics status
	STA $9897			; 8D 97 98 | Update graphics data
	LDX $C30B			; AE 0B C3 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_62A
; Address: $CEF9AD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_62A:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	STA $9898			; 8D 98 98 | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $9899			; 8D 99 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_62C
; Address: $CEF9CA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_62C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_62D
; Address: $CEF9DF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_62D:
	TAX				  ; AA | Transfer accumulator to X register
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_62E
; Address: $CEF9E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_62E:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_630
; Address: $CEF9F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_630:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_632
; Address: $CEFA0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_632:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_635
; Address: $CEFA25
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_635:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $33			  ; D0 33 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_636
; Address: $CEFA39
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_636:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_637
; Address: $CEFA51
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_637:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_639
; Address: $CEFA6C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_639:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_63B
; Address: $CEFA82
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_63B:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	STA $1C			  ; 85 1C | Update graphics data
	LDA #$0F			 ; A9 0F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $1C			  ; E5 1C | Subtract with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $1C			  ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_63C
; Address: $CEFA9C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_63C:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	STA $1E			  ; 85 1E | Update graphics data
	STZ $18			  ; 64 18 | Store zero to zero page
	STZ $1A			  ; 64 1A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_63D
; Address: $CEFAAE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_63D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_63E
; Address: $CEFABD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_63E:
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $1C			  ; A5 1C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$1F			 ; 69 1F | Add with carry (immediate)
	BRA $0B			  ; 80 0B | Branch always
	LDA $1C			  ; A5 1C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	STA $18			  ; 85 18 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_641
; Address: $CEFAE6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_641:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA $8D00			; 0D 00 8D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_642
; Address: $CEFAF5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_642:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BEQ $3F			  ; F0 3F | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_644
; Address: $CEFB0B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_644:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $18			  ; 85 18 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_645
; Address: $CEFB1C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_645:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SBC #$04			 ; E9 04 | Subtract with carry (immediate)
	STA $1A			  ; 85 1A | Update graphics data
	LDA #$07			 ; A9 07 | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_647
; Address: $CEFB3F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_647:
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	LDA $18			  ; A5 18 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $1C			  ; E5 1C | Subtract with carry (zero page)
	BRA $05			  ; 80 05 | Branch always
	LDA $18			  ; A5 18 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $18			  ; 85 18 | Update graphics data
	STA $9858			; 8D 58 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_648
; Address: $CEFB5B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_648:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ADC ($F6,X)		  ; 61 F6 | Add with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $1A			  ; A5 1A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C313			; 6D 13 C3 | Add with carry (absolute)
	BRA $06			  ; 80 06 | Branch always
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $C313			; ED 13 C3 | Subtract with carry (absolute)
	STA $985A			; 8D 5A 98 | Update graphics data
	LDA $18			  ; A5 18 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_649
; Address: $CEFB82
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_649:
	JSR $7BC7			; 20 C7 7B | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC $968E			; ED 8E 96 | Subtract with carry (absolute)
	STA $AD6D			; 8D 6D AD | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_64A
; Address: $CEFB8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_64A:
	JSR $7BD5			; 20 D5 7B | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC $9690			; ED 90 96 | Subtract with carry (absolute)
	STA $AD6F			; 8D 6F AD | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_64B
; Address: $CEFB99
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_64B:
	LDA $C30B			; AD 0B C3 | Read graphics status
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_64C
; Address: $CEFBA2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_64C:
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA #$AD			 ; A9 AD | Read graphics status
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_64E
; Address: $CEFBB4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_64E:
	STZ $1A			  ; 64 1A | Store zero to zero page
	LDA #$02			 ; A9 02 | Read graphics status
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_651
; Address: $CEFBC7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_651:
	PHA				  ; 48 | Push accumulator to stack
	LDA $9A0F			; AD 0F 9A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_652
; Address: $CEFBD5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_652:
	PHA				  ; 48 | Push accumulator to stack
	LDA $9A17			; AD 17 9A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_653
; Address: $CEFBE3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_653:
	JSR $7C04			; 20 04 7C | Jump to subroutine
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_654
; Address: $CEFBF0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_654:
	JSR $7C04			; 20 04 7C | Jump to subroutine
	LDA $C425,Y		  ; B9 25 C4 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C425,Y		  ; 99 25 C4 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_655
; Address: $CEFBFD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_655:
	JSR $7C04			; 20 04 7C | Jump to subroutine
	STA $CFE5,Y		  ; 99 E5 CF | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_656
; Address: $CEFC04
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_656:
	PHA				  ; 48 | Push accumulator to stack
	LDA $C1AD			; AD AD C1 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DAA5,Y		  ; B9 A5 DA | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_658
; Address: $CEFC15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_658:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65A
; Address: $CEFC27
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	STA $3518,Y		  ; 99 18 35 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65B
; Address: $CEFC3A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SBC $9A61			; ED 61 9A | Subtract with carry (absolute)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	STA $350C,Y		  ; 99 0C 35 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65C
; Address: $CEFC54
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SBC $9A81			; ED 81 9A | Subtract with carry (absolute)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	STA $3518,Y		  ; 99 18 35 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65D
; Address: $CEFC6F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65D:
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	LDX $7F2A			; AE 2A 7F | Load from absolute address into X register
	LDA $D765,X		  ; BD 65 D7 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C725,X		  ; BD 25 C7 | Read graphics status
	STA $350C,Y		  ; 99 0C 35 | Update graphics data
	LDA $C765,X		  ; BD 65 C7 | Read graphics status
	STA $3518,Y		  ; 99 18 35 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65E
; Address: $CEFC8A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65E:
	LDX $DB05			; AE 05 DB | Load from absolute address into X register
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	STA $350C,X		  ; 9D 0C 35 | Update graphics data
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	STA $3518,X		  ; 9D 18 35 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_65F
; Address: $CEFC9D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_65F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AD23,X		  ; BD 23 AD | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_660
; Address: $CEFCA5
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_660:
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $44			  ; 80 44 | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	STA $AD23,X		  ; 9D 23 AD | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	STA $AD2B,X		  ; 9D 2B AD | Update graphics data
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	STA $AD33,X		  ; 9D 33 AD | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $AD43,X		  ; 9D 43 AD | Update graphics data
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	LDA $03A3			; AD A3 03 | Read graphics status
	STA $AD3B,X		  ; 9D 3B AD | Update graphics data
	CMP $DB05			; CD 05 DB | Compare accumulator (absolute)
	BNE $16			  ; D0 16 | Branch if not equal
	STX $DB01			; 8E 01 DB | Store X register to absolute address
	LDA $AD23,X		  ; BD 23 AD | Read graphics status
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $AD23,X		  ; 9D 23 AD | Update graphics data
	LDA $AD43,X		  ; BD 43 AD | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DAA5			; AD A5 DA | Read graphics status
	STA $D7A5,X		  ; 9D A5 D7 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_661
; Address: $CEFCFA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_661:
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $AD23,X		  ; BD 23 AD | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	LDA $AD3B,X		  ; BD 3B AD | Read graphics status
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	BRA $03			  ; 80 03 | Branch always
	STZ $AD23,X		  ; 9E 23 AD | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_663
; Address: $CEFD1B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_663:
	LDY $DB05			; AC 05 DB | Load from absolute address into Y register
	STA $DB05			; 8D 05 DB | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	BIT $AD7D			; 2C 7D AD | Test bits in accumulator (absolute)
	ORA $DB			  ; 05 DB | Logical OR with accumulator (zero page)
	STA $DB03			; 8D 03 DB | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_664
; Address: $CEFD2C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_664:
	SEC				  ; 38 | Set carry flag
	ADC $7DA5,X		  ; 7D A5 7D | Add with carry (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	ADC $7DA5,X		  ; 7D A5 7D | Add with carry (absolute,X)
	ADC $7DA5,X		  ; 7D A5 7D | Add with carry (absolute,X)
	AND $607D,X		  ; 3D 7D 60 | Logical AND with accumulator (absolute,X)
	EOR #$7D			 ; 49 7D | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $7D49,X		  ; 7D 49 7D | Add with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $7D4F,X		  ; 7D 4F 7D | Add with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $2260,X		  ; 7D 60 22 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $C7			  ; 70 C7 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_665
; Address: $CEFD4F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_665:
	LDA #$02			 ; A9 02 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	LDA $C1C7			; AD C7 C1 | Read graphics status
	BNE $FA			  ; D0 FA | Branch if not equal
	LDA #$06			 ; A9 06 | Read graphics status
	STA $C1C3			; 8D C3 C1 | Update graphics data
	LDA $C1C3			; AD C3 C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $F7			  ; D0 F7 | Branch if not equal
	STZ $C1C3			; 9C C3 C1 | Store zero to absolute
	STZ $C1CB			; 9C CB C1 | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	STA $DB05			; 8D 05 DB | Update graphics data
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	STA $3514			; 8D 14 35 | Update graphics data
	STA $9852			; 8D 52 98 | Update graphics data
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	STA $3520			; 8D 20 35 | Update graphics data
	STA $9854			; 8D 54 98 | Update graphics data
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $985C			; 8D 5C 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_66A
; Address: $CEFDA9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_66A:
	JSL $C770C0		  ; 22 C0 70 C7 | Jump to subroutine long
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	SBC $CD			  ; E5 CD | Subtract with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_66D
; Address: $CEFDB9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_66D:
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_66E
; Address: $CEFDBF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_66E:
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	INC $DB09			; EE 09 DB | Increment (absolute)

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_66F
; Address: $CEFDCE
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_66F:
	JSL $C77219		  ; 22 19 72 C7 | Jump to subroutine long
	STZ $DB09			; 9C 09 DB | Store zero to absolute
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA #$01			 ; A9 01 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $CFA5,Y		  ; B9 A5 CF | Read graphics status
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $CFA5,X		  ; BD A5 CF | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	LDA $CF			  ; A5 CF | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$08			 ; A9 08 | Read graphics status
	STA $DB05			; 8D 05 DB | Update graphics data
	STZ $C1D3			; 9C D3 C1 | Store zero to absolute
	STZ $C1C7			; 9C C7 C1 | Store zero to absolute
	LDX #$30			 ; A2 30 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_670
; Address: $CEFE04
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_670:
	JSL $C7301B		  ; 22 1B 30 C7 | Jump to subroutine long
	JMP $C60112		  ; 5C 12 01 C6 | Jump to address long
	CMP $DB05			; CD 05 DB | Compare accumulator (absolute)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_675
; Address: $CEFE22
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_675:
	JSR $7EF0			; 20 F0 7E | Jump to subroutine
	JMP $7E28			; 4C 28 7E | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_67A
; Address: $CEFE3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_67A:
	JSR $80A6			; 20 A6 80 | Jump to subroutine
	LDA #$DA			 ; A9 DA | Read graphics status
	CLC				  ; 18 | Clear carry flag
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_67D
; Address: $CEFE4F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_67D:
	JSR $7EFD			; 20 FD 7E | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	LDA $AD61			; AD 61 AD | Read graphics status
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_67F
; Address: $CEFE62
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_67F:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	JMP $7E93			; 4C 93 7E | Jump to address
	LDX $99F7			; AE F7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_680
; Address: $CEFE72
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_680:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDX $C8			  ; A6 C8 | Load from zero page into X register
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_683
; Address: $CEFE93
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_683:
	LDA $99F9			; AD F9 99 | Read graphics status
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	BNE $13			  ; D0 13 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_685
; Address: $CEFEA3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_685:
	ORA $3640,X		  ; 1D 40 36 | Logical OR with accumulator (absolute,X)
	STA $3640,X		  ; 9D 40 36 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_686
; Address: $CEFEAA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_686:
	JSR $7EB4			; 20 B4 7E | Jump to subroutine
	ORA $3660,X		  ; 1D 60 36 | Logical OR with accumulator (absolute,X)
	STA $3660,X		  ; 9D 60 36 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_687
; Address: $CEFEB4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_687:
	LDA $C765,Y		  ; B9 65 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C725,Y		  ; B9 25 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 51 80 C7 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_688
; Address: $CEFECE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_688:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $AD57			; 8D 57 AD | Update graphics data
	STA $AD59			; 8D 59 AD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_68B
; Address: $CEFEE3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_68B:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $AD53			; 8D 53 AD | Update graphics data
	LDA #$34			 ; A9 34 | Read graphics status
	STA $AD55			; 8D 55 AD | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_68C
; Address: $CEFEF0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_68C:
	LDA #$02			 ; A9 02 | Read graphics status
	STA $AD53			; 8D 53 AD | Update graphics data
	LDA #$35			 ; A9 35 | Read graphics status
	STA $AD55			; 8D 55 AD | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_68E
; Address: $CEFF00
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_68E:
	JSL $C01056		  ; 22 56 10 C0 | Jump to subroutine long
	LDA $AD57			; AD 57 AD | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_690
; Address: $CEFF11
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_690:
	LDA $AD59			; AD 59 AD | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_694
; Address: $CEFF2A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_694:
	LDA #$13			 ; A9 13 | Read graphics status
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
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FFC4C		  ; 8F 4C FC 7F | Update graphics data
	LDX $AD53			; AE 53 AD | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_695
; Address: $CEFF58
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_695:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_696
; Address: $CEFF6C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_696:
	JSL $C06E61		  ; 22 61 6E C0 | Jump to subroutine long
	BCC $6A			  ; 90 6A | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Read graphics status
	STA $AD57			; 8D 57 AD | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LSR $FC			  ; 46 FC | Logical shift right (zero page)
	STA $7FFC48		  ; 8F 48 FC 7F | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FFC4C		  ; 8F 4C FC 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_697
; Address: $CEFF8B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_697:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_698
; Address: $CEFF9F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_698:
	JSL $C06E61		  ; 22 61 6E C0 | Jump to subroutine long
	BCC $37			  ; 90 37 | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Read graphics status
	STA $AD59			; 8D 59 AD | Update graphics data

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_69B
; Address: $CEFFBB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_69B:
	JSL $C030D2		  ; 22 D2 30 C0 | Jump to subroutine long
	STA $AD5B			; 8D 5B AD | Update graphics data
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_69E
; Address: $CEFFD4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_69E:
	JSL $C04604		  ; 22 04 46 C0 | Jump to subroutine long
	SBC ($34),Y		  ; F1 34 | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_69F
; Address: $CEFFDD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_69F:
	LDA $AD53			; AD 53 AD | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1C_GraphicsFunction_6A0
; Address: $CEFFEB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1C_GraphicsFunction_6A0:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 51 80 C7 | Read graphics status
	AND $3640,Y		  ; 39 40 36 | Logical AND with accumulator (absolute,Y)
