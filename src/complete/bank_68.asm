;==============================================================================
; Dragon Quest III - Bank $68
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $F40000-$F47FFF
; Instructions: 8588
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_68"

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_001
; Address: $F48003
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_001:
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BMI $F8			  ; 30 F8 | Branch if negative
	BMI $F8			  ; 30 F8 | Branch if negative
	BMI $80			  ; 30 80 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_002
; Address: $F4801A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_002:
	BCC $20			  ; 90 20 | Branch if carry clear
	BCC $20			  ; 90 20 | Branch if carry clear
	BCC $20			  ; 90 20 | Branch if carry clear
	AND $1E7E,X		  ; 3D 7E 1E | Logical AND with accumulator (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_004
; Address: $F4803B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_004:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $BE			  ; 80 BE | Branch always
	CMP ($EE,X)		  ; C1 EE | Compare accumulator ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($FE),Y		  ; 71 FE | Add with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $1E7E,X		  ; 3D 7E 1E | Logical AND with accumulator (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_005
; Address: $F48099
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_005:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_006
; Address: $F480A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_006:
	BRA $BE			  ; 80 BE | Branch always
	CMP ($DD,X)		  ; C1 DD | Compare accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_007
; Address: $F480BB
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_007:
	JSL $001800		  ; 22 00 18 00 | Jump to subroutine long
	LDY $78			  ; A4 78 | Load from zero page into Y register
	SEP #$7C			 ; E2 7C | Set processor status bits
	SEP #$7C			 ; E2 7C | Set processor status bits
	ROR				  ; 6A | Rotate right (accumulator)
	NOP				  ; EA | No operation
	REP #$FC			 ; C2 FC | Reset processor status bits
	REP #$FC			 ; C2 FC | Reset processor status bits
	SEP #$FC			 ; E2 FC | Set processor status bits
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $177F,X		  ; 1E 7F 17 | Arithmetic shift left (absolute,X)
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_008
; Address: $F480FD
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_008:
	JSR $1000			; 20 00 10 | Jump to subroutine
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	CMP $FFE7,Y		  ; D9 E7 FF | Compare accumulator (absolute,Y)
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $94			  ; F0 94 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	REP #$FC			 ; C2 FC | Reset processor status bits
	REP #$FC			 ; C2 FC | Reset processor status bits
	REP #$FC			 ; C2 FC | Reset processor status bits
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_009
; Address: $F48152
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_009:
	JSR $0058			; 20 58 00 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	JMP $4400			; 4C 00 44 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	BMI $EC			  ; 30 EC | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPX $38			  ; E4 38 | Compare X register (zero page)
	CPX $38			  ; E4 38 | Compare X register (zero page)
	CPX $38			  ; E4 38 | Compare X register (zero page)
	CPX $38			  ; E4 38 | Compare X register (zero page)
	LDY $78			  ; A4 78 | Load from zero page into Y register
	LDY $78			  ; A4 78 | Load from zero page into Y register
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_00A
; Address: $F48173
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_00A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	REP #$FC			 ; C2 FC | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_00B
; Address: $F48208
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_00B:
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND $3D7E,X		  ; 3D 7E 3D | Logical AND with accumulator (absolute,X)
	ROR $7F1E,X		  ; 7E 1E 7F | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_00C
; Address: $F4827B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_00C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	INC $7D01,X		  ; FE 01 7D | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	CPX $78			  ; E4 78 | Compare X register (zero page)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $F8			  ; 84 F8 | Store Y register to zero page
	STY $F8			  ; 84 F8 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_00D
; Address: $F482B3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_00D:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_00E
; Address: $F482BF
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_00E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_010
; Address: $F4831B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_010:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	STY $0CFF			; 8C FF 0C | Store Y register to absolute address
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $8B00,X		  ; 1E 00 8B | Arithmetic shift left (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_011
; Address: $F4836F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_011:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_012
; Address: $F4839F
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_012:
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $8B00,X		  ; 1E 00 8B | Arithmetic shift left (absolute,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $23			  ; 80 23 | Branch always
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $78FF,X		  ; FE FF 78 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_014
; Address: $F48435
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_014:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $3B33			; 0D 33 3B | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_015
; Address: $F4845D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_015:
	JSR $4338			; 20 38 43 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 81 7E F1 | Read graphics status

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_016
; Address: $F48466
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_016:
	JSL $F87EF8		  ; 22 F8 7E F8 | Jump to subroutine long
	ROR $FC			  ; 66 FC | Rotate right (zero page)
	INC $BB			  ; E6 BB | Increment (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	AND ($18,X)		  ; 21 18 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	ROL $A4FE,X		  ; 3E FE A4 | Rotate left (absolute,X)
	ROR $F69F			; 6E 9F F6 | Rotate right (absolute)
	ASL $8F00			; 0E 00 8F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_017
; Address: $F484D5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_017:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BIT $1100			; 2C 00 11 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_019
; Address: $F484E0
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_019:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	CPX $80			  ; E4 80 | Compare X register (zero page)
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	BMI $E8			  ; 30 E8 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BNE $80			  ; D0 80 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ROL $A4FE,X		  ; 3E FE A4 | Rotate left (absolute,X)
	STA				  ; 9F 77 8F 00 | Update graphics data
	STX $3F			  ; 86 3F | Store X register to zero page
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($60),Y		  ; 11 60 | Logical OR with accumulator ((zero page),Y)
	BVS $07			  ; 70 07 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_01A
; Address: $F48540
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_01A:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	CPY #$92			 ; C0 92 | Compare Y register (immediate)
	CPX #$6C			 ; E0 6C | Compare X register (immediate)
	BCC $74			  ; 90 74 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $80			  ; D0 80 | Branch if not equal
	STZ $04			  ; 64 04 | Store zero to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_01B
; Address: $F48577
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_01B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA #$3D			 ; 09 3D | Logical OR with accumulator (immediate)
	EOR $FB			  ; 45 FB | Exclusive OR with accumulator (zero page)
	STA				  ; 9F FF AF FF | Update graphics data
	BIT $0481			; 2C 81 04 | Test bits in accumulator (absolute)
	STA $B500,Y		  ; 99 00 B5 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	STX $47			  ; 86 47 | Store X register to zero page
	LDX $FEBB,Y		  ; BE BB FE | Load from absolute,Y into X register
	INC $FEEB,X		  ; FE EB FE | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	INC $B2			  ; E6 B2 | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STA				  ; 9F FF AF FF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ROR				  ; 6A | Rotate right (accumulator)
	BRA $64			  ; 80 64 | Branch always
	RTI				  ; 40 | Return from interrupt
	PEA #$8C08		   ; F4 08 8C | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	XBA				  ; EB | Exchange accumulator bytes
	INC $06FB,X		  ; FE FB 06 | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	BRA $60			  ; 80 60 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	INC $58			  ; E6 58 | Increment (zero page)
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_01C
; Address: $F48620
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_01C:
	PLY				  ; 7A | Pull Y register from stack
	EOR $FB			  ; 45 FB | Exclusive OR with accumulator (zero page)
	ADC $4FFF,Y		  ; 79 FF 4F | Add with carry (absolute,Y)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	STA $FA00,Y		  ; 99 00 FA | Update graphics data
	SBC $E700			; ED 00 E7 | Subtract with carry (absolute)
	EOR $4DA0			; 4D A0 4D | Exclusive OR with accumulator (absolute)
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	LDY #$F6			 ; A0 F6 | Load immediate value into Y register
	LDX $FF9F,Y		  ; BE 9F FF | Load from absolute,Y into X register
	SBC $F4FF,Y		  ; F9 FF F4 | Subtract with carry (absolute,Y)
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	LDY $DA00			; AC 00 DA | Load from absolute address into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $07			  ; 80 07 | Branch always
	ASL $1E0F,X		  ; 1E 0F 1E | Arithmetic shift left (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BIT $2400			; 2C 00 24 | Test bits in accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	JMP $4400			; 4C 00 44 | Jump to address
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $0CFA			; 0E FA 0C | Arithmetic shift left (absolute)
	LDY $78			  ; A4 78 | Load from zero page into Y register
	LDY $78			  ; A4 78 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $1F1F			; 0E 1F 1F | Arithmetic shift left (absolute)
	ROL $3C1F,X		  ; 3E 1F 3C | Rotate left (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BIT $4800			; 2C 00 48 | Test bits in accumulator (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	ASL $0EF5			; 0E F5 0E | Arithmetic shift left (absolute)
	SBC #$1E			 ; E9 1E | Subtract with carry (immediate)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_01E
; Address: $F486FD
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_01E:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	JMP $4400			; 4C 00 44 | Jump to address
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $E4			  ; 70 E4 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CPX $38			  ; E4 38 | Compare X register (zero page)
	LDY $78			  ; A4 78 | Load from zero page into Y register
	LDY $78			  ; A4 78 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_01F
; Address: $F48730
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_01F:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $3D7E,X		  ; 3D 7E 3D | Logical AND with accumulator (absolute,X)
	INC $FE3D,X		  ; FE 3D FE | Increment (absolute,X)
	ROL $8FFF			; 2E FF 8F | Rotate left (absolute)
	STA $7F837F		  ; 8F 7F 83 7F | Update graphics data
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	BRA $01			  ; 80 01 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BVC $FF			  ; 50 FF | Branch if overflow clear
	SBC $FB03,X		  ; FD 03 FB | Subtract with carry (absolute,X)
	STA $FFFFFF		  ; 8F FF FF FF | Update graphics data
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_020
; Address: $F48780
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_020:
	CPX $78			  ; E4 78 | Compare X register (zero page)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	SED				  ; F8 | Set decimal mode flag
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_021
; Address: $F48789
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_021:
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_022
; Address: $F4879F
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_022:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $7EFE,X		  ; 7D FE 7E | Add with carry (absolute,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $02			  ; 84 02 | Store Y register to zero page
	STY $02			  ; 84 02 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND $3D7E,X		  ; 3D 7E 3D | Logical AND with accumulator (absolute,X)
	ROR $FF3E,X		  ; 7E 3E FF | Rotate right (absolute,X)
	ASL $9FFF,X		  ; 1E FF 9F | Arithmetic shift left (absolute,X)
	STA				  ; 9F 7F 8F 7F | Update graphics data
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	INC $FB01,X		  ; FE 01 FB | Increment (absolute,X)
	STA $FFFFFF		  ; 8F FF FF FF | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_024
; Address: $F48860
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_024:
	CPX $78			  ; E4 78 | Compare X register (zero page)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	STZ $F8			  ; 64 F8 | Store zero to zero page
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($3F,X)		  ; 41 3F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_025
; Address: $F48886
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_025:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $0F			  ; 30 0F | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_026
; Address: $F488D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_026:
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_027
; Address: $F48900
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_027:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_028
; Address: $F48926
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_028:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_029
; Address: $F48957
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_029:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_02A
; Address: $F48966
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_02A:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $171A			; 0E 1A 17 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BEQ $0C			  ; F0 0C | Branch if equal
	ROR $F06C			; 6E 6C F0 | Rotate right (absolute)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $C0			  ; 80 C0 | Branch always
	ROR $F000			; 6E 00 F0 | Rotate right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ROL $1B00,X		  ; 3E 00 1B | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	ADC #$59			 ; 69 59 | Add with carry (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ROL $1B3F,X		  ; 3E 3F 1B | Rotate left (absolute,X)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	ADC ($FE,X)		  ; 61 FE | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA $C9E0,X		  ; 1D E0 C9 | Logical OR with accumulator (absolute,X)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	SBC #$F0			 ; E9 F0 | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_02C
; Address: $F48A00
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_02C:
	JSR $F030			; 20 30 F0 | Jump to subroutine
	JMP ($8E74)		  ; 6C 74 8E | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	BCS $C8			  ; B0 C8 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CPX $3828			; EC 28 38 | Compare X register (absolute)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_02D
; Address: $F48A13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_02D:
	JMP ($8E04)		  ; 6C 04 8E | Jump to address (absolute indirect)
	BRA $C8			  ; 80 C8 | Branch always
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_02E
; Address: $F48A27
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_02E:
	JSR $7F3F			; 20 3F 7F | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	ADC $7C7F,Y		  ; 79 7F 7C | Add with carry (absolute,Y)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	ADC $7C40,X		  ; 7D 40 7C | Add with carry (absolute,X)
	ROR $7C7E,X		  ; 7E 7E 7C | Rotate right (absolute,X)
	ROR $7C03,X		  ; 7E 03 7C | Rotate right (absolute,X)
	BMI $10			  ; 30 10 | Branch if negative
	ROL $007E,X		  ; 3E 7E 00 | Rotate left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $0D0D,X		  ; 1E 0D 0D | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BNE $B0			  ; D0 B0 | Branch if not equal
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_02F
; Address: $F48AA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_02F:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_030
; Address: $F48AAB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_030:
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_032
; Address: $F48AC0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_032:
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_033
; Address: $F48AC5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_033:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_034
; Address: $F48ADE
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_034:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $7111,X		  ; 3E 11 71 | Rotate left (absolute,X)
	LDX $B946,Y		  ; BE 46 B9 | Load from absolute,Y into X register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $207F,X		  ; 1E 7F 20 | Arithmetic shift left (absolute,X)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BEQ $8C			  ; F0 8C | Branch if equal
	BIT $841E			; 2C 1E 84 | Test bits in accumulator (absolute)
	STX $00			  ; 86 00 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $C0			  ; 80 C0 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	STY $DEC0			; 8C C0 DE | Store Y register to absolute address
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $1A00			; 0D 00 1A | Logical OR with accumulator (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA $1A0F			; 0D 0F 1A | Logical OR with accumulator (absolute)
	ORA $3F31,X		  ; 1D 31 3F | Logical OR with accumulator (absolute,X)
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_036
; Address: $F48B4C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_036:
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_037
; Address: $F48B5B
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_037:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CPY $7C3F			; CC 3F 7C | Compare Y register (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	BEQ $E1			  ; F0 E1 | Branch if equal
	INC $FF38,X		  ; FE 38 FF | Increment (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_038
; Address: $F48BBB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_038:
	JSR $2800			; 20 00 28 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_03A
; Address: $F48BCC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_03A:
	JSR $90C0			; 20 C0 90 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_03B
; Address: $F48BD6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_03B:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_03C
; Address: $F48BDF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_03C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($7CDF)		  ; 6C DF 7C | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_03D
; Address: $F48C11
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_03D:
	STA $0100,Y		  ; 99 00 01 | Update graphics data
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	STY $7E00			; 8C 00 7E | Store Y register to absolute address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_041
; Address: $F48C38
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_041:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	JMP ($78DF)		  ; 6C DF 78 | Jump to address (absolute indirect)
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $07			  ; 10 07 | Branch if positive
	JMP ($3F17)		  ; 6C 17 3F | Jump to address (absolute indirect)
	JMP $009900		  ; 5C 00 99 00 | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_045
; Address: $F48C7A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_045:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	LDX $5C43,Y		  ; BE 43 5C | Load from absolute,Y into X register
	JMP $172B23		  ; 5C 23 2B 17 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	INC $6CCC,X		  ; FE CC 6C | Increment (absolute,X)
	BCC $38			  ; 90 38 | Branch if carry clear
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPX $0C0E			; EC 0E 0C | Compare X register (absolute)
	CPY $00CC			; CC CC 00 | Compare Y register (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $FCF4			; EC F4 FC | Compare X register (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	ROL $2F39			; 2E 39 2F | Rotate left (absolute)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA $070F			; 0D 0F 07 | Logical OR with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_047
; Address: $F48CE8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_047:
	BRA $00			  ; 80 00 | Branch always
	BVS $B0			  ; 70 B0 | Branch if overflow set
	BCC $70			  ; 90 70 | Branch if carry clear
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_049
; Address: $F48D00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_049:
	JSR $90C0			; 20 C0 90 | Jump to subroutine
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$F8FA		   ; F4 FA F8 | Push effective address to stack
	SBC $91FA,Y		  ; F9 FA 91 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_04A
; Address: $F48D13
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_04A:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $70			  ; 10 70 | Branch if positive
	LDA				  ; BF 47 B8 40 | Read graphics status

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_04B
; Address: $F48D38
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_04B:
	JSR $002F			; 20 2F 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BEQ $8C			  ; F0 8C | Branch if equal
	BIT $001E			; 2C 1E 00 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $C0			  ; 80 C0 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	STY $DEC0			; 8C C0 DE | Store Y register to absolute address
	LDA				  ; BF 47 BF 47 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BVC $30			  ; 50 30 | Branch if overflow clear
	STY $86			  ; 84 86 | Store Y register to zero page
	INC $6CCC,X		  ; FE CC 6C | Increment (absolute,X)
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $A0			  ; 80 A0 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX $3828			; EC 28 38 | Compare X register (absolute)
	INC $CCCC,X		  ; FE CC CC | Increment (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_04C
; Address: $F48D97
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_04C:
	BRA $80			  ; 80 80 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_04D
; Address: $F48DA0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_04D:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_051
; Address: $F48DBC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_051:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_053
; Address: $F48DDE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_053:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SEP #$EC			 ; E2 EC | Set processor status bits
	BEQ $61			  ; F0 61 | Branch if equal
	INC $FF7E,X		  ; FE 7E FF | Increment (absolute,X)
	DEC $6E00			; CE 00 6E | Decrement (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	ORA #$81			 ; 09 81 | Logical OR with accumulator (immediate)
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	BMI $C0			  ; 30 C0 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_055
; Address: $F48E0A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_055:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_057
; Address: $F48E15
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_057:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_058
; Address: $F48E22
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_058:
	JSR $98C0			; 20 C0 98 | Jump to subroutine
	CPX #$C4			 ; E0 C4 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F8FA		   ; F4 FA F8 | Push effective address to stack
	SBC $C1FA,Y		  ; F9 FA C1 | Subtract with carry (absolute,Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_05B
; Address: $F48E3F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_05B:
	JSL $84FC12		  ; 22 12 FC 84 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$61			 ; E0 61 | Compare X register (immediate)
	INC $FF7C,X		  ; FE 7C FF | Increment (absolute,X)
	LDY $00C3,X		  ; BC C3 00 | Load from absolute,X into Y register
	CPY $6800			; CC 00 68 | Compare Y register (absolute)
	SBC $0101,Y		  ; F9 01 01 | Subtract with carry (absolute,Y)
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_05C
; Address: $F48E5B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_05C:
	JSR $C01C			; 20 1C C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_05D
; Address: $F48E64
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_05D:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_05E
; Address: $F48E74
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_05E:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_05F
; Address: $F48E7F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_05F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ADC $4900			; 6D 00 49 | Add with carry (absolute)
	ADC $49DB			; 6D DB 49 | Add with carry (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_060
; Address: $F48EAA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_060:
	JSR $D800			; 20 00 D8 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_061
; Address: $F48EBA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_061:
	JSR $D8E0			; 20 E0 D8 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_062
; Address: $F48EE2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_062:
	ADC $C900			; 6D 00 C9 | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ADC $C95B			; 6D 5B C9 | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_063
; Address: $F48F04
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_063:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_064
; Address: $F48F14
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_064:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1F2F			; 0E 2F 1F | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	WDM #$06			 ; 42 06 | Reserved instruction
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_065
; Address: $F48F3A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_065:
	JSR $457F			; 20 7F 45 | Jump to subroutine
	EOR ($43,X)		  ; 41 43 | Exclusive OR with accumulator ((zero page,X))
	BPL $D8			  ; 10 D8 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	LDY $2480,X		  ; BC 80 24 | Load from absolute,X into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	BIT $5864			; 2C 64 58 | Test bits in accumulator (absolute)
	SBC $00E1,Y		  ; F9 E1 00 | Subtract with carry (absolute,Y)
	BPL $D8			  ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_067
; Address: $F48F58
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_067:
	JSR $C060			; 20 60 C0 | Jump to subroutine
	CPX $D8C0			; EC C0 D8 | Compare X register (absolute)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_068
; Address: $F48F69
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_068:
	JSL $000008		  ; 22 08 00 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $0822,X		  ; 3E 22 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_069
; Address: $F48F97
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_069:
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06A
; Address: $F48FAE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $3008,X		  ; 1E 08 30 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06B
; Address: $F48FBD
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06B:
	JSR $0020			; 20 20 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $171A			; 0E 1A 17 | Arithmetic shift left (absolute)
	ADC $4900			; 6D 00 49 | Add with carry (absolute)
	ADC $49DB			; 6D DB 49 | Add with carry (absolute)
	LDA				  ; BF 40 5F 20 | Read graphics status
	BPL $17			  ; 10 17 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	LDX $01			  ; A6 01 | Load from zero page into X register
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06C
; Address: $F49033
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06C:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	LDY #$61			 ; A0 61 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06D
; Address: $F4903C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06D:
	JSR $D8E0			; 20 E0 D8 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	BVS $E8			  ; 70 E8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06E
; Address: $F49047
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06E:
	JSR $00D0			; 20 D0 00 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	REP #$EF			 ; C2 EF | Reset processor status bits

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_06F
; Address: $F49052
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_06F:
	ORA $187F			; 0D 7F 18 | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_070
; Address: $F49058
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_070:
	JSR $C020			; 20 20 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $1700,X		  ; 1D 00 17 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	BPL $28			  ; 10 28 | Branch if positive
	SEC				  ; 38 | Set carry flag
	DEC $1B			  ; C6 1B | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_071
; Address: $F4906F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_071:
	JSR $170C			; 20 0C 17 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0710,X		  ; 1E 10 07 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	INC $3BC6,X		  ; FE C6 3B | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $B0			  ; F0 B0 | Branch if equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_072
; Address: $F49084
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_072:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $83			  ; 80 83 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	BEQ $F8			  ; F0 F8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA $1E1E,Y		  ; 19 1E 1E | Logical OR with accumulator (absolute,Y)
	LDA $1B			  ; A5 1B | Read graphics status
	ADC $4792			; 6D 92 47 | Add with carry (absolute)
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	AND $3802,Y		  ; 39 02 38 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	STA ($52,X)		  ; 81 52 | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ROL $1B00,X		  ; 3E 00 1B | Rotate left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_073
; Address: $F490D2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_073:
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	ADC #$59			 ; 69 59 | Add with carry (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ROL $1B3F,X		  ; 3E 3F 1B | Rotate left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ADC $CD00			; 6D 00 CD | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR $8431			; 4E 31 84 | Logical shift right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $CD5B			; 6D 5B CD | Add with carry (absolute)
	ROR $7FFA,X		  ; 7E FA 7F | Rotate right (absolute,X)
	SBC ($8E),Y		  ; F1 8E | Subtract with carry ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_074
; Address: $F49106
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_074:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BIT $FCE4			; 2C E4 FC | Test bits in accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_075
; Address: $F49116
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_075:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $4B			  ; 10 4B | Branch if positive
	BPL $5C			  ; 10 5C | Branch if positive
	INC				  ; 1A | Increment accumulator
	JMP $785F73		  ; 5C 73 5F 78 | Jump to address long
	INC				  ; 1A | Increment accumulator
	CPY $03			  ; C4 03 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_076
; Address: $F49142
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_076:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	SEP #$00			 ; E2 00 | Set processor status bits
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_077
; Address: $F4914A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_077:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPY $21			  ; C4 21 | PPU graphics register access
	CPX #$21			 ; E0 21 | PPU graphics register access
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_078
; Address: $F49158
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_078:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STX $5B0E			; 8E 0E 5B | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INC $01			  ; E6 01 | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_079
; Address: $F49176
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_079:
	BEQ $07			  ; F0 07 | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BVS $74			  ; 70 74 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX $18			  ; E4 18 | Compare X register (zero page)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_07B
; Address: $F491C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_07B:
	BNE $90			  ; D0 90 | Branch if not equal
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_07C
; Address: $F491D4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_07C:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $03			  ; F0 03 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_07D
; Address: $F491DF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_07D:
	PHP				  ; 08 | Push processor status to stack
	ORA $0F0E,Y		  ; 19 0E 0F | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_07F
; Address: $F49220
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_07F:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BRA $88			  ; 80 88 | Branch always
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	BEQ $30			  ; F0 30 | Branch if equal
	BMI $48			  ; 30 48 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $30			  ; F0 30 | Branch if equal
	BNE $10			  ; D0 10 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_080
; Address: $F49289
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_080:
	JSR $1010			; 20 10 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $3C42			; 2C 42 3C | Test bits in accumulator (absolute)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_081
; Address: $F492B7
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_081:
	WDM #$3C			 ; 42 3C | Reserved instruction
	WDM #$18			 ; 42 18 | Reserved instruction
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	AND $006D			; 2D 6D 00 | Logical AND with accumulator (absolute)
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	AND ($EB,X)		  ; 21 EB | Logical AND with accumulator ((zero page,X))
	AND ($E9,X)		  ; 21 E9 | Logical AND with accumulator ((zero page,X))
	STY $5A08			; 8C 08 5A | Store Y register to absolute address
	SEP #$90			 ; E2 90 | Set processor status bits
	CPX $DC18			; EC 18 DC | Compare X register (absolute)
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal
	STY $DE84			; 8C 84 DE | Store Y register to absolute address
	STY $0C9C			; 8C 9C 0C | Store Y register to absolute address
	JMP $1808			; 4C 08 18 | Jump to address
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	ORA $3606,Y		  ; 19 06 36 | Logical OR with accumulator (absolute,Y)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	ROL $1211			; 2E 11 12 | Rotate left (absolute)
	ORA $000F			; 0D 0F 00 | Logical OR with accumulator (absolute)
	ORA $102F,Y		  ; 19 2F 10 | Logical OR with accumulator (absolute,Y)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA $0F00,X		  ; 1D 00 0F | Logical OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	BMI $10			  ; 30 10 | Branch if negative
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $38			  ; F0 38 | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1B00			; 0E 00 1B | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1B0F			; 0E 0F 1B | Arithmetic shift left (absolute)
	ASL $1C1C,X		  ; 1E 1C 1C | Arithmetic shift left (absolute,X)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	LSR $BD00			; 4E 00 BD | Logical shift right (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $3400,X		  ; 1E 00 34 | Arithmetic shift left (absolute,X)
	BCS $B0			  ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_082
; Address: $F49374
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_082:
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	LSR $BDFE			; 4E FE BD | Logical shift right (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $341E,X		  ; 1E 1E 34 | Arithmetic shift left (absolute,X)
	BIT $3B0C			; 2C 0C 3B | Test bits in accumulator (absolute)
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	ASL $0305,X		  ; 1E 05 03 | Arithmetic shift left (absolute,X)
	AND $FF1F,X		  ; 3D 1F FF | Logical AND with accumulator (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_083
; Address: $F49391
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_083:
	JSL $002100		  ; 22 00 21 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	AND $C700,Y		  ; 39 00 C7 | Logical AND with accumulator (absolute,Y)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FFE3,X		  ; FE E3 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $1C31			; EE 31 1C | Increment (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $E200,X		  ; FE 00 E2 | Increment (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ASL $1120			; 0E 20 11 | Arithmetic shift left (absolute)
	SBC $3100			; ED 00 31 | Subtract with carry (absolute)
	ORA $1E5D,X		  ; 1D 5D 1E | Logical OR with accumulator (absolute,X)
	ROL $2E0E,X		  ; 3E 0E 2E | Rotate left (absolute,X)
	BIT $301F			; 2C 1F 30 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	BPL $3C			  ; 10 3C | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	INC $F204,X		  ; FE 04 F2 | Increment (absolute,X)
	CPY $3030			; CC 30 30 | Compare Y register (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $CCFC			; 8C FC CC | Store Y register to absolute address
	STY $8C			  ; 84 8C | Store Y register to zero page
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $2D			  ; 30 2D | Branch if negative
	BIT $595A			; 2C 5A 59 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_084
; Address: $F4940C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_084:
	JMP ($1862)		  ; 6C 62 18 | Jump to address (absolute indirect)
	ASL $3C			  ; 06 3C | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $7E			  ; 06 7E | Arithmetic shift left (zero page)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0E			  ; F0 0E | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_085
; Address: $F4941F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_085:
	ASL $0024,X		  ; 1E 24 00 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C24			; 2C 24 3C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C24			; 2C 24 3C | Test bits in accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_086
; Address: $F4944A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_086:
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_087
; Address: $F49450
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_087:
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BNE $B0			  ; D0 B0 | Branch if not equal
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_089
; Address: $F4945A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_089:
	BNE $B0			  ; D0 B0 | Branch if not equal
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_08B
; Address: $F49460
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_08B:
	CLC				  ; 18 | Clear carry flag
	BPL $34			  ; 10 34 | Branch if positive
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	AND $696A			; 2D 6A 69 | Logical AND with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	EOR $5354,Y		  ; 59 54 53 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROR $7E10			; 6E 10 7E | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_08C
; Address: $F49475
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_08C:
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	ASL $0014			; 0E 14 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $6E6C			; 6E 6C 6E | Rotate right (absolute)
	JMP ($383A)		  ; 6C 3A 38 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($7C10)		  ; 6C 10 7C | Jump to address (absolute indirect)
	BMI $0C			  ; 30 0C | Branch if negative
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_08D
; Address: $F494A6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_08D:
	JSL $FC3FF8		  ; 22 F8 3F FC | Jump to subroutine long
	INC $F3ED,X		  ; FE ED F3 | Increment (absolute,X)
	INC $00F1			; EE F1 00 | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_08E
; Address: $F494BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_08E:
	JSR $E00E			; 20 0E E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_08F
; Address: $F494C8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_08F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_090
; Address: $F494E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_090:
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_093
; Address: $F494F8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_093:
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_095
; Address: $F49501
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_095:
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	BCS $16			  ; B0 16 | Branch if carry set
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	CPX #$99			 ; E0 99 | Compare X register (immediate)
	BEQ $6E			  ; F0 6E | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	PHX				  ; DA | Push X register to stack
	REP #$36			 ; C2 36 | Reset processor status bits
	ROL $06			  ; 26 06 | Rotate left (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	ROR $06			  ; 66 06 | Rotate right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	ROR $BD22,X		  ; 7E 22 BD | Rotate right (absolute,X)
	LDA				  ; BF 41 BE 40 | Read graphics status
	AND ($23,X)		  ; 21 23 | Logical AND with accumulator ((zero page,X))
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_097
; Address: $F49545
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_097:
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BCS $F0			  ; B0 F0 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_098
; Address: $F49555
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_098:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	LDA				  ; BF 41 BF 41 | Read graphics status
	LDX $BE41,Y		  ; BE 41 BE | Load from absolute,Y into X register
	EOR ($5D,X)		  ; 41 5D | Exclusive OR with accumulator ((zero page,X))
	JMP $003F3C		  ; 5C 3C 3F 00 | Jump to address long
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_099
; Address: $F49572
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_099:
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STY $C8FC			; 8C FC C8 | Store Y register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $40			  ; 80 40 | Branch always
	LDY #$30			 ; A0 30 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_09B
; Address: $F49590
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_09B:
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_09C
; Address: $F495A0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_09C:
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $70			  ; 80 70 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	BCS $30			  ; B0 30 | Branch if carry set
	BMI $48			  ; 30 48 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	ASL $3400,X		  ; 1E 00 34 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BNE $00			  ; D0 00 | Branch if not equal
	ASL $341D,X		  ; 1E 1D 34 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BNE $B0			  ; D0 B0 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_09D
; Address: $F495E8
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_09D:
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A0
; Address: $F495FB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A0:
	ROR $0F0F,X		  ; 7E 0F 0F | Rotate right (absolute,X)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A1
; Address: $F4960C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A1:
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A3
; Address: $F4961C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A3:
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	JMP ($9300)		  ; 6C 00 93 | Jump to address (absolute indirect)
	CPX $8000			; EC 00 80 | Compare X register (absolute)
	JMP ($936F)		  ; 6C 6F 93 | Jump to address (absolute indirect)
	INC $ECEC,X		  ; FE EC EC | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A4
; Address: $F49648
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A4:
	BVC $00			  ; 50 00 | Branch if overflow clear
	BNE $00			  ; D0 00 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A5
; Address: $F49657
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A5:
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 81 7E F1 | Read graphics status

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A6
; Address: $F49686
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A6:
	JSL $F87EF8		  ; 22 F8 7E F8 | Jump to subroutine long
	ROR $FC			  ; 66 FC | Rotate right (zero page)
	INC $BB			  ; E6 BB | Increment (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	SBC $0407,Y		  ; F9 07 04 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A7
; Address: $F49697
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A7:
	RTI				  ; 40 | Return from interrupt
	ORA $3841,Y		  ; 19 41 38 | Logical OR with accumulator (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A8
; Address: $F496C0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A8:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	CPX $80			  ; E4 80 | Compare X register (zero page)
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	BMI $E8			  ; 30 E8 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $50			  ; 10 50 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0A9
; Address: $F496E0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0A9:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	CPY #$92			 ; C0 92 | Compare Y register (immediate)
	CPX #$6C			 ; E0 6C | Compare X register (immediate)
	BCC $74			  ; 90 74 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	STZ $121C			; 9C 1C 12 | Store zero to absolute
	ASL $1E12,X		  ; 1E 12 1E | Arithmetic shift left (absolute,X)
	JMP ($700C)		  ; 6C 0C 70 | Jump to address (absolute indirect)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $60			  ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0AA
; Address: $F4972C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0AA:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0AB
; Address: $F497A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0AB:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0AD
; Address: $F497B7
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0AD:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BVC $20			  ; 50 20 | Branch if overflow clear
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BCC $60			  ; 90 60 | Branch if carry clear
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	ROL $48			  ; 26 48 | Rotate left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	ASL $170F			; 0E 0F 17 | Arithmetic shift left (absolute)
	ORA $1669,X		  ; 1D 69 16 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0AF
; Address: $F49827
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0AF:
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B0
; Address: $F49863
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B0:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B1
; Address: $F49873
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B1:
	JSR $60F8			; 20 F8 60 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	INC $014C,X		  ; FE 4C 01 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $0C1E			; 0E 1E 0C | Arithmetic shift left (absolute)
	ASL $000C,X		  ; 1E 0C 00 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B3
; Address: $F498B0
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B3:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $60			  ; F0 60 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ROL $1F1C,X		  ; 3E 1C 1F | Rotate left (absolute,X)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $3C0C,X		  ; 1E 0C 3C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	CMP ($C2,X)		  ; C1 C2 | Compare accumulator ((zero page,X))
	WDM #$62			 ; 42 62 | Reserved instruction
	STA ($E1),Y		  ; 91 E1 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	BEQ $01			  ; F0 01 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $79A5,X		  ; FE A5 79 | Increment (absolute,X)
	JMP $DE38			; 4C 38 DE | Jump to address
	LDY $3C5E,X		  ; BC 5E 3C | Load from absolute,X into Y register
	JMP $083C38		  ; 5C 38 3C 08 | Jump to address long
	LDY $FC43,X		  ; BC 43 FC | Load from absolute,X into Y register
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	BRA $7E			  ; 80 7E | Branch always
	BRA $7E			  ; 80 7E | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B6
; Address: $F49948
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B6:
	ROL $1A			  ; 26 1A | Rotate left (zero page)
	JMP $BEE86C		  ; 5C 6C E8 BE | Jump to address long
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $78			  ; 70 78 | Branch if overflow set
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B7
; Address: $F49959
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B7:
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	ASL $0BE0,X		  ; 1E E0 0B | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	CMP ($22,X)		  ; C1 22 | Compare accumulator ((zero page,X))
	STY $04			  ; 84 04 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEC $EF			  ; C6 EF | Decrement (zero page)
	DEC $CF			  ; C6 CF | Decrement (zero page)
	STX $DF			  ; 86 DF | Store X register to zero page
	STY $8CDF			; 8C DF 8C | Store Y register to absolute address
	STA				  ; 9F 0C 02 44 | Update graphics data
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)
	BPL $FF			  ; 10 FF | Branch if positive
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ADC ($FB,X)		  ; 61 FB | Add with carry ((zero page,X))
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	AND ($F9),Y		  ; 31 F9 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B8
; Address: $F499D6
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B8:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	BVC $CE			  ; 50 CE | Branch if overflow clear
	EOR $1E5C,Y		  ; 59 5C 1E | Exclusive OR with accumulator (absolute,Y)
	ASL $3E0C,X		  ; 1E 0C 3E | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $5F20,X		  ; FE 20 5F | Increment (absolute,X)
	LSR $0620,X		  ; 5E 20 06 | Logical shift right (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0B9
; Address: $F49A2D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0B9:
	JSR $3050			; 20 50 30 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $90			  ; 10 90 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0BA
; Address: $F49A64
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0BA:
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	DEC $96			  ; C6 96 | Decrement (zero page)
	SBC ($7B,X)		  ; E1 7B | Subtract with carry ((zero page,X))
	CPX #$3D			 ; E0 3D | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	DEC $F70F			; CE 0F F7 | Decrement (absolute)
	STA $00F1,X		  ; 9D F1 00 | Update graphics data
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack
	BMI $FC			  ; 30 FC | Branch if negative
	ORA $956F,Y		  ; 19 6F 95 | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	STZ $7DF9,X		  ; 9E F9 7D | Store zero to absolute,X
	LDA				  ; BF D0 2F 38 | Read graphics status
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($75),Y		  ; 11 75 | Logical OR with accumulator ((zero page),Y)
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	DEC $5C6E			; CE 6E 5C | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	STA ($77,X)		  ; 81 77 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPY $640C			; CC 0C 64 | Compare Y register (absolute)
	STY $E0			  ; 84 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0BB
; Address: $F49AD7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0BB:
	JSR $0181			; 20 81 01 | Jump to subroutine
	STY $04			  ; 84 04 | Store Y register to zero page
	ROL $166D,X		  ; 3E 6D 16 | Rotate left (absolute,X)
	LDA #$76			 ; A9 76 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	SBC #$F1			 ; E9 F1 | Subtract with carry (immediate)
	LDX #$02			 ; A2 02 | Load immediate value into X register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BVS $07			  ; 70 07 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0BC
; Address: $F49AFC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0BC:
	JSR $0102			; 20 02 01 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0BE
; Address: $F49B0C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0BE:
	JSR $6040			; 20 40 60 | Jump to subroutine
	BRA $10			  ; 80 10 | Branch always
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	BMI $78			  ; 30 78 | Branch if negative
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0BF
; Address: $F49B1E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0BF:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1F0F			; 0D 0F 1F | Logical OR with accumulator (absolute)
	ORA $160E,X		  ; 1D 0E 16 | Logical OR with accumulator (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA $FF63,X		  ; BD 63 FF | Read graphics status
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C0
; Address: $F49B60
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C0:
	JSR $CC10			; 20 10 CC | Jump to subroutine
	STX $FA			  ; 86 FA | Store X register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	BCC $9A			  ; 90 9A | Branch if carry clear
	INC $7C			  ; E6 7C | Increment (zero page)
	LDA $3E43			; AD 43 3E | Read graphics status
	ADC $0130,Y		  ; 79 30 01 | Add with carry (absolute,Y)
	INC $C03C,X		  ; FE 3C C0 | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	INC $7C01,X		  ; FE 01 7C | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C1
; Address: $F49B86
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C1:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	STY $6874			; 8C 74 68 | Store Y register to absolute address
	BCC $E0			  ; 90 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C2
; Address: $F49B96
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C2:
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $68			  ; F0 68 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$52			 ; E0 52 | Compare X register (immediate)
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C3
; Address: $F49BB0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C3:
	INC $BF00,X		  ; FE 00 BF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C4
; Address: $F49BB9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C4:
	SEI				  ; 78 | Set interrupt disable flag
	BMI $02			  ; 30 02 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C5
; Address: $F49BE0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C5:
	JMP $BAC62C		  ; 5C 2C C6 BA | Jump to address long
	BNE $7C			  ; D0 7C | Branch if not equal
	INC $DA7C			; EE 7C DA | Increment (absolute)
	BIT $EC52			; 2C 52 EC | Test bits in accumulator (absolute)
	CPX $E0F0			; EC F0 E0 | Game work RAM access
	INC $C03C,X		  ; FE 3C C0 | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $E0			  ; 70 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C6
; Address: $F49C2D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C6:
	JSR $3078			; 20 78 30 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $10			  ; 10 10 | Branch if positive
	SBC ($2E),Y		  ; F1 2E | Subtract with carry ((zero page),Y)
	INC $FCA0,X		  ; FE A0 FC | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BMI $DC			  ; 30 DC | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	LDY $E47E,X		  ; BC 7E E4 | Load from absolute,X into Y register
	LDX $C0A0			; AE A0 C0 | Load from absolute address into X register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BEQ $60			  ; F0 60 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	AND $0F1E,X		  ; 3D 1E 0F | Logical AND with accumulator (absolute,X)
	ASL $1F22,X		  ; 1E 22 1F | Arithmetic shift left (absolute,X)
	ORA $0506,Y		  ; 19 06 05 | Logical OR with accumulator (absolute,Y)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C7
; Address: $F49C70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C7:
	JSR $1620			; 20 20 16 | Jump to subroutine
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($21,X)		  ; 01 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C8
; Address: $F49C83
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C8:
	JSL $AEF453		  ; 22 53 F4 AE | Jump to subroutine long
	BNE $B4			  ; D0 B4 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY $3C74,X		  ; BC 74 3C | Load from absolute,X into Y register
	CPX $A8			  ; E4 A8 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STA $3ECF77		  ; 8F 77 CF 3E | Update graphics data
	STX $7C			  ; 86 7C | Store X register to zero page
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0C9
; Address: $F49CB4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0C9:
	BRA $00			  ; 80 00 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CA
; Address: $F49CE0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CA:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $DEBD,X		  ; 9E BD DE | Store zero to absolute,X
	PLY				  ; 7A | Pull Y register from stack
	JMP $041E			; 4C 1E 04 | Jump to address
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SBC $711E			; ED 1E 71 | Subtract with carry (absolute)
	DEC $C03F			; CE 3F C0 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CB
; Address: $F49D16
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CB:
	JSR $0040			; 20 40 00 | Jump to subroutine
	LDY $B0			  ; A4 B0 | Load from zero page into Y register
	LDY $44C8,X		  ; BC C8 44 | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	LDY $64			  ; A4 64 | Load from zero page into Y register
	CPX $7C			  ; E4 7C | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$B878		   ; F4 78 B8 | Push effective address to stack
	BPL $B4			  ; 10 B4 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $0C			  ; F0 0C | Branch if equal
	PEA #$FC08		   ; F4 08 FC | Push effective address to stack
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ASL $DF22			; 0E 22 DF | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CC
; Address: $F49D4E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CC:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ADC ($E3,X)		  ; 61 E3 | Add with carry ((zero page,X))
	EOR ($E7,X)		  ; 41 E7 | Exclusive OR with accumulator ((zero page,X))
	DEC $7B			  ; C6 7B | Decrement (zero page)
	STZ $F07E,X		  ; 9E 7E F0 | Store zero to absolute,X
	BVS $80			  ; 70 80 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CD
; Address: $F49D6F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CD:
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	WDM #$42			 ; 42 42 | Hardware register operation
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BCC $10			  ; 90 10 | Branch if carry clear
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPX $B4			  ; E4 B4 | Compare X register (zero page)
	JMP $0008C8		  ; 5C C8 08 00 | Jump to address long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CE
; Address: $F49D90
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CE:
	SED				  ; F8 | Set decimal mode flag
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ORA $0FD7			; 0D D7 0F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0CF
; Address: $F49DAC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0CF:
	JSL $DF20DF		  ; 22 DF 20 DF | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1D01			; 0E 01 1D | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	BPL $3C			  ; 10 3C | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	JMP ($F958)		  ; 6C 58 F9 | Jump to address (absolute indirect)
	BCS $7F			  ; B0 7F | Branch if carry set
	STA ($77,X)		  ; 81 77 | Update graphics data
	STY $C468			; 8C 68 C4 | Store Y register to absolute address
	BPL $10			  ; 10 10 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D0
; Address: $F49DD7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D0:
	JSR $0181			; 20 81 01 | Jump to subroutine
	LDA $FFC6,X		  ; BD C6 FF | Read graphics status
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT #$0C			 ; 89 0C | Test bits in accumulator (immediate)
	DEC $B6			  ; C6 B6 | Decrement (zero page)
	BEQ $F8			  ; F0 F8 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BVS $68			  ; 70 68 | Branch if overflow set
	BMI $F0			  ; 30 F0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D2
; Address: $F49E0E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D2:
	JSR $03F0			; 20 F0 03 | Jump to subroutine
	ASL $8680			; 0E 80 86 | Arithmetic shift left (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDX $FAC4,Y		  ; BE C4 FA | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D3
; Address: $F49E62
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D3:
	BRA $00			  ; 80 00 | Branch always
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D4
; Address: $F49E6B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D4:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ORA $1E2F			; 0D 2F 1E | Logical OR with accumulator (absolute)
	AND $CD1E,X		  ; 3D 1E CD | Logical AND with accumulator (absolute,X)
	ROL $DE21,X		  ; 3E 21 DE | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D5
; Address: $F49E8E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D5:
	JSL $0000DD		  ; 22 DD 00 00 | Jump to subroutine long
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	ROL $B800,X		  ; 3E 00 B8 | Rotate left (absolute,X)
	BPL $F8			  ; 10 F8 | Branch if positive
	BMI $F8			  ; 30 F8 | Branch if negative
	BCS $F8			  ; B0 F8 | Branch if carry set
	BCS $D0			  ; B0 D0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D6
; Address: $F49EAA
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D6:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	LSR $7CA0,X		  ; 5E A0 7C | Logical shift right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	LDY $E47E,X		  ; BC 7E E4 | Load from absolute,X into Y register
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D8
; Address: $F49F03
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D8:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BNE $E0			  ; D0 E0 | Game work RAM access
	BMI $C0			  ; 30 C0 | Branch if negative
	BNE $D8			  ; D0 D8 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	INC $00FC,X		  ; FE FC 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0D9
; Address: $F49F59
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0D9:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	LDY $E47E,X		  ; BC 7E E4 | Load from absolute,X into Y register
	ROL $0800,X		  ; 3E 00 08 | Rotate left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	STA ($30),Y		  ; 91 30 | Update graphics data
	ADC $1F0F			; 6D 0F 1F | Add with carry (absolute)
	ORA $160E,X		  ; 1D 0E 16 | Logical OR with accumulator (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DA
; Address: $F49F96
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DA:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	STX $06			  ; 86 06 | Store X register to zero page
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DB
; Address: $F49FAB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DB:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $60			  ; F0 60 | Branch if equal
	ROR $3D30,X		  ; 7E 30 3D | Rotate right (absolute,X)
	ASL $1E0F,X		  ; 1E 0F 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DC
; Address: $F49FC8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DC:
	JSL $06191F		  ; 22 1F 19 06 | Jump to subroutine long
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DD
; Address: $F49FD0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DD:
	JSR $1620			; 20 20 16 | Jump to subroutine
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DE
; Address: $F4A023
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DE:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0DF
; Address: $F4A033
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0DF:
	JSR $60F8			; 20 F8 60 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E0
; Address: $F4A042
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E0:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E1
; Address: $F4A06C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E1:
	JSR $2418			; 20 18 24 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $1C3F			; 0E 3F 1C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $60			  ; 10 60 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $04			  ; 30 04 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	INC $FE1C,X		  ; FE 1C FE | Increment (absolute,X)
	BIT $2010			; 2C 10 20 | Test bits in accumulator (absolute)
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E2
; Address: $F4A0A6
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E2:
	JSR $0040			; 20 40 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E3
; Address: $F4A0AB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E3:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $48			  ; 10 48 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E4
; Address: $F4A0B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E4:
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $FC			  ; 30 FC | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E5
; Address: $F4A0C1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E5:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E6
; Address: $F4A100
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E6:
	JSL $B4C20C		  ; 22 0C C2 B4 | Jump to subroutine long
	STA ($F6,X)		  ; 81 F6 | Update graphics data
	CMP $91FA,Y		  ; D9 FA 91 | Compare accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX $5B7B			; EC 7B 5B | Compare X register (absolute)
	EOR $7FB5			; 4D B5 7F | Exclusive OR with accumulator (absolute)
	ROL $F60F			; 2E 0F F6 | Rotate left (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC $0002,X		  ; FD 02 00 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E7
; Address: $F4A12B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E7:
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $42			  ; 24 42 | Hardware register operation
	BIT $42			  ; 24 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0E9
; Address: $F4A14C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0E9:
	JSL $601141		  ; 22 41 11 60 | Jump to subroutine long
	INC $FE6C,X		  ; FE 6C FE | Increment (absolute,X)
	JMP ($66FF)		  ; 6C FF 66 | Jump to address (absolute indirect)
	ROR $F7			  ; 66 F7 | Rotate right (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0EA
; Address: $F4A17E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0EA:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0EB
; Address: $F4A18A
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0EB:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $20			  ; 50 20 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $01			  ; 70 01 | Branch if overflow set
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $0C1E			; 0E 1E 0C | Arithmetic shift left (absolute)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0ED
; Address: $F4A1C8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0ED:
	JSR $1010			; 20 10 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative
	BMI $3C			  ; 30 3C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $BE0C,X		  ; 1E 0C BE | Arithmetic shift left (absolute,X)
	CMP $FB			  ; C5 FB | Compare accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$FC			 ; 09 FC | Logical OR with accumulator (immediate)
	INC $70B8,X		  ; FE B8 70 | Increment (absolute,X)
	BVS $20			  ; 70 20 | Branch if overflow set
	BNE $60			  ; D0 60 | Branch if not equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0EE
; Address: $F4A20C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0EE:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	ASL $3630			; 0E 30 36 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	LSR $7CA0,X		  ; 5E A0 7C | Logical shift right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $DC			  ; F0 DC | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	ROR $3FE4,X		  ; 7E E4 3F | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	SBC $BA16,X		  ; FD 16 BA | Subtract with carry (absolute,X)
	LDX $7BDA,Y		  ; BE DA 7B | Load from absolute,Y into X register
	EOR $051F			; 4D 1F 05 | Exclusive OR with accumulator (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $7F			  ; 10 7F | Branch if positive
	CPY #$3D			 ; C0 3D | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F0
; Address: $F4A262
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F0:
	JSR $60C0			; 20 C0 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVC $E0			  ; 50 E0 | Game work RAM access
	BNE $E0			  ; D0 E0 | Game work RAM access
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BMI $C0			  ; 30 C0 | Branch if negative
	BVS $80			  ; 70 80 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F2
; Address: $F4A281
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F2:
	JSR $2011			; 20 11 20 | Jump to subroutine
	AND $DC			  ; 25 DC | Logical AND with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F3
; Address: $F4A288
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F3:
	STX $BCF3			; 8E F3 BC | Store X register to absolute address
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	AND ($7B),Y		  ; 31 7B | Logical AND with accumulator ((zero page),Y)
	AND ($78),Y		  ; 31 78 | Logical AND with accumulator ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BNE $C0			  ; D0 C0 | Branch if not equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BNE $30			  ; D0 30 | Branch if not equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F4
; Address: $F4A2B0
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F4:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	BMI $78			  ; 30 78 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	BMI $7C			  ; 30 7C | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND #$63			 ; 29 63 | Logical AND with accumulator (immediate)
	JMP $290F2E		  ; 5C 2E 0F 29 | Jump to address long
	ROR $0C1E,X		  ; 7E 1E 0C | Rotate right (absolute,X)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $000C,X		  ; 1E 0C 00 | Arithmetic shift left (absolute,X)
	BPL $7F			  ; 10 7F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F5
; Address: $F4A30A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F5:
	STA $3096,Y		  ; 99 96 30 | Update graphics data
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA				  ; 9F 00 3F 07 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F7
; Address: $F4A345
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F7:
	JSR $2010			; 20 10 20 | Jump to subroutine
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BMI $40			  ; 30 40 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0F9
; Address: $F4A353
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0F9:
	JSR $2070			; 20 70 20 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $04			  ; 70 04 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $E0			  ; D0 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BNE $D8			  ; D0 D8 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	INC $00FC,X		  ; FE FC 00 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0FA
; Address: $F4A395
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0FA:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0FB
; Address: $F4A41A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0FB:
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA $1303			; 0D 03 13 | Logical OR with accumulator (absolute)
	ORA $1D2F			; 0D 2F 1D | Logical OR with accumulator (absolute)
	EOR $C93E,Y		  ; 59 3E C9 | Exclusive OR with accumulator (absolute,Y)
	ROL $DD22,X		  ; 3E 22 DD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0FC
; Address: $F4A42E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0FC:
	JSL $0008DD		  ; 22 DD 08 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0FE
; Address: $F4A44B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0FE:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	DEC $3D			  ; C6 3D | Decrement (zero page)
	LDA $DEAF9C		  ; AF 9C AF DE | Read graphics status
	JMP $0C1E			; 4C 1E 0C | Jump to address
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$21			 ; C0 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $E0			  ; 10 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $D8			  ; 90 D8 | Branch if carry clear
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_0FF
; Address: $F4A48A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_0FF:
	BVS $20			  ; 70 20 | Branch if overflow set
	SBC $BD30,Y		  ; F9 30 BD | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $88			  ; F0 88 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0818,Y		  ; 19 18 08 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_100
; Address: $F4A4A1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_100:
	BPL $08			  ; 10 08 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	ROR $C752			; 6E 52 C7 | Rotate right (absolute)
	LDA $68A4,Y		  ; B9 A4 68 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	STZ $EC72			; 9C 72 EC | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	CPX $BE10			; EC 10 BE | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	LSR $0F31,X		  ; 5E 31 0F | Logical shift right (absolute,X)
	ORA $0713,X		  ; 1D 13 07 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_101
; Address: $F4A4D1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_101:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $8B0F			; 9C 0F 8B | Store zero to absolute
	ORA $C8			  ; 05 C8 | Logical OR with accumulator (zero page)
	STZ $DF0F,X		  ; 9E 0F DF | Store zero to absolute,X
	STA $03C6ED		  ; 8F ED C6 03 | Update graphics data
	STA				  ; 9F 00 8F 00 | Update graphics data
	STZ $4081,X		  ; 9E 81 40 | Store zero to absolute,X
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_102
; Address: $F4A520
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_102:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_103
; Address: $F4A525
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_103:
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_104
; Address: $F4A52E
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_104:
	BRA $00			  ; 80 00 | Branch always
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $C0FD,X		  ; FD FD C0 | Subtract with carry (absolute,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $C0FE,X		  ; FE FE C0 | Increment (absolute,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $27			  ; 80 27 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	LDY $E47E,X		  ; BC 7E E4 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_105
; Address: $F4A5E5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_105:
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL $1A2B			; 0E 2B 1A | Arithmetic shift left (absolute)
	SBC $211E			; ED 1E 21 | PPU graphics register access
	DEC $DC23,X		  ; DE 23 DC | Decrement (absolute,X)
	ORA $1E01			; 0D 01 1E | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	ROL $BE00,X		  ; 3E 00 BE | Rotate left (absolute,X)
	ORA $53AF,Y		  ; 19 AF 53 | Logical OR with accumulator (absolute,Y)
	SBC $FA33,Y		  ; F9 33 FA | Subtract with carry (absolute,Y)
	INC $1CF6			; EE F6 1C | Increment (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $47			  ; 10 47 | Branch if positive
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	STY $000C			; 8C 0C 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_106
; Address: $F4A61C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_106:
	JSR $0020			; 20 20 00 | Jump to subroutine
	SEP #$9C			 ; E2 9C | Set processor status bits
	CPY $28C8			; CC C8 28 | Compare Y register (absolute)
	BNE $30			  ; D0 30 | Branch if not equal
	BNE $40			  ; D0 40 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	INC $B400,X		  ; FE 00 B4 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ASL $0C15			; 0E 15 0C | Arithmetic shift left (absolute)
	ASL $DF20,X		  ; 1E 20 DF | Arithmetic shift left (absolute,X)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	DEC $2E			  ; C6 2E | Decrement (zero page)
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	STY $9CEE			; 8C EE 9C | Store Y register to absolute address
	CLV				  ; B8 | Clear overflow flag
	ORA #$DF			 ; 09 DF | Logical OR with accumulator (immediate)
	INC $0419,X		  ; FE 19 04 | Increment (absolute,X)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	STY $A18C			; 8C 8C A1 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_107
; Address: $F4A679
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_107:
	JSR $0001			; 20 01 00 | Jump to subroutine
	EOR #$48			 ; 49 48 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $190E			; 0D 0E 19 | Logical OR with accumulator (absolute)
	ASL $1D35			; 0E 35 1D | Arithmetic shift left (absolute)
	SBC $DB37,Y		  ; F9 37 DB | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	AND ($EE),Y		  ; 31 EE | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_109
; Address: $F4A69F
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_109:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDX $FAC4,Y		  ; BE C4 FA | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	STX $06			  ; 86 06 | Store X register to zero page
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_10A
; Address: $F4A6EB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_10A:
	JSR $60F0			; 20 F0 60 | Jump to subroutine
	BEQ $E0			  ; F0 E0 | Game work RAM access
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_10B
; Address: $F4A6FC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_10B:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_10D
; Address: $F4A71E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_10D:
	ASL $221E,X		  ; 1E 1E 22 | Arithmetic shift left (absolute,X)
	JMP $887CA0		  ; 5C A0 7C 88 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	LDY $E47E,X		  ; BC 7E E4 | Load from absolute,X into Y register
	ROL $0C00,X		  ; 3E 00 0C | Rotate left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $3068			; CE 68 30 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_10E
; Address: $F4A763
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_10E:
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BCS $B8			  ; B0 B8 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	INC $00FC,X		  ; FE FC 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $230E			; 0E 0E 23 | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	INC $1CFE,X		  ; FE FE 1C | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $80FE,X		  ; FE FE 80 | Increment (absolute,X)
	BRA $F4			  ; 80 F4 | Branch always
	PEA #$C0C0		   ; F4 C0 C0 | Push effective address to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_10F
; Address: $F4A88F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_10F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $50			  ; 80 50 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_110
; Address: $F4A8AC
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_110:
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $EB			  ; B0 EB | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $80			  ; 70 80 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ORA $0FD7			; 0D D7 0F | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1D01			; 0E 01 1D | Arithmetic shift left (absolute)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_111
; Address: $F4A8F9
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_111:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 9F 7F 7F | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_113
; Address: $F4A97A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_113:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDA				  ; BF BF 00 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_114
; Address: $F4A9CA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_114:
	BRA $80			  ; 80 80 | Branch always
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	ASL $F00E			; 0E 0E F0 | Arithmetic shift left (absolute)
	BEQ $E7			  ; F0 E7 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $7B			  ; 84 7B | Store Y register to zero page
	PLY				  ; 7A | Pull Y register from stack
	ORA $3E			  ; 05 3E | Logical OR with accumulator (zero page)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA $153B			; 0D 3B 15 | Logical OR with accumulator (absolute)
	AND $FC1F			; 2D 1F FC | Logical AND with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_115
; Address: $F4AA40
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_115:
	JSL $DF20DF		  ; 22 DF 20 DF | Jump to subroutine long
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	LSR $7CA0,X		  ; 5E A0 7C | Logical shift right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $DC			  ; B0 DC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	STY $84			  ; 84 84 | Store Y register to zero page
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_117
; Address: $F4AACE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_117:
	JSR $FF20			; 20 20 FF | Jump to subroutine
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_118
; Address: $F4AB12
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_118:
	JSR $0320			; 20 20 03 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SBC $80FD,X		  ; FD FD 80 | Subtract with carry (absolute,X)
	BRA $03			  ; 80 03 | Branch always
	ASL $FD0E			; 0E 0E FD | Arithmetic shift left (absolute)
	SBC $7070,X		  ; FD 70 70 | Subtract with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_119
; Address: $F4AB4E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_119:
	JSR $FC20			; 20 20 FC | Jump to subroutine
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STX $FF8E			; 8E 8E FF | Store X register to absolute address
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_11B
; Address: $F4AB7C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_11B:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0F04			; 0E 04 0F | Arithmetic shift left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ROR $BF2D,X		  ; 7E 2D BF | Rotate right (absolute,X)
	STA				  ; 9F 7B CF B7 | Update graphics data
	EOR $2DBB,X		  ; 5D BB 2D | Exclusive OR with accumulator (absolute,X)
	BIT $F00C			; 2C 0C F0 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BRA $6C			  ; 80 6C | Branch always
	AND $0B07,Y		  ; 39 07 0B | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ROR $FDB4,X		  ; 7E B4 FD | Rotate right (absolute,X)
	ROR $DEB9			; 6E B9 DE | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_11C
; Address: $F4ABC7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_11C:
	LDY $04F6			; AC F6 04 | Load from absolute address into Y register
	BCC $EC			  ; 90 EC | Branch if carry clear
	PHX				  ; DA | Push X register to stack
	STA $34F6,X		  ; 9D F6 34 | Update graphics data
	BMI $0F			  ; 30 0F | Branch if negative
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $F0			  ; 80 F0 | Branch always
	ASL $1CE2			; 0E E2 1C | Arithmetic shift left (absolute)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BCS $F8			  ; B0 F8 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_11E
; Address: $F4ABEE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_11E:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	BCS $B0			  ; B0 B0 | Branch if carry set
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_120
; Address: $F4ACA4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_120:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 9F C7 C7 | Update graphics data
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_121
; Address: $F4ACF6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_121:
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $2601,Y		  ; 19 01 26 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	EOR #$30			 ; 49 30 | Exclusive OR with accumulator (immediate)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $78FE,X		  ; 1E FE 78 | Arithmetic shift left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $8667			; 4D 67 86 | Exclusive OR with accumulator (absolute)
	CMP ($02),Y		  ; D1 02 | Compare accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	AND ($78),Y		  ; 31 78 | Logical AND with accumulator ((zero page),Y)
	ADC ($F6),Y		  ; 71 F6 | Add with carry ((zero page),Y)
	ADC ($3E,X)		  ; 61 3E | Add with carry ((zero page,X))
	BEQ $7F			  ; F0 7F | Branch if equal
	SBC ($E7),Y		  ; F1 E7 | Subtract with carry ((zero page),Y)
	STA ($87,X)		  ; 81 87 | Update graphics data
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $74			  ; 06 74 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_122
; Address: $F4AD43
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_122:
	CMP $B2DC,X		  ; DD DC B2 | Compare accumulator (absolute,X)
	ROR $61			  ; 66 61 | Rotate right (zero page)
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_123
; Address: $F4AD4F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_123:
	BRA $C3			  ; 80 C3 | Branch always
	INC $678F,X		  ; FE 8F 67 | Increment (absolute,X)
	STA ($E1,X)		  ; 81 E1 | Update graphics data
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BEQ $70			  ; F0 70 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BPL $80			  ; 10 80 | Branch if positive
	BRA $60			  ; 80 60 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BPL $12			  ; 10 12 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_124
; Address: $F4AD9C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_124:
	JSR $8020			; 20 20 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_125
; Address: $F4AE80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_125:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_127
; Address: $F4AEA7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_127:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $1C3E			; 0E 3E 1C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	BEQ $60			  ; F0 60 | Branch if equal
	BMI $40			  ; 30 40 | Branch if negative
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_128
; Address: $F4AEC3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_128:
	JSR $1804			; 20 04 18 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BVS $7C			  ; 70 7C | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	ROL $0F1C,X		  ; 3E 1C 0F | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_129
; Address: $F4AF5E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_129:
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	INC $18FE,X		  ; FE FE 18 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $003E,X		  ; 3E 3E 00 | Rotate left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $003E,X		  ; 3E 3E 00 | Rotate left (absolute,X)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_12B
; Address: $F4B009
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_12B:
	JSR $2010			; 20 10 20 | Jump to subroutine
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_12D
; Address: $F4B017
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_12D:
	JSR $2070			; 20 70 20 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $78			  ; 30 78 | Branch if negative
	BMI $78			  ; 30 78 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_12E
; Address: $F4B150
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_12E:
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_130
; Address: $F4B184
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_130:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_131
; Address: $F4B189
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_131:
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_132
; Address: $F4B196
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_132:
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $78			  ; 70 78 | Branch if overflow set
	BEQ $26			  ; F0 26 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDA $66			  ; A5 66 | Read graphics status
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	LSR $3C			  ; 46 3C | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INC $DB10			; EE 10 DB | Increment (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_133
; Address: $F4B22F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_133:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_134
; Address: $F4B239
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_134:
	BRA $C0			  ; 80 C0 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $190E			; 0D 0E 19 | Logical OR with accumulator (absolute)
	ASL $1D35			; 0E 35 1D | Arithmetic shift left (absolute)
	SBC $DB37,Y		  ; F9 37 DB | Subtract with carry (absolute,Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_138
; Address: $F4B29B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_138:
	JSR $2060			; 20 60 20 | Jump to subroutine
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	AND $4A76,X		  ; 3D 76 4A | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ROR $3C0E,X		  ; 7E 0E 3C | Rotate right (absolute,X)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ASL $060F			; 0E 0F 06 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	DEC $DD23,X		  ; DE 23 DD | Decrement (absolute,X)
	STX $FF			  ; 86 FF | Store X register to zero page
	INC $FE8C,X		  ; FE 8C FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	ROL $3D00,X		  ; 3E 00 3D | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_139
; Address: $F4B353
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_139:
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	INC $7F80,X		  ; FE 80 7F | Increment (absolute,X)
	STA				  ; 9F FE E1 FF | Update graphics data
	LDA $1F1E,X		  ; BD 1E 1F | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1818,Y		  ; 19 18 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	AND ($EE),Y		  ; 31 EE | Logical AND with accumulator ((zero page),Y)
	DEC $F068			; CE 68 F0 | Decrement (absolute)
	BMI $22			  ; 30 22 | Branch if negative
	REP #$D5			 ; C2 D5 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	SBC $FA2B			; ED 2B FA | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13A
; Address: $F4B393
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13A:
	JSR $7896			; 20 96 78 | Jump to subroutine
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13B
; Address: $F4B3AC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13B:
	BVS $80			  ; 70 80 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $81			  ; 80 81 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $7CFE,X		  ; 1E FE 7C | Arithmetic shift left (absolute,X)
	BEQ $70			  ; F0 70 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13C
; Address: $F4B3FB
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13C:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $050F			; 0D 0F 05 | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	LDX $BB7D,Y		  ; BE 7D BB | Load from absolute,Y into X register
	ADC $BD43,X		  ; 7D 43 BD | Add with carry (absolute,X)
	SBC $DFA6,Y		  ; F9 A6 DF | Subtract with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	LDA $9664,Y		  ; B9 64 96 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	SEP #$8E			 ; E2 8E | Set processor status bits
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ADC $DDBE,X		  ; 7D BE DD | Add with carry (absolute,X)
	LDX $BDC3,Y		  ; BE C3 BD | Load from absolute,Y into X register
	STA				  ; 9F 65 FB 5E | Update graphics data
	STA $6926,X		  ; 9D 26 69 | Update graphics data
	ASL $1817,X		  ; 1E 17 18 | Arithmetic shift left (absolute,X)
	BRA $7E			  ; 80 7E | Branch always
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BCS $F8			  ; B0 F8 | Branch if carry set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13D
; Address: $F4B4E6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13D:
	SED				  ; F8 | Set decimal mode flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BCS $B0			  ; B0 B0 | Branch if carry set
	BPL $10			  ; 10 10 | Branch if positive
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$9B			 ; C0 9B | Compare Y register (immediate)
	ROL $BC9A,X		  ; 3E 9A BC | Rotate left (absolute,X)
	STZ $60C0			; 9C C0 60 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13E
; Address: $F4B50E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13E:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	INC $7F01,X		  ; FE 01 7F | Increment (absolute,X)
	ROR $3CC0,X		  ; 7E C0 3C | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_13F
; Address: $F4B520
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_13F:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1F01			; 0E 01 1F | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_141
; Address: $F4B56E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_141:
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_142
; Address: $F4B59C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_142:
	ASL $1F01			; 0E 01 1F | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	ASL $F1E0,X		  ; 1E E0 F1 | Arithmetic shift left (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $181D			; 0D 1D 18 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	ORA $3802,X		  ; 1D 02 38 | Logical OR with accumulator (absolute,X)
	LDY $7824,X		  ; BC 24 78 | Load from absolute,X into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_143
; Address: $F4B5E6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_143:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	AND $1C24,X		  ; 3D 24 1C | Logical AND with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	AND $1807,X		  ; 3D 07 18 | Logical AND with accumulator (absolute,X)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STA $F0F080		  ; 8F 80 F0 F0 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $FCFE			; 0E FE FC | Arithmetic shift left (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	AND #$6F			 ; 29 6F | Logical AND with accumulator (immediate)
	AND $3E1F,Y		  ; 39 1F 3E | Logical AND with accumulator (absolute,Y)
	ORA $001F			; 0D 1F 00 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BVS $02			  ; 70 02 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_144
; Address: $F4B678
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_144:
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	ROL $030E			; 2E 0E 03 | Rotate left (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	BEQ $28			  ; F0 28 | Branch if equal
	BMI $FC			  ; 30 FC | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROR $F694			; 6E 94 F6 | Rotate right (absolute)
	STZ $7CF8			; 9C F8 7C | Store zero to absolute
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	BCS $F8			  ; B0 F8 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	ASL $1640			; 0E 40 16 | Arithmetic shift left (absolute)
	BPL $74			  ; 10 74 | Branch if positive
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$2B			 ; A0 2B | Load immediate value into Y register
	AND $3E4F,Y		  ; 39 4F 3E | Logical AND with accumulator (absolute,Y)
	AND $2857,X		  ; 3D 57 28 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	ROR $06			  ; 66 06 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_146
; Address: $F4B6BA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_146:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	NOP				  ; EA | No operation
	STZ $7CF2			; 9C F2 7C | Store zero to absolute
	SEP #$BC			 ; E2 BC | Set processor status bits
	NOP				  ; EA | No operation
	BPL $D8			  ; 10 D8 | Branch if positive
	BMI $3C			  ; 30 3C | Branch if negative
	ASL $6600			; 0E 00 66 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_147
; Address: $F4B6D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_147:
	BNE $A6			  ; D0 A6 | Branch if not equal
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	BMI $D0			  ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_148
; Address: $F4B703
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_148:
	JSR $20F0			; 20 F0 20 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_149
; Address: $F4B720
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_149:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0F13			; 0E 13 0F | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_14A
; Address: $F4B749
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_14A:
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F8			  ; 80 F8 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1E01			; 0E 01 1E | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_14C
; Address: $F4B78E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_14C:
	PHA				  ; 48 | Push accumulator to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BRA $78			  ; 80 78 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $0005			; 0E 05 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_14D
; Address: $F4B7B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_14D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_14E
; Address: $F4B7CD
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_14E:
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0005			; 0E 05 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	AND $3E1F,Y		  ; 39 1F 3E | Logical AND with accumulator (absolute,Y)
	ORA $001F			; 0D 1F 00 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BVS $02			  ; 70 02 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ROL $030E			; 2E 0E 03 | Rotate left (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $28			  ; F0 28 | Branch if equal
	BMI $FC			  ; 30 FC | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROR $F894			; 6E 94 F8 | Rotate right (absolute)
	STZ $7CF8			; 9C F8 7C | Store zero to absolute
	INX				  ; E8 | Increment X register
	BEQ $F0			  ; F0 F0 | Branch if equal
	BCS $F8			  ; B0 F8 | Branch if carry set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_14F
; Address: $F4B853
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_14F:
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	ASL $1440			; 0E 40 14 | Arithmetic shift left (absolute)
	BPL $74			  ; 10 74 | Branch if positive
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$12			 ; A0 12 | Load immediate value into Y register
	ASL $0F11			; 0E 11 0F | Arithmetic shift left (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ROR $3F19			; 6E 19 3F | Rotate right (absolute)
	ORA $1E3F,Y		  ; 19 3F 1E | Logical OR with accumulator (absolute,Y)
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_150
; Address: $F4B87C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_150:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ROL $480E			; 2E 0E 48 | Rotate left (absolute)
	BVS $88			  ; 70 88 | Branch if overflow set
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $3C			  ; F0 3C | Branch if equal
	SEC				  ; 38 | Set carry flag
	INC $7614			; EE 14 76 | Increment (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	BPL $74			  ; 10 74 | Branch if positive
	BVS $15			  ; 70 15 | Branch if overflow set
	ASL $0F13			; 0E 13 0F | Arithmetic shift left (absolute)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	ADC $241E,Y		  ; 79 1E 24 | Add with carry (absolute,Y)
	ROL $1C19			; 2E 19 1C | Rotate left (absolute)
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_151
; Address: $F4B8BE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_151:
	JSR $A802			; 20 02 A8 | Jump to subroutine
	BMI $68			  ; 30 68 | Branch if negative
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BEQ $24			  ; F0 24 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	DEC $3C			  ; C6 3C | Decrement (zero page)
	STZ $2478,X		  ; 9E 78 24 | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_152
; Address: $F4B8D8
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_152:
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA $0C15			; 0D 15 0C | Logical OR with accumulator (absolute)
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	ROR $39			  ; 66 39 | Rotate right (zero page)
	BMI $37			  ; 30 37 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ROL $7F01,X		  ; 3E 01 7F | Rotate left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BCS $A8			  ; B0 A8 | Branch if carry set
	BMI $64			  ; 30 64 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	DEC $FC			  ; C6 FC | Decrement (zero page)
	ROR $9C			  ; 66 9C | Rotate right (zero page)
	CPX $D418			; EC 18 D4 | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	PEA #$0B00		   ; F4 00 0B | Push effective address to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_153
; Address: $F4B985
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_153:
	JSR $A0F0			; 20 F0 A0 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $1E3F,Y		  ; 19 3F 1E | Logical OR with accumulator (absolute,Y)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_154
; Address: $F4B9B1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_154:
	PHP				  ; 08 | Push processor status to stack
	ROL $030E			; 2E 0E 03 | Rotate left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $74			  ; 10 74 | Branch if positive
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROL $3F19			; 2E 19 3F | Rotate left (absolute)
	ASL $0F17,X		  ; 1E 17 0F | Arithmetic shift left (absolute,X)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_155
; Address: $F4B9F2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_155:
	JSR $2C00			; 20 00 2C | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $6721,Y		  ; 39 21 67 | Logical AND with accumulator (absolute,Y)
	ORA $43F9,Y		  ; 19 F9 43 | Logical OR with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	AND $5E00,Y		  ; 39 00 5E | Logical AND with accumulator (absolute,Y)
	STX $00			  ; 86 00 | Store X register to zero page
	BRA $00			  ; 80 00 | Branch always
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	BNE $07			  ; D0 07 | Branch if not equal
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_156
; Address: $F4BA6A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_156:
	PLP				  ; 28 | Pull processor status from stack
	STA $360756		  ; 8F 56 07 36 | Update graphics data
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	INC $CE00,X		  ; FE 00 CE | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_157
; Address: $F4BA84
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_157:
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	ASL $9FBA			; 0E BA 9F | Arithmetic shift left (absolute)
	LDA				  ; BF DA CE E9 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $6900,X		  ; FE 00 69 | Increment (absolute,X)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	AND $1400,Y		  ; 39 00 14 | Logical AND with accumulator (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_158
; Address: $F4BABA
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_158:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$99			 ; 09 99 | Logical OR with accumulator (immediate)
	ROR $6CEF			; 6E EF 6C | Rotate right (absolute)
	STA $00FC,Y		  ; 99 FC 00 | Update graphics data
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	CPY $8634			; CC 34 86 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC ($D7),Y		  ; 71 D7 | Add with carry ((zero page),Y)
	STX $F7			  ; 86 F7 | Store X register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	INC $8F00,X		  ; FE 00 8F | Increment (absolute,X)
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_159
; Address: $F4BB38
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_159:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15A
; Address: $F4BB4B
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15A:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BVS $77			  ; 70 77 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7E48,X		  ; 7E 48 7E | Rotate right (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $7F00			; 0E 00 7F | Arithmetic shift left (absolute)
	STA $B900,Y		  ; 99 00 B9 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $B781,X		  ; BD 81 B7 | Read graphics status
	LDA ($CD),Y		  ; B1 CD | Read graphics status
	SBC $7E46,X		  ; FD 46 7E | Subtract with carry (absolute,X)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $331C,X		  ; 1D 1C 33 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15B
; Address: $F4BBCD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15B:
	JSR $2426			; 20 26 24 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $70			  ; 70 70 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PEA #$8604		   ; F4 04 86 | Push effective address to stack
	ASL $72			  ; 06 72 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15C
; Address: $F4BBFC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15C:
	PLX				  ; FA | Pull X register from stack
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	BIT $1818			; 2C 18 18 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ROL $08			  ; 26 08 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND $6E00,Y		  ; 39 00 6E | Logical AND with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	CMP $B1CF			; CD CF B1 | Compare accumulator (absolute)
	LDX $BF8F,Y		  ; BE 8F BF | Load from absolute,Y into X register
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15D
; Address: $F4BC54
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15D:
	JSR $DC00			; 20 00 DC | Jump to subroutine
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC $F9BB,Y		  ; 79 BB F9 | Add with carry (absolute,Y)
	ASL $C9FF,X		  ; 1E FF C9 | Arithmetic shift left (absolute,X)
	ROL $14FF,X		  ; 3E FF 14 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15E
; Address: $F4BC6F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15E:
	JSL $370087		  ; 22 87 00 37 | Jump to subroutine long
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ADC $62FF,Y		  ; 79 FF 62 | Add with carry (absolute,Y)
	INC $FD1D,X		  ; FE 1D FD | Increment (absolute,X)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	ROL $7FF1,X		  ; 3E F1 7F | Rotate left (absolute,X)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_15F
; Address: $F4BC98
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_15F:
	JSR $3300			; 20 00 33 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_160
; Address: $F4BCA3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_160:
	BVS $10			  ; 70 10 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_161
; Address: $F4BCA7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_161:
	CPX $6C08			; EC 08 6C | Compare X register (absolute)
	BNE $7C			  ; D0 7C | Branch if not equal
	BNE $FC			  ; D0 FC | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_162
; Address: $F4BCB4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_162:
	PHA				  ; 48 | Push accumulator to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $0500			; 8C 00 05 | Store Y register to absolute address
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0D00,Y		  ; 19 00 0D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_163
; Address: $F4BCE0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_163:
	JSL $195188		  ; 22 88 51 19 | Jump to subroutine long
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	BNE $00			  ; D0 00 | Branch if not equal
	EOR #$79			 ; 49 79 | Exclusive OR with accumulator (immediate)
	ADC $B57D			; 6D 7D B5 | Add with carry (absolute)
	STA $9BB3,X		  ; 9D B3 9B | Update graphics data
	LDX $3C9F,Y		  ; BE 9F 3C | Load from absolute,Y into X register
	LDA				  ; BF E3 FF CD | Read graphics status
	SEP #$00			 ; E2 00 | Set processor status bits
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_164
; Address: $F4BD20
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_164:
	JSR $60B0			; 20 B0 60 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	BVC $D8			  ; 50 D8 | Branch if overflow clear
	BVC $D8			  ; 50 D8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	BRA $BC			  ; 80 BC | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ROR $D644,X		  ; 7E 44 D6 | Rotate right (absolute,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_165
; Address: $F4BD49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_165:
	ROL $3E1A,X		  ; 3E 1A 3E | Rotate left (absolute,X)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ORA $1B00,Y		  ; 19 00 1B | Logical OR with accumulator (absolute,Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_166
; Address: $F4BD5C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_166:
	JSR $2200			; 20 00 22 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	INC $C795			; EE 95 C7 | Increment (absolute)
	ADC $47			  ; 65 47 | Add with carry (zero page)
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	LDA $17FB,Y		  ; B9 FB 17 | Read graphics status
	ORA $3C00,Y		  ; 19 00 3C | Logical OR with accumulator (absolute,Y)
	LDY $AA00,X		  ; BC 00 AA | Load from absolute,X into Y register
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_168
; Address: $F4BD85
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_168:
	PLA				  ; 68 | Pull accumulator from stack
	BNE $FC			  ; D0 FC | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BNE $FC			  ; D0 FC | Branch if not equal
	LDY $EE			  ; A4 EE | Load from zero page into Y register
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $6A			  ; 24 6A | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $5E			  ; 46 5E | Logical shift right (zero page)
	BIT $103C			; 2C 3C 10 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $1000			; 2C 00 10 | Test bits in accumulator (absolute)
	JMP $6D4C			; 4C 4C 6D | Jump to address
	ADC $3D38			; 6D 38 3D | Add with carry (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_169
; Address: $F4BDD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_169:
	JSL $001800		  ; 22 00 18 00 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	DEC				  ; 3A | Decrement accumulator
	INC $FC14,X		  ; FE 14 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_16A
; Address: $F4BDE6
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_16A:
	BPL $F8			  ; 10 F8 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0A3E,Y		  ; 19 3E 0A | Logical OR with accumulator (absolute,Y)
	ROL $3F13,X		  ; 3E 13 3F | Rotate left (absolute,X)
	ASL $0B0F,X		  ; 1E 0F 0B | Arithmetic shift left (absolute,X)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0029			; 0D 29 00 | Logical OR with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $7C35,Y		  ; 79 35 7C | Add with carry (absolute,Y)
	WDM #$7E			 ; 42 7E | Reserved instruction
	LDA ($BF,X)		  ; A1 BF | Read graphics status
	BVS $FF			  ; 70 FF | Branch if overflow set
	STY $FF			  ; 84 FF | Store Y register to zero page
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA ($00,X)		  ; 81 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	LDX #$DD			 ; A2 DD | Load immediate value into X register
	ROL $42E3,X		  ; 3E E3 42 | Hardware register operation
	STA $C8FF,X		  ; 9D FF C8 | Update graphics data
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SBC #$8F			 ; E9 8F | Subtract with carry (immediate)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	STY $F0FF			; 8C FF F0 | Store Y register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	BNE $F8			  ; D0 F8 | Branch if not equal
	BMI $E0			  ; 30 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_16B
; Address: $F4BEA6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_16B:
	JSR $50B0			; 20 B0 50 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $78			  ; 10 78 | Branch if positive
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	BPL $F8			  ; 10 F8 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_16D
; Address: $F4BEB6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_16D:
	BVC $00			  ; 50 00 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $3C18			; 2E 18 3C | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $3D13,X		  ; 3D 13 3D | Logical AND with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_16E
; Address: $F4BEDA
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_16E:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	ROL $CF3F			; 2E 3F CF | Rotate left (absolute)
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	AND $BC3F,Y		  ; 39 3F BC | Logical AND with accumulator (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	INC $F6DC			; EE DC F6 | Increment (absolute)
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	JMP $009F00		  ; 5C 00 9F 00 | Jump to address long
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($DD,X)		  ; 01 DD | Logical OR with accumulator ((zero page,X))
	AND $3BE3,X		  ; 3D E3 3B | Logical AND with accumulator (absolute,X)
	INC $F627,X		  ; FE 27 F6 | Increment (absolute,X)
	ORA $C211			; 0D 11 C2 | Logical OR with accumulator (absolute)
	BPL $36			  ; 10 36 | Branch if positive
	BMI $CE			  ; 30 CE | Branch if negative
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPX #$44			 ; E0 44 | Compare X register (immediate)
	LDY $689E,X		  ; BC 9E 68 | Load from absolute,X into Y register
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)
	BPL $FC			  ; 10 FC | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $2A			  ; F0 2A | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $1C0C,X		  ; 1E 0C 1C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BIT $106F			; 2C 6F 10 | Test bits in accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_172
; Address: $F4BF72
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_172:
	STY $0800			; 8C 00 08 | Store Y register to absolute address
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	LDY $EE			  ; A4 EE | Load from zero page into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $5E7F,X		  ; DE 7F 5E | Decrement (absolute,X)
	LDA				  ; BF 54 FF 52 | Read graphics status
	INC				  ; 1A | Increment accumulator
	AND $0500			; 2D 00 05 | Logical AND with accumulator (absolute)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDA $D100,Y		  ; B9 00 D1 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	BPL $74			  ; 10 74 | Branch if positive
	BVS $C8			  ; 70 C8 | Branch if overflow set
	CPY #$B3			 ; C0 B3 | Compare Y register (immediate)
	LDA				  ; BF 00 CC 00 | Read graphics status
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STY $340C			; 8C 0C 34 | Store Y register to absolute address
	CMP $00FF			; CD FF 00 | Compare accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	INX				  ; E8 | Increment X register
	PEA #$CC00		   ; F4 00 CC | Push effective address to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $DD55			; 8E 55 DD | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_173
; Address: $F4C020
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_173:
	JSR $9CFF			; 20 FF 9C | Jump to subroutine
	DEX				  ; CA | Decrement X register
	STA				  ; 9F 24 BF 73 | Update graphics data
	CLD				  ; D8 | Clear decimal mode flag
	INC $CFCF,X		  ; FE CF CF | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEC $0000			; CE 00 00 | Decrement (absolute)
	LDA $5BBF,X		  ; BD BF 5B | Read graphics status
	ADC $E4FF,Y		  ; 79 FF E4 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_174
; Address: $F4C04A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_174:
	ASL $70F1			; 0E F1 70 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	JMP $002800		  ; 5C 00 28 00 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BEQ $E0			  ; F0 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_175
; Address: $F4C072
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_175:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ROL $0F15,X		  ; 3E 15 0F | Rotate left (absolute,X)
	ORA $060F,X		  ; 1D 0F 06 | Logical OR with accumulator (absolute,X)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $F6			  ; 05 F6 | Logical OR with accumulator (zero page)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	REP #$FF			 ; C2 FF | Reset processor status bits
	DEC $23FF			; CE FF 23 | Decrement (absolute)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEC $CF00			; CE 00 CF | Decrement (absolute)
	BIT $E817			; 2C 17 E8 | Test bits in accumulator (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $CC98			; CC 98 CC | Compare Y register (absolute)
	PHA				  ; 48 | Push accumulator to stack
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_176
; Address: $F4C0ED
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_176:
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $D8			  ; F0 D8 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	LDY $00			  ; A4 00 | Load from zero page into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $79			  ; 30 79 | Branch if negative
	BMI $79			  ; 30 79 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_177
; Address: $F4C104
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_177:
	JSL $7B0A7B		  ; 22 7B 0A 7B | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	ROL $361F,X		  ; 3E 1F 36 | Rotate left (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	JMP ($1800)		  ; 6C 00 18 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDA ($FB),Y		  ; B1 FB | Read graphics status
	EOR ($73),Y		  ; 51 73 | Exclusive OR with accumulator ((zero page),Y)
	LDX #$B2			 ; A2 B2 | Load immediate value into X register
	SBC ($B2,X)		  ; E1 B2 | Subtract with carry ((zero page,X))
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	INC $FEBC,X		  ; FE BC FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	BNE $7C			  ; D0 7C | Branch if not equal
	LDY $F6			  ; A4 F6 | Load from zero page into Y register
	LDY $2CF6			; AC F6 2C | Load from absolute address into Y register
	STX $00			  ; 86 00 | Store X register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $9400			; 8C 00 94 | Store Y register to absolute address
	ROL $2A00			; 2E 00 2A | Rotate left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $38FE			; 0E FE 38 | Arithmetic shift left (absolute)
	BMI $F8			  ; 30 F8 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3C00			; 0E 00 3C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_178
; Address: $F4C19A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_178:
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $5E31			; 9C 31 5E | Store zero to absolute
	ADC $FDD0,X		  ; 7D D0 FD | Add with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($00,X)		  ; A1 00 | Read graphics status
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LDA $FF4CFF		  ; AF FF 4C FF | Read graphics status
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STA ($FE,X)		  ; 81 FE | Update graphics data
	INC $F8F8			; EE F8 F8 | Increment (absolute)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BVC $E0			  ; 50 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_179
; Address: $F4C224
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_179:
	JSR $80F0			; 20 F0 80 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_17A
; Address: $F4C250
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_17A:
	JSR $2C00			; 20 00 2C | Jump to subroutine
	BIT $2200			; 2C 00 22 | Test bits in accumulator (absolute)
	LDA $ECFF			; AD FF EC | Read graphics status
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	BVS $FE			  ; 70 FE | Branch if overflow set
	BVC $FE			  ; 50 FE | Branch if overflow clear
	SBC #$9F			 ; E9 9F | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_17B
; Address: $F4C26E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_17B:
	SBC #$EF			 ; E9 EF | Subtract with carry (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	INC $FEC0,X		  ; FE C0 FE | Increment (absolute,X)
	INC $FE84,X		  ; FE 84 FE | Increment (absolute,X)
	BNE $FC			  ; D0 FC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BVS $78			  ; 70 78 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $12			  ; F0 12 | Branch if equal
	REP #$00			 ; C2 00 | Reset processor status bits
	STX $00			  ; 86 00 | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $1B0C			; 0D 0C 1B | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCS $30			  ; B0 30 | Branch if carry set
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_17C
; Address: $F4C2DA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_17C:
	BNE $00			  ; D0 00 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	AND $FF38,Y		  ; 39 38 FF | Logical AND with accumulator (absolute,Y)
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	AND ($83),Y		  ; 31 83 | Logical AND with accumulator ((zero page),Y)
	PHY				  ; 5A | Push Y register to stack
	INC				  ; 1A | Increment accumulator
	ROL $003E,X		  ; 3E 3E 00 | Rotate left (absolute,X)
	AND $C600,Y		  ; 39 00 C6 | Logical AND with accumulator (absolute,Y)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_17D
; Address: $F4C31E
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_17D:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	STA $B60146		  ; 8F 46 01 B6 | Update graphics data
	BMI $58			  ; 30 58 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $CF00,X		  ; FE 00 CF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BNE $1C			  ; D0 1C | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	STY $87			  ; 84 87 | Store Y register to zero page
	ROR $72E6			; 6E E6 72 | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PEA #$7F00		   ; F4 00 7F | Push effective address to stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_17F
; Address: $F4C36F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_17F:
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	ORA $0505			; 0D 05 05 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC #$EF			 ; E9 EF | Subtract with carry (immediate)
	BCS $FF			  ; B0 FF | Branch if carry set
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	SBC $696F,X		  ; FD 6F 69 | Subtract with carry (absolute,X)
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	ADC $6D00,Y		  ; 79 00 6D | Add with carry (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $A0			  ; F0 A0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_180
; Address: $F4C3C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_180:
	JSR $20F0			; 20 F0 20 | Jump to subroutine
	BEQ $60			  ; F0 60 | Branch if equal
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_181
; Address: $F4C3CC
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_181:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $0F01,X		  ; 1D 01 0F | Logical OR with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	PEA #$74F4		   ; F4 F4 74 | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $051F			; 0D 1F 05 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ROL $3C1D,X		  ; 3E 1D 3C | Rotate left (absolute,X)
	ADC $0011,X		  ; 7D 11 00 | Add with carry (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	LDY $38BE,X		  ; BC BE 38 | Load from absolute,X into Y register
	STA ($82),Y		  ; 91 82 | Update graphics data
	CMP $C20F			; CD 0F C2 | Compare accumulator (absolute)
	STZ $489F,X		  ; 9E 9F 48 | Store zero to absolute,X
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ROR $F300,X		  ; 7E 00 F3 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F FF C1 FF | Update graphics data
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ROL $9C77,X		  ; 3E 77 9C | Rotate left (absolute,X)
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	SBC $E2FF			; ED FF E2 | Subtract with carry (absolute)
	INC $FD9D,X		  ; FE 9D FD | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	DEC $FF			  ; C6 FF | Decrement (zero page)
	INC				  ; 1A | Increment accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_183
; Address: $F4C49A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_183:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	DEC $00			  ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_184
; Address: $F4C4A0
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_184:
	JSR $2038			; 20 38 20 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	ROR $F6C4,X		  ; 7E C4 F6 | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	CPY $18FF			; CC FF 18 | Compare Y register (absolute)
	INC $00D8,X		  ; FE D8 00 | Increment (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	AND $8000,Y		  ; 39 00 80 | Logical AND with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	BCC $DC			  ; 90 DC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_185
; Address: $F4C52E
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_185:
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $80			  ; D0 80 | Branch if not equal
	BNE $90			  ; D0 90 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BVC $78			  ; 50 78 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	AND ($79),Y		  ; 31 79 | Logical AND with accumulator ((zero page),Y)
	BPL $79			  ; 10 79 | Branch if positive
	ORA $7D			  ; 05 7D | Logical OR with accumulator (zero page)
	ROL $3B7F			; 2E 7F 3B | Rotate left (absolute)
	ORA $061F			; 0D 1F 06 | Logical OR with accumulator (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	BEQ $9D			  ; F0 9D | Branch if equal
	STX $FE			  ; 86 FE | Store X register to zero page
	INC $FF83,X		  ; FE 83 FF | Increment (absolute,X)
	INC $0F00			; EE 00 0F | Increment (absolute)
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $63E3			; 9C E3 63 | Store zero to absolute
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	ADC $DDFF,X		  ; 7D FF DD | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_186
; Address: $F4C5D2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_186:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP $C7			  ; C5 C7 | Compare accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	ADC $01			  ; 65 01 | Add with carry (zero page)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_187
; Address: $F4C5EE
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_187:
	STY $FF			  ; 84 FF | Store Y register to zero page
	LDA $7C00,Y		  ; B9 00 7C | Read graphics status
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BVC $DC			  ; 50 DC | Branch if overflow clear
	STX $9E38			; 8E 38 9E | Store X register to absolute address
	BIT $6CFE			; 2C FE 6C | Test bits in accumulator (absolute)
	INC $FE18,X		  ; FE 18 FE | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $39			  ; 10 39 | Branch if positive
	BPL $3D			  ; 10 3D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	AND $3D00,Y		  ; 39 00 3D | Logical AND with accumulator (absolute,Y)
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCS $10			  ; B0 10 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BCC $F8			  ; 90 F8 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	CPX $2D08			; EC 08 2D | Compare X register (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_188
; Address: $F4C65E
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_188:
	BNE $FD			  ; D0 FD | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCS $10			  ; B0 10 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BPL $B8			  ; 10 B8 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	BPL $39			  ; 10 39 | Branch if positive
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $3D			  ; 10 3D | Branch if positive
	CLC				  ; 18 | Clear carry flag
	AND $7F18,X		  ; 3D 18 7F | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	AND $3D00,Y		  ; 39 00 3D | Logical AND with accumulator (absolute,Y)
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BPL $B8			  ; 10 B8 | Branch if positive
	BPL $FC			  ; 10 FC | Branch if positive
	BCC $FC			  ; 90 FC | Branch if carry clear
	BNE $FC			  ; D0 FC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	AND $B800			; 2D 00 B8 | Logical AND with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	BRA $FC			  ; 80 FC | Branch always
	BNE $FD			  ; D0 FD | Branch if not equal
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $6E2A			; 2E 2A 6E | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_189
; Address: $F4C6EA
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_189:
	AND $67			  ; 25 67 | Logical AND with accumulator (zero page)
	AND $67			  ; 25 67 | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	AND $3B00,X		  ; 3D 00 3B | Logical AND with accumulator (absolute,X)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND $7C58,X		  ; 3D 58 7C | Logical AND with accumulator (absolute,X)
	BVC $78			  ; 50 78 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BVC $78			  ; 50 78 | Branch if overflow clear
	BMI $38			  ; 30 38 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	AND $FC80			; 2D 80 FC | Logical AND with accumulator (absolute)
	BRA $F8			  ; 80 F8 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BNE $FD			  ; D0 FD | Branch if not equal
	ORA $293B,Y		  ; 19 3B 29 | Logical OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18A
; Address: $F4C726
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18A:
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA $3B00,Y		  ; 19 00 3B | Logical OR with accumulator (absolute,Y)
	BPL $7B			  ; 10 7B | Branch if positive
	ORA $7040,Y		  ; 19 40 70 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18B
; Address: $F4C742
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18B:
	JSR $2030			; 20 30 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BVC $7A			  ; 50 7A | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	CPX $ECA8			; EC A8 EC | Compare X register (absolute)
	DEY				  ; 88 | Decrement Y register
	DEC $F080			; CE 80 F0 | Decrement (absolute)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $FA			  ; 80 FA | Branch always
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BPL $FC			  ; 10 FC | Branch if positive
	BPL $FC			  ; 10 FC | Branch if positive
	BMI $FE			  ; 30 FE | Branch if negative
	ORA $031F			; 0D 1F 03 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18C
; Address: $F4C770
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18C:
	ORA $0900,Y		  ; 19 00 09 | Logical OR with accumulator (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $09FC			; ED FC 09 | Subtract with carry (absolute)
	STA $DB4B,Y		  ; 99 4B DB | Update graphics data
	LDA $25FB,Y		  ; B9 FB 25 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18D
; Address: $F4C7A0
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18D:
	JSR $96FF			; 20 FF 96 | Jump to subroutine
	DEC $CE9F			; CE 9F CE | Decrement (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CMP $60EF,Y		  ; D9 EF 60 | Compare accumulator (absolute,Y)
	ROR $E200			; 6E 00 E2 | Rotate right (absolute)
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $6EEF			; 2D EF 6E | Logical AND with accumulator (absolute)
	LDY $BF			  ; A4 BF | Load from zero page into Y register
	STZ $FCF8			; 9C F8 FC | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	BEQ $F8			  ; F0 F8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BVS $80			  ; 70 80 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18E
; Address: $F4C7F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18E:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	AND $E5			  ; 25 E5 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_18F
; Address: $F4C806
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_18F:
	JSR $08E0			; 20 E0 08 | Jump to subroutine
	ADC $1E00,Y		  ; 79 00 1E | Add with carry (absolute,Y)
	BPL $7F			  ; 10 7F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BIT $242D			; 2C 2D 24 | Test bits in accumulator (absolute)
	WDM #$C3			 ; 42 C3 | Reserved instruction

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_190
; Address: $F4C82A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_190:
	PHP				  ; 08 | Push processor status to stack
	DEC $7800			; CE 00 78 | Decrement (absolute)
	BNE $FD			  ; D0 FD | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $FE			  ; 30 FE | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BPL $39			  ; 10 39 | Branch if positive
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $3D			  ; 10 3D | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $E5			  ; 65 E5 | Add with carry (zero page)
	AND $3D00,Y		  ; 39 00 3D | Logical AND with accumulator (absolute,Y)
	AND $7F10,X		  ; 3D 10 7F | Logical AND with accumulator (absolute,X)
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	BCC $F8			  ; 90 F8 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	CPX $ECC8			; EC C8 EC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $2D2C			; 2D 2C 2D | Logical AND with accumulator (absolute)
	BIT $242D			; 2C 2D 24 | Test bits in accumulator (absolute)
	WDM #$C3			 ; 42 C3 | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	BPL $FC			  ; 10 FC | Branch if positive
	BNE $FD			  ; D0 FD | Branch if not equal
	BNE $FD			  ; D0 FD | Branch if not equal
	BNE $FD			  ; D0 FD | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $E5			  ; 25 E5 | Logical AND with accumulator (zero page)
	ORA $C5			  ; 05 C5 | Logical OR with accumulator (zero page)
	EOR $C5			  ; 45 C5 | Exclusive OR with accumulator (zero page)
	ADC #$E9			 ; 69 E9 | Add with carry (immediate)
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	BIT $2C2D			; 2C 2D 2C | Test bits in accumulator (absolute)
	LDY $24AF			; AC AF 24 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_191
; Address: $F4C8A8
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_191:
	WDM #$C3			 ; 42 C3 | Reserved instruction
	WDM #$C3			 ; 42 C3 | Reserved instruction
	WDM #$C3			 ; 42 C3 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	BNE $FD			  ; D0 FD | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	BVC $FF			  ; 50 FF | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $39			  ; 10 39 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0F6F			; 2E 6F 0F | Rotate left (absolute)
	AND $3D05,X		  ; 3D 05 3D | Logical AND with accumulator (absolute,X)
	AND $3900,X		  ; 3D 00 39 | Logical AND with accumulator (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	INX				  ; E8 | Increment X register
	SBC $EE28			; ED 28 EE | Subtract with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC $C644			; EE 44 C6 | Increment (absolute)
	DEC $0C			  ; C6 0C | Decrement (zero page)
	DEC $EE28			; CE 28 EE | Decrement (absolute)
	BCC $FE			  ; 90 FE | Branch if carry clear
	BPL $FD			  ; 10 FD | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	BPL $FE			  ; 10 FE | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $FE38,X		  ; FE 38 FE | Increment (absolute,X)
	BMI $FE			  ; 30 FE | Branch if negative
	BPL $FE			  ; 10 FE | Branch if positive
	INC $3910,X		  ; FE 10 39 | Increment (absolute,X)
	BPL $39			  ; 10 39 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	BPL $3E			  ; 10 3E | Branch if positive
	ROL $1702,X		  ; 3E 02 17 | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	DEC $EC20			; CE 20 EC | Decrement (absolute)
	BMI $FC			  ; 30 FC | Branch if negative
	BPL $F8			  ; 10 F8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_192
; Address: $F4C92E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_192:
	BPL $34			  ; 10 34 | Branch if positive
	BMI $FE			  ; 30 FE | Branch if negative
	BPL $FC			  ; 10 FC | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $1F08			; 0D 08 1F | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $1F00			; 0D 00 1F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_193
; Address: $F4C9C7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_193:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_194
; Address: $F4C9D7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_194:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	EOR $C5			  ; 45 C5 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_195
; Address: $F4C9E2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_195:
	JSR $18E0			; 20 E0 18 | Jump to subroutine
	ADC $7908,Y		  ; 79 08 79 | Add with carry (absolute,Y)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	WDM #$C3			 ; 42 C3 | Reserved instruction
	LSR $C7			  ; 46 C7 | Logical shift right (zero page)
	BIT $08EE			; 2C EE 08 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $FE			  ; 10 FE | Branch if positive
	SEC				  ; 38 | Set carry flag
	AND $1879,Y		  ; 39 79 18 | Logical AND with accumulator (absolute,Y)
	ADC $7908,Y		  ; 79 08 79 | Add with carry (absolute,Y)
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	JMP $44CF			; 4C CF 44 | Jump to address
	DEC $68			  ; C6 68 | Decrement (zero page)
	INC $FC30			; EE 30 FC | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_196
; Address: $F4CA4D
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_196:
	SEI				  ; 78 | Set interrupt disable flag
	BMI $FF			  ; 30 FF | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	INC $FE10,X		  ; FE 10 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDY $3C18,X		  ; BC 18 3C | Load from absolute,X into Y register
	BPL $3C			  ; 10 3C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	LDY $3C00,X		  ; BC 00 3C | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($D8,X)		  ; 01 D8 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA $1D3D			; 0D 3D 1D | Logical OR with accumulator (absolute)
	AND $3D1D,X		  ; 3D 1D 3D | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	AND $1E00,Y		  ; 39 00 1E | Logical AND with accumulator (absolute,Y)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $5C			  ; 50 5C | Branch if overflow clear
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STY $CC48			; 8C 48 CC | Store Y register to absolute address
	BPL $D8			  ; 10 D8 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	LDY #$FC			 ; A0 FC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_198
; Address: $F4CB7A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_198:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_199
; Address: $F4CB86
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_199:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	REP #$FE			 ; C2 FE | Reset processor status bits
	ORA ($C3),Y		  ; 11 C3 | Logical OR with accumulator ((zero page),Y)
	ROL $5D82,X		  ; 3E 82 5D | Rotate left (absolute,X)
	ADC $7A7D,X		  ; 7D 7D 7A | Add with carry (absolute,X)
	STY $0100			; 8C 00 01 | Store Y register to absolute address
	ADC $E300,X		  ; 7D 00 E3 | Add with carry (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $87			  ; F0 87 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_19A
; Address: $F4CBCC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_19A:
	SBC $8CF8,Y		  ; F9 F8 8C | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BNE $1C			  ; D0 1C | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	ASL $8790			; 0E 90 87 | Arithmetic shift left (absolute)
	SBC $E7			  ; E5 E7 | Subtract with carry (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ADC ($3B),Y		  ; 71 3B | Add with carry ((zero page),Y)
	ADC $F9B9,Y		  ; 79 B9 F9 | Add with carry (absolute,Y)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STX $8600			; 8E 00 86 | Store X register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $50			  ; 30 50 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_19B
; Address: $F4CC0D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_19B:
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_19C
; Address: $F4CC16
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_19C:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_19D
; Address: $F4CC36
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_19D:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	ORA $0A3F			; 0D 3F 0A | Logical OR with accumulator (absolute)
	ROL $1C0D,X		  ; 3E 0D 1C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	SEI				  ; 78 | Set interrupt disable flag
	ORA $2279,Y		  ; 19 79 22 | Logical OR with accumulator (absolute,Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_19E
; Address: $F4CC52
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_19E:
	JSR $2100			; 20 00 21 | PPU graphics register access
	STA $7B00			; 8D 00 7B | Update graphics data
	STA $87			  ; 85 87 | Update graphics data
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))
	SBC $820E			; ED 0E 82 | Subtract with carry (absolute)
	DEC $EC1F,X		  ; DE 1F EC | Decrement (absolute,X)
	ADC $FD00,Y		  ; 79 00 FD | Add with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	STA				  ; 9F 00 E0 00 | Update graphics data
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDX $1CDD,Y		  ; BE DD 1C | Load from absolute,Y into X register
	STZ $22FF			; 9C FF 22 | Store zero to absolute
	STZ $02E3			; 9C E3 02 | Store zero to absolute
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SEP #$FF			 ; E2 FF | Set processor status bits
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDY $B87F,X		  ; BC 7F B8 | Load from absolute,X into Y register
	STA ($4C,X)		  ; 81 4C | Update graphics data
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8800,X		  ; 7E 00 88 | Rotate right (absolute,X)
	STA $639F96		  ; 8F 96 9F 63 | Update graphics data
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	CMP ($CD,X)		  ; C1 CD | Compare accumulator ((zero page,X))
	EOR $CD			  ; 45 CD | Exclusive OR with accumulator (zero page)
	ADC $6000,Y		  ; 79 00 60 | Add with carry (absolute,Y)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $DF			  ; 50 DF | Branch if overflow clear
	STA $8C			  ; 85 8C | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A0
; Address: $F4CD18
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A0:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA $C878			; 0D 78 C8 | Logical OR with accumulator (absolute)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Update graphics data
	SEC				  ; 38 | Set carry flag
	BCS $CC			  ; B0 CC | Branch if carry set
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX $D27E			; EC 7E D2 | Compare X register (absolute)
	ADC $563D			; 6D 3D 56 | Add with carry (absolute)
	ROR $FEE2,X		  ; 7E E2 FE | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	SEP #$00			 ; E2 00 | Set processor status bits
	STA ($00),Y		  ; 91 00 | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $1C0D			; 0E 0D 1C | Arithmetic shift left (absolute)
	ORA $1300			; 0D 00 13 | Logical OR with accumulator (absolute)
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	BPL $43			  ; 10 43 | Branch if positive
	BIT $008D			; 2C 8D 00 | Test bits in accumulator (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDX $0E00,Y		  ; BE 00 0E | Load from absolute,Y into X register
	LDY $7200,X		  ; BC 00 72 | Load from absolute,X into Y register
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A2
; Address: $F4CDE6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A2:
	JSR $BD07			; 20 07 BD | Jump to subroutine
	STA				  ; 9F BA BF DD | Update graphics data
	INC $E7			  ; E6 E7 | Increment (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A3
; Address: $F4CDF2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A3:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $00			  ; 64 00 | Store zero to zero page
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	BIT $F6			  ; 24 F6 | Test bits in accumulator (zero page)
	BIT $F6			  ; 24 F6 | Test bits in accumulator (zero page)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	JMP ($173D)		  ; 6C 3D 17 | Jump to address (absolute indirect)
	ORA $893F			; 0D 3F 89 | Logical OR with accumulator (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEC				  ; 3A | Decrement accumulator
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDX $4320,Y		  ; BE 20 43 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	ADC #$48			 ; 69 48 | Add with carry (immediate)
	BIT #$C8			 ; 89 C8 | Test bits in accumulator (immediate)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	LDA				  ; BF 00 B7 00 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A4
; Address: $F4CE65
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A4:
	JSL $6B3E00		  ; 22 00 3E 6B | Jump to subroutine long
	INC $F7			  ; E6 F7 | Increment (zero page)
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	STA ($1C,X)		  ; 81 1C | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC $7201,X		  ; 7D 01 72 | Add with carry (absolute,X)
	DEC $06			  ; C6 06 | Decrement (zero page)
	DEC $06			  ; C6 06 | Decrement (zero page)
	BVS $3F			  ; 70 3F | Branch if overflow set
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A5
; Address: $F4CE90
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A5:
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A6
; Address: $F4CE9A
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A6:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $C8FE			; AC FE C8 | Load from absolute address into Y register
	INC $E7F4			; EE F4 E7 | Increment (absolute)
	DEC $9EEF			; CE EF 9E | Decrement (absolute)
	ROL $1200			; 2E 00 12 | Rotate left (absolute)
	ORA $1100,Y		  ; 19 00 11 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	EOR $F1FF			; 4D FF F1 | Exclusive OR with accumulator (absolute)
	SBC ($6E),Y		  ; F1 6E | Subtract with carry ((zero page),Y)
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	JMP $9F8E9F		  ; 5C 9F 8E 9F | Jump to address long
	LDY $0CEF			; AC EF 0C | Load from absolute address into Y register
	INC $D000			; EE 00 D0 | Increment (absolute)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	JMP ($7000)		  ; 6C 00 70 | Jump to address (absolute indirect)
	INC $9000			; EE 00 90 | Increment (absolute)
	STZ $5FFF			; 9C FF 5F | Store zero to absolute
	SBC ($F7,X)		  ; E1 F7 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $1F55F9		  ; 8F F9 55 1F | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $03FE33		  ; 8F 33 FE 03 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A7
; Address: $F4CF12
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A7:
	JSR $6000			; 20 00 60 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEC $FEFF			; CE FF FE | Decrement (absolute)
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	INC $2A13,X		  ; FE 13 2A | Increment (absolute,X)
	INC $FC07,X		  ; FE 07 FC | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	AND $0B00,X		  ; 3D 00 0B | Logical AND with accumulator (absolute,X)
	STY $FD			  ; 84 FD | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A8
; Address: $F4CF42
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A8:
	JSL $FCCDFE		  ; 22 FE CD FC | Jump to subroutine long
	BVS $7F			  ; 70 7F | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1A9
; Address: $F4CF5E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1A9:
	ASL $3000			; 0E 00 30 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX $FC98			; EC 98 FC | Compare X register (absolute)
	BCS $FC			  ; B0 FC | Branch if carry set
	BCS $F8			  ; B0 F8 | Branch if carry set
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ASL $0E3F,X		  ; 1E 3F 0E | Arithmetic shift left (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BVC $DC			  ; 50 DC | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1AB
; Address: $F4CF94
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1AB:
	JSR $1100			; 20 00 11 | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	DEC $ACDF,X		  ; DE DF AC | Decrement (absolute,X)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	SEP #$C3			 ; E2 C3 | Set processor status bits
	STA $619F,X		  ; 9D 9F 61 | Update graphics data
	ROR $7F1F,X		  ; 7E 1F 7F | Rotate right (absolute,X)
	LDA				  ; BF A0 00 8C | Read graphics status
	RTI				  ; 40 | Return from interrupt
	LDY $6200,X		  ; BC 00 62 | Load from absolute,X into Y register
	STA				  ; 9F 00 4F 00 | Update graphics data
	ADC $F9AB,Y		  ; 79 AB F9 | Add with carry (absolute,Y)
	ASL $C9FF,X		  ; 1E FF C9 | Arithmetic shift left (absolute,X)
	ROL $14FF,X		  ; 3E FF 14 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1AC
; Address: $F4CFCF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1AC:
	JSL $270087		  ; 22 87 00 27 | Jump to subroutine long
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ASL $CCFE,X		  ; 1E FE CC | Arithmetic shift left (absolute,X)
	CMP ($3F),Y		  ; D1 3F | Compare accumulator ((zero page),Y)
	BEQ $7F			  ; F0 7F | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1AD
; Address: $F4CFF8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1AD:
	JSR $3100			; 20 00 31 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1AE
; Address: $F4D000
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1AE:
	BNE $D8			  ; D0 D8 | Branch if not equal
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	ROL $FBD8,X		  ; 3E D8 FB | Rotate left (absolute,X)
	REP #$DB			 ; C2 DB | Reset processor status bits
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INC $0028,X		  ; FE 28 00 | Increment (absolute,X)
	BIT $D200			; 2C 00 D2 | Test bits in accumulator (absolute)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $153F			; 0E 3F 15 | Arithmetic shift left (absolute)
	ASL $011F			; 0E 1F 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1AF
; Address: $F4D030
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1AF:
	JSL $003100		  ; 22 00 31 00 | Jump to subroutine long
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $90BC			; 8D BC 90 | Update graphics data
	BCS $46			  ; B0 46 | Branch if carry set
	INC $01			  ; E6 01 | Increment (zero page)
	ORA $043F			; 0D 3F 04 | Logical OR with accumulator (absolute)
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $80FF			; CC FF 80 | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	BNE $1F			  ; D0 1F | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	PEA #$F000		   ; F4 00 F0 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	ORA $23FF,Y		  ; 19 FF 23 | Logical OR with accumulator (absolute,Y)
	CMP #$CF			 ; C9 CF | Compare accumulator (immediate)
	STA $0080,X		  ; 9D 80 00 | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ADC $00			  ; 65 00 | Add with carry (zero page)
	INC $FC58,X		  ; FE 58 FC | Increment (absolute,X)
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B2
; Address: $F4D0AF
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B2:
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	DEC $60FF,X		  ; DE FF 60 | Decrement (absolute,X)
	CMP ($F1),Y		  ; D1 F1 | Compare accumulator ((zero page),Y)
	SBC ($D2,X)		  ; E1 D2 | Subtract with carry ((zero page,X))
	ORA $0F1F			; 0D 1F 0F | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	BIT $1D00			; 2C 00 1D | Test bits in accumulator (absolute)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	WDM #$FF			 ; 42 FF | Reserved instruction
	CMP $B4C3,Y		  ; D9 C3 B4 | Compare accumulator (absolute,Y)
	LDA ($47),Y		  ; B1 47 | Read graphics status
	STA $38C5FC		  ; 8F FC C5 38 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	ROR $BF00,X		  ; 7E 00 BF | Rotate right (absolute,X)
	STY $3800			; 8C 00 38 | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF11,X		  ; FE 11 FF | Increment (absolute,X)
	SEP #$FF			 ; E2 FF | Set processor status bits
	ASL $3CFF,X		  ; 1E FF 3C | Arithmetic shift left (absolute,X)
	REP #$C0			 ; C2 C0 | Reset processor status bits
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B3
; Address: $F4D158
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B3:
	JSR $3F00			; 20 00 3F | Jump to subroutine
	WDM #$00			 ; 42 00 | Reserved instruction
	BMI $F8			  ; 30 F8 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BEQ $C0			  ; F0 C0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B4
; Address: $F4D176
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B4:
	BRA $00			  ; 80 00 | Branch always
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	LSR $7DFE			; 4E FE 7D | Logical shift right (absolute)
	ROL $131F			; 2E 1F 13 | Rotate left (absolute)
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	ASL $833F			; 0E 3F 83 | Arithmetic shift left (absolute)
	CMP $3C00			; CD 00 3C | Compare accumulator (absolute)
	AND $2000			; 2D 00 20 | Logical AND with accumulator (absolute)
	SBC ($6D),Y		  ; F1 6D | Subtract with carry ((zero page),Y)
	INC $7F41,X		  ; FE 41 7F | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA				  ; 9F 8E 00 63 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDX #$DD			 ; A2 DD | Load immediate value into X register
	ROL $42E3,X		  ; 3E E3 42 | Hardware register operation
	STA $C8FF,X		  ; 9D FF C8 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B5
; Address: $F4D1CE
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B5:
	JSR $F7FF			; 20 FF F7 | Jump to subroutine
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	JMP $87E4DF		  ; 5C DF E4 87 | Jump to address long
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STX $FF			  ; 86 FF | Store X register to zero page
	LDY $A4BF,X		  ; BC BF A4 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	INC $5C00,X		  ; FE 00 5C | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	CPX $C694			; EC 94 C6 | Compare X register (absolute)
	STY $DE			  ; 84 DE | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B6
; Address: $F4D240
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B6:
	CMP $ECEF,Y		  ; D9 EF EC | Compare accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	CPY $38F8			; CC F8 38 | Compare Y register (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B7
; Address: $F4D272
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B7:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $BDAD,X		  ; 1E AD BD | Arithmetic shift left (absolute,X)
	ROR $52FF			; 6E FF 52 | Rotate right (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $4200			; ED 00 42 | Hardware register operation
	BNE $00			  ; D0 00 | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $CA3F			; 9C 3F CA | Store zero to absolute
	STA				  ; 9F 24 BF 73 | Update graphics data
	CLD				  ; D8 | Clear decimal mode flag
	INC $CFCF,X		  ; FE CF CF | Increment (absolute,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEC $0000			; CE 00 00 | Decrement (absolute)
	EOR $7CDF,X		  ; 5D DF 7C | Exclusive OR with accumulator (absolute,X)
	SEP #$FF			 ; E2 FF | Set processor status bits
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	PEA #$0006		   ; F4 06 00 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $FA00			; EC 00 FA | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B8
; Address: $F4D389
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B8:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $8000,Y		  ; 19 00 80 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BNE $80			  ; D0 80 | Branch if not equal
	BNE $80			  ; D0 80 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BRA $D8			  ; 80 D8 | Branch always
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $2300,X		  ; 1D 00 23 | Logical OR with accumulator (absolute,X)
	INC $C353,X		  ; FE 53 C3 | Increment (absolute,X)
	ROR $8702,X		  ; 7E 02 87 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SBC $84FD,X		  ; FD FD 84 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1B9
; Address: $F4D452
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1B9:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	BEQ $63			  ; F0 63 | Branch if equal
	STZ $04			  ; 64 04 | Store zero to zero page
	BVS $F8			  ; 70 F8 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	STY $2FFC			; 8C FC 2F | Store Y register to absolute address
	STA $000700		  ; 8F 00 07 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	SBC ($51),Y		  ; F1 51 | Subtract with carry ((zero page),Y)
	ADC ($2B),Y		  ; 71 2B | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	STA $2E1C			; 8D 1C 2E | Update graphics data
	ROL $3E2E,X		  ; 3E 2E 3E | Rotate left (absolute,X)
	SBC $1E00,X		  ; FD 00 1E | Subtract with carry (absolute,X)
	ASL $8E00			; 0E 00 8E | Arithmetic shift left (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BCC $3C			  ; 90 3C | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ROL $6766			; 2E 66 67 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STA				  ; 9F 00 11 1B | Update graphics data
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	BPL $3A			  ; 10 3A | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1BA
; Address: $F4D4C6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1BA:
	JSL $7F136E		  ; 22 6E 13 7F | Jump to subroutine long
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	BVC $78			  ; 50 78 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $50			  ; 70 50 | Branch if overflow set
	BVS $10			  ; 70 10 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BCC $F8			  ; 90 F8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1BC
; Address: $F4D4F2
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1BC:
	BRA $F8			  ; 80 F8 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $D0			  ; 80 D0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $D0			  ; 80 D0 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BCC $10			  ; 90 10 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1BD
; Address: $F4D57F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1BD:
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($6D,X)		  ; 21 6D | Logical AND with accumulator ((zero page,X))
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	ROL $7C2D,X		  ; 3E 2D 7C | Rotate left (absolute,X)
	SBC $F232,Y		  ; F9 32 F2 | Subtract with carry (absolute,Y)
	SBC $FBEC			; ED EC FB | Subtract with carry (absolute)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA $9300			; 8D 00 93 | Update graphics data
	STY $87			  ; 84 87 | Store Y register to zero page
	ROR $0D7F,X		  ; 7E 7F 0D | Rotate right (absolute,X)
	CMP $3F01			; CD 01 3F | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $8300,X		  ; FD 00 83 | Subtract with carry (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP $771C			; CD 1C 77 | Compare accumulator (absolute)
	STZ $2AF7			; 9C F7 2A | Store zero to absolute

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1BE
; Address: $F4D5EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1BE:
	JSL $000240		  ; 22 40 02 00 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1BF
; Address: $F4D5FE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1BF:
	STA ($1C,X)		  ; 81 1C | Update graphics data
	STZ $B3FC			; 9C FC B3 | Store zero to absolute
	SBC $C37F,Y		  ; F9 7F C3 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LDY $FF00,X		  ; BC 00 FF | Load from absolute,X into Y register
	LDX $35EF			; AE EF 35 | Load from absolute address into X register
	ADC ($FD,X)		  ; 61 FD | Add with carry ((zero page,X))
	PEA #$EAF6		   ; F4 F6 EA | Push effective address to stack
	SEP #$66			 ; E2 66 | Set processor status bits
	INC $B9			  ; E6 B9 | Increment (zero page)
	ORA $1F00			; 0D 00 1F | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C0
; Address: $F4D64B
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C0:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $3A10,Y		  ; 19 10 3A | Logical OR with accumulator (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $3A00,Y		  ; 19 00 3A | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	CPX $FCB8			; EC B8 FC | Compare X register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $BC			  ; 10 BC | Branch if positive
	BPL $B8			  ; 10 B8 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $FC			  ; 10 FC | Branch if positive
	LDY $B800,X		  ; BC 00 B8 | Load from absolute,X into Y register
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C1
; Address: $F4D6F4
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C1:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	JMP $FF8BFC		  ; 5C FC 8B FF | Jump to address long
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BMI $7F			  ; 30 7F | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA $7C98,Y		  ; 99 98 7C | Update graphics data
	ASL $0EFE			; 0E FE 0E | Arithmetic shift left (absolute)
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $9D62,X		  ; 7E 62 9D | Rotate right (absolute,X)
	STA $151C,X		  ; 9D 1C 15 | Update graphics data
	ROL $36			  ; 26 36 | Rotate left (zero page)
	LDX $A1FF,Y		  ; BE FF A1 | Load from absolute,Y into X register
	CMP $0C00			; CD 00 0C | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C2
; Address: $F4D75E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C2:
	JSL $00F800		  ; 22 00 F8 00 | Jump to subroutine long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BCS $BF			  ; B0 BF | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY $277F			; CC 7F 27 | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $FD3F,X		  ; 3E 3F FD | Rotate left (absolute,X)
	SBC $F1D1,Y		  ; F9 D1 F1 | Subtract with carry (absolute,Y)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $2E00			; 0E 00 2E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C3
; Address: $F4D79E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C4
; Address: $F4D7AF
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C4:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	ASL $011F			; 0E 1F 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ROR $2700			; 6E 00 27 | Rotate right (absolute)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $07FF			; 0E FF 07 | Arithmetic shift left (absolute)
	LDA ($F0),Y		  ; B1 F0 | Read graphics status
	LDA ($E0,X)		  ; A1 E0 | Game work RAM access
	ADC $76EC			; 6D EC 76 | Add with carry (absolute)
	INC $FF15,X		  ; FE 15 FF | Increment (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	STY $1F			  ; 84 1F | Store Y register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	STA ($00,X)		  ; 81 00 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BVS $FF			  ; 70 FF | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C5
; Address: $F4D864
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C5:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	AND ($F7),Y		  ; 31 F7 | Logical AND with accumulator ((zero page),Y)
	SEP #$E7			 ; E2 E7 | Set processor status bits
	DEY				  ; 88 | Decrement Y register
	STA $800000		  ; 8F 00 00 80 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C7
; Address: $F4D87A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C7:
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $00DF,X		  ; 1E DF 00 | Arithmetic shift left (absolute,X)
	STZ $1C08,X		  ; 9E 08 1C | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	BNE $F8			  ; D0 F8 | Branch if not equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C8
; Address: $F4D88E
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C8:
	JSR $10F0			; 20 F0 10 | Jump to subroutine
	ROR $EC00			; 6E 00 EC | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	STA $EF6C,Y		  ; 99 6C EF | Update graphics data
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BVS $70			  ; 70 70 | Branch if overflow set
	ASL $74			  ; 06 74 | Arithmetic shift left (zero page)
	ADC ($97),Y		  ; 71 97 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY $FA00			; AC 00 FA | Load from absolute address into Y register
	STA $000D00		  ; 8F 00 0D 00 | Update graphics data
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHX				  ; DA | Push X register to stack
	INC $87ED			; EE ED 87 | Increment (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	INC $FC			  ; E6 FC | Increment (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0D05			; 0E 05 0D | Arithmetic shift left (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1C9
; Address: $F4D9D0
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1C9:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $2200,X		  ; 1E 00 22 | Arithmetic shift left (absolute,X)
	ORA #$FC			 ; 09 FC | Logical OR with accumulator (immediate)
	EOR ($19),Y		  ; 51 19 | Exclusive OR with accumulator ((zero page),Y)
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	STA $3FF1CF		  ; 8F CF F1 3F | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	DEC				  ; 3A | Decrement accumulator
	STX $F7			  ; 86 F7 | Store X register to zero page
	ADC $B27D			; 6D 7D B2 | Add with carry (absolute)
	LDA				  ; BF 9F 3C BF | Read graphics status
	PLX				  ; FA | Pull X register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	SEP #$00			 ; E2 00 | Set processor status bits
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ASL $4010,X		  ; 1E 10 40 | Arithmetic shift left (absolute,X)
	BEQ $60			  ; F0 60 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BVC $D8			  ; 50 D8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	BCC $BC			  ; 90 BC | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	ROR $9EBC,X		  ; 7E BC 9E | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0070,X		  ; FE 70 00 | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	DEC $F84B			; CE 4B F8 | Decrement (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CMP $7700			; CD 00 77 | Compare accumulator (absolute)
	BEQ $20			  ; F0 20 | Branch if equal
	CPX $06			  ; E4 06 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $FA00			; CC 00 FA | Compare Y register (absolute)
	SBC $0800,X		  ; FD 00 08 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1CA
; Address: $F4DAA1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1CA:
	BIT $3C18			; 2C 18 3C | Test bits in accumulator (absolute)
	ORA $061F			; 0D 1F 06 | Logical OR with accumulator (absolute)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	AND $7C17,Y		  ; 39 17 7C | Logical AND with accumulator (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	REP #$FF			 ; C2 FF | Reset processor status bits
	DEC $DBFF			; CE FF DB | Decrement (absolute)
	STZ $1700			; 9C 00 17 | Store zero to absolute
	DEX				  ; CA | Decrement X register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEC $F000			; CE 00 F0 | Decrement (absolute)
	INC $3BCF,X		  ; FE CF 3B | Increment (absolute,X)
	ORA $28F1			; 0D F1 28 | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $FF			  ; D0 FF | Branch if not equal
	SEC				  ; 38 | Set carry flag
	BMI $CE			  ; 30 CE | Branch if negative
	ASL $F000,X		  ; 1E 00 F0 | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BIT $FE			  ; 24 FE | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $D8			  ; F0 D8 | Branch if equal
	CPY $DC48			; CC 48 DC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1CB
; Address: $F4DB0C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1CB:
	JSR $08FC			; 20 FC 08 | Jump to subroutine
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	PEA #$6400		   ; F4 00 64 | Push effective address to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA #$78			 ; 09 78 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	JMP ($02EC)		  ; 6C EC 02 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $7ACF			; CD CF 7A | Compare accumulator (absolute)
	INC $8502,X		  ; FE 02 85 | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1CC
; Address: $F4DB61
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1CC:
	SED				  ; F8 | Set decimal mode flag
	INC $0700,X		  ; FE 00 07 | Increment (absolute,X)
	BVS $F9			  ; 70 F9 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	STA $000700		  ; 8F 00 07 00 | Update graphics data
	ORA $E201			; 0D 01 E2 | Logical OR with accumulator (absolute)
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	BEQ $50			  ; F0 50 | Branch if equal
	BVS $2B			  ; 70 2B | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	STA $2E1C			; 8D 1C 2E | Update graphics data
	ROL $3EAE,X		  ; 3E AE 3E | Rotate left (absolute,X)
	INC $1F00,X		  ; FE 00 1F | Increment (absolute,X)
	STA $00C700		  ; 8F 00 C7 00 | Update graphics data
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL $3EAC,X		  ; 3E AC 3E | Rotate left (absolute,X)
	STZ $67			  ; 64 67 | Store zero to zero page
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	REP #$00			 ; C2 00 | Reset processor status bits
	REP #$00			 ; C2 00 | Reset processor status bits
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $FDD1,X		  ; 7D D1 FD | Add with carry (absolute,X)
	ASL $0E0F,X		  ; 1E 0F 0E | Arithmetic shift left (absolute,X)
	LDA $FF4CFF		  ; AF FF 4C FF | Read graphics status
	SEC				  ; 38 | Set carry flag
	STA ($FE,X)		  ; 81 FE | Update graphics data
	DEC $FC			  ; C6 FC | Decrement (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1CD
; Address: $F4DC1A
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1CD:
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $50			  ; F0 50 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	INC $FF31			; EE 31 FF | Increment (absolute)
	INC $F929,X		  ; FE 29 F9 | Increment (absolute,X)
	LDY $79EC			; AC EC 79 | Load from absolute address into Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $91			  ; F0 91 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	INC $00			  ; E6 00 | Increment (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STX $87			  ; 86 87 | Store X register to zero page
	STA $87			  ; 85 87 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ADC $FC00,Y		  ; 79 00 FC | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	CMP $7708,X		  ; DD 08 77 | Compare accumulator (absolute,X)
	STZ $AA77			; 9C 77 AA | Store zero to absolute
	TAX				  ; AA | Transfer accumulator to X register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	EOR ($DC,X)		  ; 41 DC | Exclusive OR with accumulator ((zero page,X))
	ROL $DD00,X		  ; 3E 00 DD | Rotate left (absolute,X)
	EOR ($EB,X)		  ; 41 EB | Exclusive OR with accumulator ((zero page,X))
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	BRA $08			  ; 80 08 | Branch always
	JMP $1C73F3		  ; 5C F3 73 1C | Jump to address long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1CF
; Address: $F4DCCB
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1CF:
	BRA $7F			  ; 80 7F | Branch always
	JMP $C000			; 4C 00 C0 | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STX $7F00			; 8E 00 7F | Store X register to absolute address
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $FF			  ; 30 FF | Branch if negative
	LDA $50F1,X		  ; BD F1 50 | Read graphics status
	ADC ($3A),Y		  ; 71 3A | Add with carry ((zero page),Y)
	LDY $133E,X		  ; BC 3E 13 | Load from absolute,X into Y register
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	STX $C400			; 8E 00 C4 | Store X register to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D0
; Address: $F4DD08
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D0:
	JSR $4030			; 20 30 40 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BEQ $80			  ; F0 80 | Branch if equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D1
; Address: $F4DD14
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D1:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ROL $3F09,X		  ; 3E 09 3F | Rotate left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D2
; Address: $F4DD3E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	BVS $FA			  ; 70 FA | Branch if overflow set
	INC $EE58,X		  ; FE 58 EE | Increment (absolute,X)
	ORA $47			  ; 05 47 | Logical OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($00),Y		  ; 91 00 | Update graphics data
	ORA $BC00,Y		  ; 19 00 BC | Logical OR with accumulator (absolute,Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D3
; Address: $F4DD66
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D3:
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D4
; Address: $F4DD6B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D4:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	BNE $FC			  ; D0 FC | Branch if not equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D5
; Address: $F4DD72
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D5:
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $00			  ; C4 00 | Compare Y register (zero page)
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
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $5C			  ; F0 5C | Branch if equal
	STA $FF0DFF		  ; 8F FF 0D FF | Update graphics data
	BMI $7F			  ; 30 7F | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D6
; Address: $F4DDC6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D6:
	STA $FC98,Y		  ; 99 98 FC | Update graphics data
	INC $7EFE,X		  ; FE FE 7E | Increment (absolute,X)
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	ROL $1C89,X		  ; 3E 89 1C | Rotate left (absolute,X)
	STA $1D1C,X		  ; 9D 1C 1D | Update graphics data
	ORA $291C,X		  ; 1D 1C 29 | Logical OR with accumulator (absolute,X)
	ROR $FED6,X		  ; 7E D6 FE | Rotate right (absolute,X)
	CMP $EB00,Y		  ; D9 00 EB | Compare accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA				  ; 9F 1F 1E 1F | Update graphics data
	CMP $F0D9,X		  ; DD D9 F0 | Compare accumulator (absolute,X)
	BEQ $10			  ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D7
; Address: $F4DE2D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D7:
	BEQ $18			  ; F0 18 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1D8
; Address: $F4DE54
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1D8:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1DB
; Address: $F4DE6A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1DB:
	JSL $7B0B7B		  ; 22 7B 0B 7B | Jump to subroutine long
	ASL $223F			; 0E 3F 22 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	STZ $C1BE			; 9C BE C1 | Store zero to absolute
	LDX $4DC1,Y		  ; BE C1 4D | Load from absolute,Y into X register
	LDX $F35F,Y		  ; BE 5F F3 | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1DC
; Address: $F4DE97
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1DC:
	JSL $BE36F7		  ; 22 F7 36 BE | Jump to subroutine long
	LDY $EE			  ; A4 EE | Load from zero page into Y register
	BIT $9CEF			; 2C EF 9C | Test bits in accumulator (absolute)
	LDY $44FE,X		  ; BC FE 44 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	INC				  ; 1A | Increment accumulator
	STA $00			  ; 85 00 | Update graphics data
	LDA $9900,Y		  ; B9 00 99 | Read graphics status
	STX $00			  ; 86 00 | Store X register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $3A00			; 9C 00 3A | Store zero to absolute
	BIT $277F			; 2C 7F 27 | Test bits in accumulator (absolute)
	ASL $063F,X		  ; 1E 3F 06 | Arithmetic shift left (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1DD
; Address: $F4DECF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1DD:
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	JMP ($6700)		  ; 6C 00 67 | Jump to address (absolute indirect)
	ROL $1E00,X		  ; 3E 00 1E | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $A1			  ; F0 A1 | Branch if equal
	CPX #$A9			 ; E0 A9 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	ADC $CCF8,Y		  ; 79 F8 CC | Add with carry (absolute,Y)
	LDA #$FF			 ; A9 FF | Read graphics status
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	STA				  ; 9F 1F 2B 3B | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1DE
; Address: $F4DF10
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1DE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	DEC $C7			  ; C6 C7 | Decrement (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1DF
; Address: $F4DF34
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1DF:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E0
; Address: $F4DF44
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E0:
	JSR $12FF			; 20 FF 12 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	STX $0E08			; 8E 08 0E | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $FCF0,X		  ; 9E F0 FC | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E1
; Address: $F4DF50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E1:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E2
; Address: $F4DF70
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E2:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E3
; Address: $F4DF90
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E3:
	JSR $2C00			; 20 00 2C | Jump to subroutine
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDX $10FF			; AE FF 10 | Load from absolute address into X register
	INC $9FED,X		  ; FE ED 9F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E4
; Address: $F4DFA8
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E4:
	SBC #$EF			 ; E9 EF | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $22			  ; 80 22 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVS $78			  ; 70 78 | Branch if overflow set
	BNE $F8			  ; D0 F8 | Branch if not equal
	BMI $F8			  ; 30 F8 | Branch if negative
	BRA $30			  ; 80 30 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	INC $7F28,X		  ; FE 28 7F | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	INC $C7FC,X		  ; FE FC C7 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $C400,Y		  ; 19 00 C4 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $F61E,Y		  ; 19 1E F6 | Logical OR with accumulator (absolute,Y)
	STY $F0F0			; 8C F0 F0 | Store Y register to absolute address
	SEP #$00			 ; E2 00 | Set processor status bits
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E5
; Address: $F4E040
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E5:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $051F			; 0E 1F 05 | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $1C7F,X		  ; 3D 7F 1C | Logical AND with accumulator (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $BAD0			; 6E D0 BA | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E6
; Address: $F4E08A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E6:
	ROR				  ; 6A | Rotate right (accumulator)
	LDY #$F9			 ; A0 F9 | Load immediate value into Y register
	LDA				  ; BF E0 00 F8 | Read graphics status
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($66,X)		  ; 21 66 | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $3F0B			; 6D 0B 3F | Add with carry (absolute)
	ROL $05			  ; 26 05 | Rotate left (zero page)
	ORA ($5B,X)		  ; 01 5B | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA $0700,X		  ; 1D 00 07 | Logical OR with accumulator (absolute,X)
	DEC $A43F,X		  ; DE 3F A4 | Decrement (absolute,X)
	DEC $7BEA			; CE EA 7B | Decrement (absolute)
	STY $FF			  ; 84 FF | Store Y register to zero page
	BEQ $FE			  ; F0 FE | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E7
; Address: $F4E0CF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E7:
	BVS $73			  ; 70 73 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	EOR $0500			; 4D 00 05 | Exclusive OR with accumulator (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	STY $7000			; 8C 00 70 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	BPL $24			  ; 10 24 | Branch if positive
	STZ $20			  ; 64 20 | Store zero to zero page
	STZ $20			  ; 64 20 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BIT $2408			; 2C 08 24 | Test bits in accumulator (absolute)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BNE $A0			  ; D0 A0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E8
; Address: $F4E14E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E8:
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $057F			; 4E 7F 05 | Logical shift right (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $46			  ; 80 46 | Branch always
	STX $49			  ; 86 49 | Store X register to zero page
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $80			  ; E6 80 | Increment (zero page)
	STZ $20			  ; 64 20 | Store zero to zero page
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $7E25,X		  ; 7D 25 7E | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP ($6420)		  ; 6C 20 64 | Jump to address (absolute indirect)
	BPL $79			  ; 10 79 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	BIT $2C7E			; 2C 7E 2C | Test bits in accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $3E00			; 0E 00 3E | Arithmetic shift left (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $04			  ; 26 04 | Rotate left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $004E			; 2C 4E 00 | Test bits in accumulator (absolute)
	DEC $BE54,X		  ; DE 54 BE | Decrement (absolute,X)
	LDY $7E			  ; A4 7E | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1E9
; Address: $F4E212
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1E9:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LSR $9E08			; 4E 08 9E | Logical shift right (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BMI $3F			  ; 30 3F | Branch if negative
	BEQ $C0			  ; F0 C0 | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1EA
; Address: $F4E24F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1EA:
	JSR $20F0			; 20 F0 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $40			  ; B0 40 | Branch if carry set
	ROL $070E,X		  ; 3E 0E 07 | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ADC $4F63,X		  ; 7D 63 4F | Add with carry (absolute,X)
	EOR $8080			; 4D 80 80 | Exclusive OR with accumulator (absolute)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	DEC $C282			; CE 82 C2 | Decrement (absolute)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1EB
; Address: $F4E2E4
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1EB:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	AND $277D			; 2D 7D 27 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $1B04,X		  ; 1D 04 1B | Logical OR with accumulator (absolute,X)
	AND $3F1E,Y		  ; 39 1E 3F | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $000D,X		  ; 1E 0D 00 | Arithmetic shift left (absolute,X)
	ORA $1E0A,X		  ; 1D 0A 1E | Logical OR with accumulator (absolute,X)
	ORA $003C			; 0D 3C 00 | Logical OR with accumulator (absolute)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	REP #$40			 ; C2 40 | Reset processor status bits
	SBC $9D08,Y		  ; F9 08 9D | Subtract with carry (absolute,Y)
	ADC $CE			  ; 65 CE | Add with carry (zero page)
	LDA ($C0),Y		  ; B1 C0 | Read graphics status
	DEC $00			  ; C6 00 | Decrement (zero page)
	BRA $F9			  ; 80 F9 | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$AE			 ; 09 AE | Logical OR with accumulator (immediate)
	ORA $BEDF,Y		  ; 19 DF BE | Logical OR with accumulator (absolute,Y)
	LDA $DABF,X		  ; BD BF DA | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ADC $6E24,X		  ; 7D 24 6E | Add with carry (absolute,X)
	STZ $7EDC			; 9C DC 7E | Store zero to absolute
	ADC $EEFE,X		  ; 7D FE EE | Add with carry (absolute,X)
	ROR $FFF3			; 6E F3 FF | Rotate right (absolute)
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	LDA $08FE			; AD FE 08 | Read graphics status
	INC $FE20,X		  ; FE 20 FE | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1EC
; Address: $F4E39D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1EC:
	BIT $55F6			; 2C F6 55 | Test bits in accumulator (absolute)
	STA				  ; 9F 10 B9 A6 | Update graphics data
	JMP ($807F)		  ; 6C 7F 80 | Jump to address (absolute indirect)
	SBC $0003,X		  ; FD 03 00 | Subtract with carry (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 9F 63 | Read graphics status
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1ED
; Address: $F4E3C2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1ED:
	JSR $9CD8			; 20 D8 9C | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $B8			  ; F0 B8 | Branch if equal
	BVC $78			  ; 50 78 | Branch if overflow clear
	BCS $3C			  ; B0 3C | Branch if carry set
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1EE
; Address: $F4E3D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1EE:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1EF
; Address: $F4E3DD
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1EF:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F1
; Address: $F4E469
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F1:
	JSR $1F6C			; 20 6C 1F | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BNE $FC			  ; D0 FC | Branch if not equal
	BCC $E8			  ; 90 E8 | Branch if carry clear
	BPL $D8			  ; 10 D8 | Branch if positive
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F3
; Address: $F4E495
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F3:
	JSR $08FC			; 20 FC 08 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BVC $70			  ; 50 70 | Branch if overflow clear
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $0F			  ; D0 0F | Branch if not equal
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($8F),Y		  ; 71 8F | Add with carry ((zero page),Y)
	SEP #$1D			 ; E2 1D | Set processor status bits
	JMP $B0B3			; 4C B3 B0 | Jump to address
	INC $19			  ; E6 19 | Increment (zero page)
	AND $A1C6,Y		  ; 39 C6 A1 | Logical AND with accumulator (absolute,Y)
	EOR $FCA3,X		  ; 5D A3 FC | Exclusive OR with accumulator (absolute,X)
	INC $FE60,X		  ; FE 60 FE | Increment (absolute,X)
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F4
; Address: $F4E4D9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F4:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	BRA $FC			  ; 80 FC | Branch always
	PLX				  ; FA | Pull X register from stack
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	LDX $54BB,Y		  ; BE BB 54 | Load from absolute,Y into X register
	CLD				  ; D8 | Clear decimal mode flag
	SBC $9A			  ; E5 9A | Subtract with carry (zero page)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F6
; Address: $F4E4F5
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F6:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	INC $7F24,X		  ; FE 24 7F | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $93			  ; 25 93 | Logical AND with accumulator (zero page)
	ROR $409F			; 6E 9F 40 | Rotate right (absolute)
	CMP ($09),Y		  ; D1 09 | Compare accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	SBC #$03			 ; E9 03 | Subtract with carry (immediate)
	CMP $A52B			; CD 2B A5 | Compare accumulator (absolute)
	BVC $FC			  ; 50 FC | Branch if overflow clear
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	LDA				  ; BF 83 3F 06 | Read graphics status
	SEP #$5F			 ; E2 5F | Set processor status bits
	BEQ $AF			  ; F0 AF | Branch if equal
	DEC $E739			; CE 39 E7 | Decrement (absolute)
	ORA $0E35			; 0D 35 0E | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $7A			  ; 25 7A | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	EOR $07			  ; 45 07 | Exclusive OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $FC03,X		  ; FE 03 FC | Increment (absolute,X)
	SBC $BC47,X		  ; FD 47 BC | Subtract with carry (absolute,X)
	BCS $1F			  ; B0 1F | Branch if carry set
	LDA ($3F,X)		  ; A1 3F | Read graphics status
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $70			  ; 80 70 | Branch always
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F7
; Address: $F4E548
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F7:
	JSR $E0C0			; 20 C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F8
; Address: $F4E580
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F8:
	ROR $66			  ; 66 66 | Rotate right (zero page)
	CMP $DFD7,Y		  ; D9 D7 DF | Compare accumulator (absolute,Y)
	CMP $0404,Y		  ; D9 04 04 | Compare accumulator (absolute,Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $C282,X		  ; DE 82 C2 | Decrement (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF EB 17 F3 | Read graphics status
	CPY $EA36			; CC 36 EA | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BPL $32			  ; 10 32 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1F9
; Address: $F4E613
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1F9:
	JSR $C038			; 20 38 C0 | Jump to subroutine
	ORA $07F0,Y		  ; 19 F0 07 | Logical OR with accumulator (absolute,Y)
	BEQ $4F			  ; F0 4F | Branch if equal
	BEQ $4D			  ; F0 4D | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	BVS $7D			  ; 70 7D | Branch if overflow set
	WDM #$FB			 ; 42 FB | Reserved instruction
	PEA #$595E		   ; F4 5E 59 | Push effective address to stack
	SBC $D7			  ; E5 D7 | Subtract with carry (zero page)
	LDA #$85			 ; A9 85 | Read graphics status
	PHX				  ; DA | Push X register to stack
	STA				  ; 9F 0D 07 01 | Update graphics data
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1FA
; Address: $F4E638
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1FA:
	BRA $00			  ; 80 00 | Branch always
	TSX				  ; BA | Transfer stack pointer to X register
	RTI				  ; 40 | Return from interrupt
	CMP $7A2D,X		  ; DD 2D 7A | Compare accumulator (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	LDA ($5B,X)		  ; A1 5B | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	CPX #$82			 ; E0 82 | Compare X register (immediate)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $E8D7,X		  ; FD D7 E8 | Subtract with carry (absolute,X)
	JMP ($1457)		  ; 6C 57 14 | Jump to address (absolute indirect)
	ORA $4C08			; 0D 08 4C | Logical OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$0F			 ; E0 0F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1FB
; Address: $F4E67E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1FB:
	JSR $800E			; 20 0E 80 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP $0074			; 4C 74 00 | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1FC
; Address: $F4E6C2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1FC:
	JSR $30E0			; 20 E0 30 | Jump to subroutine
	BNE $A0			  ; D0 A0 | Branch if not equal
	BMI $10			  ; 30 10 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1FD
; Address: $F4E6DD
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1FD:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	DEC $84D8,X		  ; DE D8 84 | Decrement (absolute,X)
	STY $80			  ; 84 80 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	DEC $C404,X		  ; DE 04 C4 | Decrement (absolute,X)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	ORA $132E,X		  ; 1D 2E 13 | Logical OR with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_1FF
; Address: $F4E737
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_1FF:
	JSR $047D			; 20 7D 04 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $E9			  ; 10 E9 | Branch if positive
	JMP $C874B8		  ; 5C B8 74 C8 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	ROR $F484,X		  ; 7E 84 F4 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_200
; Address: $F4E74B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_200:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BIT $AE00			; 2C 00 AE | Test bits in accumulator (absolute)
	LDX $F420,Y		  ; BE 20 F4 | Load from absolute,Y into X register
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	JMP $3BEC			; 4C EC 3B | Jump to address
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_201
; Address: $F4E778
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_201:
	JSR $0023			; 20 23 00 | Jump to subroutine
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BEQ $88			  ; F0 88 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_202
; Address: $F4E792
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_202:
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BPL $D0			  ; 10 D0 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $DFD7,Y		  ; D9 D7 DF | Compare accumulator (absolute,Y)
	CMP $8484,Y		  ; D9 84 84 | Compare accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $C202,X		  ; DE 02 C2 | Decrement (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	BIT $245F			; 2C 5F 24 | Test bits in accumulator (absolute)
	BIT $3C1F			; 2C 1F 3C | Test bits in accumulator (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	SEC				  ; 38 | Set carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BEQ $FC			  ; F0 FC | Branch if equal
	BNE $E8			  ; D0 E8 | Branch if not equal
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BNE $E0			  ; D0 E0 | Game work RAM access
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BVC $70			  ; 50 70 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BMI $E0			  ; 30 E0 | Game work RAM access
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	BPL $7F			  ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_204
; Address: $F4E838
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_204:
	INC $7D0B,X		  ; FE 0B 7D | Increment (absolute,X)
	BIT $F0			  ; 24 F0 | Test bits in accumulator (zero page)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	STX $07F9			; 8E F9 07 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BRA $7C			  ; 80 7C | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0904			; 0D 04 09 | Logical OR with accumulator (absolute)
	ORA $1208,Y		  ; 19 08 12 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $20			  ; 64 20 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_205
; Address: $F4E8AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_205:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_206
; Address: $F4E8BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_206:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_207
; Address: $F4E8F0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_207:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	BVS $A0			  ; 70 A0 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $E0			  ; 10 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_208
; Address: $F4E919
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_208:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_209
; Address: $F4E932
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_209:
	JSR $010F			; 20 0F 01 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $0D43,X		  ; 7D 43 0D | Add with carry (absolute,X)
	STX $44			  ; 86 44 | Store X register to zero page
	CPY $48			  ; C4 48 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $EE			  ; 80 EE | Branch always
	BRA $EC			  ; 80 EC | Branch always
	BRA $E8			  ; 80 E8 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $12			  ; 80 12 | Branch always
	BPL $1B			  ; 10 1B | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3D00,Y		  ; 39 00 3D | Logical AND with accumulator (absolute,Y)
	BPL $3E			  ; 10 3E | Branch if positive
	INC				  ; 1A | Increment accumulator
	ASL $0C08,X		  ; 1E 08 0C | Arithmetic shift left (absolute,X)
	BPL $32			  ; 10 32 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND $1D00,Y		  ; 39 00 1D | Logical AND with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_20A
; Address: $F4E98F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_20A:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)
	ASL $040F			; 0E 0F 04 | Arithmetic shift left (absolute)
	ASL $1B01			; 0E 01 1B | Arithmetic shift left (absolute)
	ORA $050A,X		  ; 1D 0A 05 | Logical OR with accumulator (absolute,X)
	ORA $1C04			; 0D 04 1C | Logical OR with accumulator (absolute)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_20C
; Address: $F4E9C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_20C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BCS $A0			  ; B0 A0 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_20D
; Address: $F4E9CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_20D:
	BVC $6F			  ; 50 6F | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_20E
; Address: $F4E9DC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_20E:
	JSR $9000			; 20 00 90 | Jump to subroutine
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
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
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_20F
; Address: $F4EA0E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_20F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_210
; Address: $F4EA48
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_210:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BPL $30			  ; 10 30 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $15			  ; F0 15 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3F1E,Y		  ; 39 1E 3F | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $0E0D,X		  ; 1E 0D 0E | Arithmetic shift left (absolute,X)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL $0B1C			; 0E 1C 0B | Arithmetic shift left (absolute)
	ASL $1E05			; 0E 05 1E | Arithmetic shift left (absolute)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_211
; Address: $F4EA80
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_211:
	ROL $C320,X		  ; 3E 20 C3 | Rotate left (absolute,X)
	WDM #$BD			 ; 42 BD | Reserved instruction
	EOR $22DE			; 4D DE 22 | Exclusive OR with accumulator (absolute)
	DEC $3A			  ; C6 3A | Decrement (zero page)
	SBC $1B			  ; E5 1B | Subtract with carry (zero page)
	ADC $C083,X		  ; 7D 83 C0 | Add with carry (absolute,X)
	REP #$80			 ; C2 80 | Reset processor status bits
	SBC ($C0),Y		  ; F1 C0 | Subtract with carry ((zero page),Y)
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_212
; Address: $F4EAA8
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_212:
	LDA $BFDF1B		  ; AF 1B DF BF | Read graphics status
	LDA $DABF,X		  ; BD BF DA | Read graphics status
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $0401			; 0E 01 04 | Arithmetic shift left (absolute)
	ASL $1F05			; 0E 05 1F | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	LDA ($51),Y		  ; B1 51 | Read graphics status
	DEC $E726,X		  ; DE 26 E7 | Decrement (absolute,X)
	ORA $0DF3,Y		  ; 19 F3 0D | Logical OR with accumulator (absolute,Y)
	BMI $F2			  ; 30 F2 | Branch if negative
	ORA $01FE			; 0D FE 01 | Logical OR with accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	DEC $F180			; CE 80 F1 | Decrement (absolute)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_213
; Address: $F4EAF6
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_213:
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BMI $FE			  ; 30 FE | Branch if negative
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BVS $80			  ; 70 80 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF FF BD BF | Read graphics status
	PHX				  ; DA | Push X register to stack
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 00 BF 04 | Update graphics data
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_214
; Address: $F4EB40
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_214:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	INC $F320			; EE 20 F3 | Increment (absolute)
	BIT $1867			; 2C 67 18 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_216
; Address: $F4EB52
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_216:
	JSR $9000			; 20 00 90 | Jump to subroutine
	BRA $CC			  ; 80 CC | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_217
; Address: $F4EB5B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_217:
	JSR $011F			; 20 1F 01 | Jump to subroutine
	SEP #$00			 ; E2 00 | Set processor status bits
	ORA $FE1C,X		  ; 1D 1C FE | Logical OR with accumulator (absolute,X)
	ASL $37			  ; 06 37 | Arithmetic shift left (zero page)
	PHB				  ; 8B | Push data bank register to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	LDA $DABF,X		  ; BD BF DA | Read graphics status
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $17			  ; 25 17 | Logical AND with accumulator (zero page)
	ORA $0D01,Y		  ; 19 01 0D | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $94			  ; D0 94 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	INC $FE20,X		  ; FE 20 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_218
; Address: $F4EBD8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_218:
	JSR $20F0			; 20 F0 20 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_219
; Address: $F4EC06
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_219:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BPL $30			  ; 10 30 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21A
; Address: $F4EC1D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21A:
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $07			  ; 70 07 | Branch if overflow set
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $BD42			; 0D 42 BD | Logical OR with accumulator (absolute)
	AND $E1C2,X		  ; 3D C2 E1 | Logical AND with accumulator (absolute,X)
	ASL $C13E,X		  ; 1E 3E C1 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21B
; Address: $F4EC4B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21B:
	STA				  ; 9F 10 EF CD | Update graphics data
	INC $FE70,X		  ; FE 70 FE | Increment (absolute,X)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $7270,Y		  ; F9 70 72 | Subtract with carry (absolute,Y)
	INC $77D7			; EE D7 77 | Increment (absolute)
	LDX $54BB,Y		  ; BE BB 54 | Load from absolute,Y into X register
	CLD				  ; D8 | Clear decimal mode flag
	SBC $9A			  ; E5 9A | Subtract with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	SBC $F140,X		  ; FD 40 F1 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21C
; Address: $F4EC75
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21C:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	INC $7F24,X		  ; FE 24 7F | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $0B			  ; 25 0B | Logical AND with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $21DE,X		  ; 9D DE 21 | PPU graphics register access
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	INC $EE11			; EE 11 EE | Increment (absolute)
	LDX $C0D1			; AE D1 C0 | Load from absolute address into X register
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21D
; Address: $F4ECB5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21D:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $0F0D,X		  ; 1E 0D 0F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F0D,X		  ; 1E 0D 0F | Arithmetic shift left (absolute,X)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21E
; Address: $F4ECCF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21E:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ADC $E183,X		  ; 7D 83 E1 | Add with carry (absolute,X)
	ASL $B946,X		  ; 1E 46 B9 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $B24D			; 4D 4D B2 | Exclusive OR with accumulator (absolute)
	AND ($DF,X)		  ; 21 DF | Logical AND with accumulator ((zero page,X))
	STA $FC63,X		  ; 9D 63 FC | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_21F
; Address: $F4ECF4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_21F:
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	INC $FCB0,X		  ; FE B0 FC | Increment (absolute,X)
	BRA $36			  ; 80 36 | Branch always
	DEC $84D8,X		  ; DE D8 84 | Decrement (absolute,X)
	STY $80			  ; 84 80 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $C404,X		  ; DE 04 C4 | Decrement (absolute,X)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	SBC $6507,Y		  ; F9 07 65 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ROL $0802,X		  ; 3E 02 08 | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_220
; Address: $F4ED35
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_220:
	JSR $0039			; 20 39 00 | Jump to subroutine
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	EOR $6123,X		  ; 5D 23 61 | Exclusive OR with accumulator (absolute,X)
	AND $0602,X		  ; 3D 02 06 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_221
; Address: $F4ED53
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_221:
	JSR $003C			; 20 3C 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_222
; Address: $F4ED74
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_222:
	SED				  ; F8 | Set decimal mode flag
	AND $1710,Y		  ; 39 10 17 | Logical AND with accumulator (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	ASL $0017			; 0E 17 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ORA $146B,X		  ; 1D 6B 14 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_224
; Address: $F4EDB5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_224:
	JSR $047D			; 20 7D 04 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 6B 14 7E | Update graphics data
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_225
; Address: $F4EDD3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_225:
	JSR $247D			; 20 7D 24 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ROR $20			  ; 66 20 | Rotate right (zero page)
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_226
; Address: $F4EDF6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_226:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $C300,X		  ; 7E 00 C3 | Rotate right (absolute,X)
	WDM #$3C			 ; 42 3C | Reserved instruction
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $DABF,X		  ; 3D BF DA | Logical AND with accumulator (absolute,X)
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	REP #$40			 ; C2 40 | Reset processor status bits
	SBC $9D08,Y		  ; F9 08 9D | Subtract with carry (absolute,Y)
	ADC $CE			  ; 65 CE | Add with carry (zero page)
	EOR $C0B3			; 4D B3 C0 | Exclusive OR with accumulator (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	BRA $F9			  ; 80 F9 | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA $BFDF1B		  ; AF 1B DF BF | Read graphics status
	LDA $DABF,X		  ; BD BF DA | Read graphics status
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $13			  ; 25 13 | Logical AND with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $A0			  ; F0 A0 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_227
; Address: $F4EEE7
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_227:
	BIT $1B3C			; 2C 3C 1B | Test bits in accumulator (absolute)
	ORA $0E06,Y		  ; 19 06 0E | Logical OR with accumulator (absolute,Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	SBC $E5			  ; E5 E5 | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	STA $0FF070		  ; 8F 70 F0 0F | Update graphics data
	CMP $7132			; CD 32 71 | Compare accumulator (absolute)
	STA $184FB3		  ; 8F B3 4F 18 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	INC $FC80,X		  ; FE 80 FC | Increment (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ADC $FE62,X		  ; 7D 62 FE | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $000C			; 0E 0C 00 | Arithmetic shift left (absolute)
	CMP $3B0A			; CD 0A 3B | Compare accumulator (absolute)
	BIT $F5			  ; 24 F5 | Test bits in accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $B332			; CD 32 B3 | Compare accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	DEC $1C00			; CE 00 1C | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_228
; Address: $F4EFCA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_228:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_229
; Address: $F4EFDF
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_229:
	BEQ $9B			  ; F0 9B | Branch if equal
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ASL $0802,X		  ; 1E 02 08 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $3C			  ; 10 3C | Branch if positive
	ORA $0700,Y		  ; 19 00 07 | Logical OR with accumulator (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	JMP $137C			; 4C 7C 13 | Jump to address
	ASL $0101,X		  ; 1E 01 01 | Arithmetic shift left (absolute,X)
	BMI $7F			  ; 30 7F | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($2F),Y		  ; D1 2F | Compare accumulator ((zero page),Y)
	BNE $1E			  ; D0 1E | Branch if not equal
	SEP #$F8			 ; E2 F8 | Set processor status bits
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	SBC $F700,Y		  ; F9 00 F7 | Subtract with carry (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FC			  ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22A
; Address: $F4F096
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22A:
	JSR $20F8			; 20 F8 20 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF EB 17 33 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22B
; Address: $F4F0B3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22B:
	JSR $0038			; 20 38 00 | Jump to subroutine
	AND $1710,Y		  ; 39 10 17 | Logical AND with accumulator (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $2D			  ; 06 2D | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22C
; Address: $F4F0CB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22C:
	BIT $73			  ; 24 73 | Test bits in accumulator (zero page)
	EOR $8FF3			; 4D F3 8F | Exclusive OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22D
; Address: $F4F0D8
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22D:
	JSR $4800			; 20 00 48 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	ORA #$2B			 ; 09 2B | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $5B			  ; 05 5B | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 98 00 00 | Update graphics data
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $CE			  ; 05 CE | Logical OR with accumulator (zero page)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	BMI $F2			  ; 30 F2 | Branch if negative
	CMP $26D9			; CD D9 26 | Compare accumulator (absolute)
	STX $78			  ; 86 78 | Store X register to zero page
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC $C900,X		  ; FE 00 C9 | Increment (absolute,X)
	SBC $1B			  ; E5 1B | Subtract with carry (zero page)
	CPX $C23E			; EC 3E C2 | Compare X register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22E
; Address: $F4F18A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22E:
	BMI $C0			  ; 30 C0 | Branch if negative
	BPL $F9			  ; 10 F9 | Branch if positive
	CMP $0400			; CD 00 04 | Compare accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_22F
; Address: $F4F1A6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_22F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7E12			; 2D 12 7E | Logical AND with accumulator (absolute)
	WDM #$78			 ; 42 78 | Reserved instruction
	BNE $A0			  ; D0 A0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_230
; Address: $F4F1CD
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_230:
	JSL $580BFB		  ; 22 FB 0B 58 | Jump to subroutine long
	JMP $00DC00		  ; 5C 00 DC 00 | Jump to address long
	LDA $B700,Y		  ; B9 00 B7 | Read graphics status
	ADC $E400			; 6D 00 E4 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDA $B523,X		  ; BD 23 B5 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $C852			; 6E 52 C8 | Rotate right (absolute)
	BCS $D0			  ; B0 D0 | Branch if carry set
	LDY #$F2			 ; A0 F2 | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	JMP $007C00		  ; 5C 00 7C 00 | Jump to address long
	LDA $7700,Y		  ; B9 00 77 | Read graphics status
	SBC $E400			; ED 00 E4 | Subtract with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ORA $1D3A,X		  ; 1D 3A 1D | Logical OR with accumulator (absolute,X)
	ROL $6B13			; 2E 13 6B | Rotate left (absolute)
	ROR $2F21,X		  ; 7E 21 2F | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_231
; Address: $F4F279
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_231:
	JSR $047D			; 20 7D 04 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STZ $4000,X		  ; 9E 00 40 | Store zero to absolute,X
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LSR $BF09			; 4E 09 BF | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_232
; Address: $F4F2A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_232:
	JSR $4778			; 20 78 47 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $3070			; 8C 70 30 | Store Y register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA				  ; 9F 00 3F 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_233
; Address: $F4F2BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_233:
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $2037			; CE 37 20 | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_234
; Address: $F4F2C5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_234:
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ORA $1D3A,X		  ; 1D 3A 1D | Logical OR with accumulator (absolute,X)
	ROL $6B13			; 2E 13 6B | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_236
; Address: $F4F2F9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_236:
	JSR $2075			; 20 75 20 | Jump to subroutine
	ADC $2F04,X		  ; 7D 04 2F | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BIT $DE0B			; 2C 0B DE | Test bits in accumulator (absolute)
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	ROL $506E			; 2E 6E 50 | Rotate left (absolute)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	STZ $3000,X		  ; 9E 00 30 | Store zero to absolute,X
	STX $F077			; 8E 77 F0 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_237
; Address: $F4F344
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_237:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ORA $1D3A,X		  ; 1D 3A 1D | Logical OR with accumulator (absolute,X)
	ROL $6B13			; 2E 13 6B | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_239
; Address: $F4F379
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_239:
	JSR $2075			; 20 75 20 | Jump to subroutine
	ADC $7D04,X		  ; 7D 04 7D | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23A
; Address: $F4F3B2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($9E0B)		  ; 6C 0B 9E | Jump to address (absolute indirect)
	ORA ($71),Y		  ; 11 71 | Logical OR with accumulator ((zero page),Y)
	ROR $D8E6			; 6E E6 D8 | Rotate right (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $001E00		  ; 8F 00 1E 00 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23B
; Address: $F4F41E
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23B:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	STY $00			  ; 84 00 | Store Y register to zero page
	BMI $3C			  ; 30 3C | Branch if negative
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	CPY $C300			; CC 00 C3 | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA $BFDF1B		  ; AF 1B DF BF | Read graphics status
	AND $DABF,X		  ; 3D BF DA | Logical AND with accumulator (absolute,X)
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	REP #$00			 ; C2 00 | Reset processor status bits
	ORA $7E1C,X		  ; 1D 1C 7E | Logical OR with accumulator (absolute,X)
	LSR $F7			  ; 46 F7 | Logical shift right (zero page)
	PHB				  ; 8B | Push data bank register to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	STA ($00,X)		  ; 81 00 | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23C
; Address: $F4F4CE
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23C:
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	EOR $CD			  ; 45 CD | Exclusive OR with accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	STA $0C7F02		  ; 8F 02 7F 0C | Update graphics data
	SEC				  ; 38 | Set carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND $FE38,Y		  ; 39 38 FE | Logical AND with accumulator (absolute,Y)
	ASL $D32F			; 0E 2F D3 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $5CA3			; 2C A3 5C | Test bits in accumulator (absolute)
	EOR $39A2,X		  ; 5D A2 39 | Exclusive OR with accumulator (absolute,X)
	DEC $9D			  ; C6 9D | Decrement (zero page)
	LDA $DB52			; AD 52 DB | Read graphics status
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FC18,X		  ; FE 18 FC | Increment (absolute,X)
	BMI $FC			  ; 30 FC | Branch if negative
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	ROR $6F6D,X		  ; 7E 6D 6F | Rotate right (absolute,X)
	LSR $C4			  ; 46 C4 | Logical shift right (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	STA $018F02		  ; 8F 02 8F 01 | Update graphics data
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $E183,X		  ; 7D 83 E1 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23D
; Address: $F4F5C3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23D:
	ASL $B946,X		  ; 1E 46 B9 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($4E),Y		  ; B1 4E | Read graphics status
	EOR $21B2			; 4D B2 21 | PPU graphics register access
	ADC $FC			  ; 65 FC | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23E
; Address: $F4F5D4
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23E:
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	BCS $FC			  ; B0 FC | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $7312,X		  ; 1D 12 73 | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC $E700,Y		  ; 79 00 E7 | Add with carry (absolute,Y)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	LSR $EFBD,X		  ; 5E BD EF | Logical shift right (absolute,X)
	BCC $90			  ; 90 90 | Branch if carry clear
	ROR $1F19,X		  ; 7E 19 1F | Rotate right (absolute,X)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	WDM #$FF			 ; 42 FF | Reserved instruction
	ROR $10FF			; 6E FF 10 | Rotate right (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	SBC $C103,X		  ; FD 03 C1 | Subtract with carry (absolute,X)
	ROL $7986,X		  ; 3E 86 79 | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	EOR $B24D			; 4D 4D B2 | Exclusive OR with accumulator (absolute)
	AND ($DF,X)		  ; 21 DF | Logical AND with accumulator ((zero page,X))
	STA $FC63,X		  ; 9D 63 FC | Update graphics data
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	INC $FCB0,X		  ; FE B0 FC | Increment (absolute,X)
	BRA $01			  ; 80 01 | Branch always
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $1F06			; 0D 06 1F | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $043F			; 0D 3F 04 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_23F
; Address: $F4F68C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_23F:
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	ORA $38A7			; 0D A7 38 | Logical OR with accumulator (absolute)
	LDA				  ; BF 00 6A 54 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_240
; Address: $F4F6D5
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_240:
	ASL $5F			  ; 06 5F | Arithmetic shift left (zero page)
	STZ $9400,X		  ; 9E 00 94 | Store zero to absolute,X
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA $0A15			; 0D 15 0A | Logical OR with accumulator (absolute)
	ROL $2812			; 2E 12 28 | Rotate left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BPL $1C			  ; 10 1C | Branch if positive
	AND $3700,Y		  ; 39 00 37 | Logical AND with accumulator (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_241
; Address: $F4F734
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_241:
	SED				  ; F8 | Set decimal mode flag
	AND $3710,Y		  ; 39 10 37 | Logical AND with accumulator (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_242
; Address: $F4F742
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_242:
	XBA				  ; EB | Exchange accumulator bytes
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_243
; Address: $F4F754
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_243:
	SED				  ; F8 | Set decimal mode flag
	ADC $3710,Y		  ; 79 10 37 | Add with carry (absolute,Y)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)
	AND ($6E,X)		  ; 21 6E | Logical AND with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	INX				  ; E8 | Increment X register
	BVC $E8			  ; 50 E8 | Branch if overflow clear
	BCC $70			  ; 90 70 | Branch if carry clear
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BNE $30			  ; D0 30 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $58			  ; 80 58 | Branch always
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_244
; Address: $F4F7C2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_244:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_245
; Address: $F4F7CE
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_245:
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BNE $60			  ; D0 60 | Branch if not equal
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ORA ($24,X)		  ; 01 24 | Logical OR with accumulator ((zero page,X))
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	BCC $58			  ; 90 58 | Branch if carry clear
	BRA $24			  ; 80 24 | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_246
; Address: $F4F877
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_246:
	BRA $20			  ; 80 20 | Branch always
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_247
; Address: $F4F87F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_247:
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_248
; Address: $F4F8AA
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_248:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0004			; 0D 04 00 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1905			; 0D 05 19 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $26			  ; 10 26 | Branch if positive
	STZ $20			  ; 64 20 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_249
; Address: $F4F903
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_249:
	JSR $0068			; 20 68 00 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	AND $15			  ; 25 15 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_24D
; Address: $F4F91C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_24D:
	BPL $0F			  ; 10 0F | Branch if positive
	BCC $A4			  ; 90 A4 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_24E
; Address: $F4F92D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_24E:
	JSR $2020			; 20 20 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_24F
; Address: $F4F943
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_24F:
	JSR $0868			; 20 68 08 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ADC #$09			 ; 69 09 | Add with carry (immediate)
	AND $15			  ; 25 15 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_251
; Address: $F4F956
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_251:
	JSR $601F			; 20 1F 60 | Jump to subroutine
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $0F			  ; 10 0F | Branch if positive
	BMI $1F			  ; 30 1F | Branch if negative
	BPL $96			  ; 10 96 | Branch if positive
	BCC $A4			  ; 90 A4 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_252
; Address: $F4F96D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_252:
	JSR $002C			; 20 2C 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_253
; Address: $F4F9A5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_253:
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	LDY #$D6			 ; A0 D6 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_254
; Address: $F4F9B2
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_254:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	CPY $CCC8			; CC C8 CC | Compare Y register (absolute)
	INY				  ; C8 | Increment Y register
	CPY $AC48			; CC 48 AC | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LDY $60			  ; A4 60 | Load from zero page into Y register
	LDY $40			  ; A4 40 | Load from zero page into Y register
	BCS $B8			  ; B0 B8 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $80			  ; B0 80 | Branch if carry set
	BNE $80			  ; D0 80 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BRA $D8			  ; 80 D8 | Branch always
	BRA $EC			  ; 80 EC | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BVC $50			  ; 50 50 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_255
; Address: $F4FA55
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_255:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $2D0C			; 2D 0C 2D | Logical AND with accumulator (absolute)
	AND ($23,X)		  ; 21 23 | Logical AND with accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	BPL $0C			  ; 10 0C | Branch if positive
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BVC $50			  ; 50 50 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_257
; Address: $F4FAAC
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_257:
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $3615			; 2D 15 36 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	AND $1C10,Y		  ; 39 10 1C | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	BEQ $F8			  ; F0 F8 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_258
; Address: $F4FAE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_258:
	ADC $9C40,X		  ; 7D 40 9C | Add with carry (absolute,X)
	CPX $24			  ; E4 24 | Compare X register (zero page)
	SBC $BF09,Y		  ; F9 09 BF | Subtract with carry (absolute,Y)
	LSR $6C			  ; 46 6C | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_259
; Address: $F4FAF4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_259:
	BRA $00			  ; 80 00 | Branch always
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	PEA #$EFEB		   ; F4 EB EF | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0401			; 0E 01 04 | Arithmetic shift left (absolute)
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CMP $EE28,Y		  ; D9 28 EE | Compare accumulator (absolute,Y)
	BIT #$F9			 ; 89 F9 | Test bits in accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $FF86,Y		  ; 79 86 FF | Add with carry (absolute,Y)
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	INC $C0			  ; E6 C0 | Increment (zero page)
	SBC $FE60,Y		  ; F9 60 FE | Subtract with carry (absolute,Y)
	BMI $FE			  ; 30 FE | Branch if negative
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_25B
; Address: $F4FB5E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_25B:
	INC $8030,X		  ; FE 30 80 | Increment (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDA				  ; BF FF BD BF | Read graphics status
	PHX				  ; DA | Push X register to stack
	STA				  ; 9F 00 BF 04 | Update graphics data
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3300			; 0E 00 33 | Arithmetic shift left (absolute)
	INC $9828			; EE 28 98 | Increment (absolute)
	BCC $30			  ; 90 30 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_25C
; Address: $F4FBA9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_25C:
	JSR $4060			; 20 60 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_25D
; Address: $F4FBB8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_25D:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_25E
; Address: $F4FBDC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_25E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $04			  ; 66 04 | Rotate right (zero page)
	BVC $30			  ; 50 30 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_25F
; Address: $F4FBEB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_25F:
	JSR $4060			; 20 60 40 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_260
; Address: $F4FBF8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_260:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $3962,X		  ; 9D 62 39 | Update graphics data
	DEC $D2			  ; C6 D2 | Decrement (zero page)
	LDA $13EC			; AD EC 13 | Read graphics status
	STY $7273			; 8C 73 72 | Store Y register to absolute address
	ORA $030C			; 0D 0C 03 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_261
; Address: $F4FC38
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_261:
	INC $7E0C,X		  ; FE 0C 7E | Increment (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LDA $DA3F,X		  ; BD 3F DA | Read graphics status
	SBC $7270,Y		  ; F9 70 72 | Subtract with carry (absolute,Y)
	INC $77D7			; EE D7 77 | Increment (absolute)
	LDX $54BB,Y		  ; BE BB 54 | Load from absolute,Y into X register
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$7D			 ; 42 7D | Reserved instruction
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	SBC $F140,X		  ; FD 40 F1 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_262
; Address: $F4FC59
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_262:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	INC $0B24,X		  ; FE 24 0B | Increment (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($4E),Y		  ; B1 4E | Read graphics status
	BRA $39			  ; 80 39 | Branch always
	DEC $1F			  ; C6 1F | Decrement (zero page)
	SBC ($D6,X)		  ; E1 D6 | Subtract with carry ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $ACE6,X		  ; 1E E6 AC | Arithmetic shift left (absolute,X)
	DEC $FE32			; CE 32 FE | Decrement (absolute)
	BRA $FE			  ; 80 FE | Branch always
	BMI $FE			  ; 30 FE | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SBC $F1D0,Y		  ; F9 D0 F1 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_263
; Address: $F4FC9D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_263:
	BRA $F1			  ; 80 F1 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $7F79,X		  ; FE 79 7F | Increment (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA				  ; BF CF 6F 55 | Read graphics status
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA $0407,X		  ; 1D 07 04 | Logical OR with accumulator (absolute,X)
	STX $FF			  ; 86 FF | Store X register to zero page
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	BPL $7F			  ; 10 7F | Branch if positive
	BMI $BF			  ; 30 BF | Branch if negative
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$E7			 ; 09 E7 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_264
; Address: $F4FCCA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_264:
	XBA				  ; EB | Exchange accumulator bytes
	LSR $E431			; 4E 31 E4 | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $7D08,X		  ; 3D 08 7D | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FF10,X		  ; FE 10 FF | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_265
; Address: $F4FCE0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_265:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_267
; Address: $F4FCE6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_267:
	JSR $1000			; 20 00 10 | Jump to subroutine
	DEC $73C0			; CE C0 73 | Decrement (absolute)
	ORA $00EC,X		  ; 1D EC 00 | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY $F200			; CC 00 F2 | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1905			; 0D 05 19 | Logical OR with accumulator (absolute)
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	AND #$E4			 ; 29 E4 | Logical AND with accumulator (immediate)
	JMP $ED6E92		  ; 5C 92 6E ED | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $FB			  ; 10 FB | Branch if positive

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_269
; Address: $F4FD5A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_269:
	INC $FF20,X		  ; FE 20 FF | Increment (absolute,X)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26A
; Address: $F4FD69
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26A:
	RTI				  ; 40 | Return from interrupt
	BMI $20			  ; 30 20 | Branch if negative
	DEC $73C0			; CE C0 73 | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY $0800			; CC 00 08 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $0814,X		  ; 3E 14 08 | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26B
; Address: $F4FD96
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26B:
	JSL $1C007F		  ; 22 7F 00 1C | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $081C,X		  ; 3E 1C 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $0808,X		  ; 3E 08 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26C
; Address: $F4FDC9
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26C:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC $5A			  ; 65 5A | Add with carry (zero page)
	AND $9B22,X		  ; 3D 22 9B | Logical AND with accumulator (absolute,X)
	STY $76			  ; 84 76 | Store Y register to zero page
	ADC $7041,Y		  ; 79 41 70 | Add with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA				  ; BF 25 DF 0D | Read graphics status
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Update graphics data
	LDA				  ; BF BD FF E8 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $A800,X		  ; 7E 00 A8 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	REP #$75			 ; C2 75 | Reset processor status bits
	STA $8F20DF		  ; 8F DF 20 8F | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $3C0000		  ; 8F 00 00 3C | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	INC $7941,X		  ; FE 41 79 | Increment (absolute,X)
	ASL $25			  ; 06 25 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	BIT $3D			  ; 24 3D | Test bits in accumulator (zero page)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $04FD			; 0D FD 04 | Logical OR with accumulator (absolute)
	STA $26DF76		  ; 8F 76 DF 26 | Update graphics data
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	ORA $23E2			; 0D E2 23 | Logical OR with accumulator (absolute)
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	BEQ $80			  ; F0 80 | Branch if equal
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	SBC $F300,Y		  ; F9 00 F3 | Subtract with carry (absolute,Y)
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	CPY #$9D			 ; C0 9D | Compare Y register (immediate)
	ASL $DF00,X		  ; 1E 00 DF | Arithmetic shift left (absolute,X)
	SBC $7AFF,X		  ; FD FF 7A | Subtract with carry (absolute,X)
	STA				  ; 9F 6D FF 0C | Update graphics data
	SBC $FF85,X		  ; FD 85 FF | Subtract with carry (absolute,X)
	STA $20FF			; 8D FF 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26D
; Address: $F4FE9D
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26D:
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	STZ $FE			  ; 64 FE | Store zero to zero page
	STA ($F1,X)		  ; 81 F1 | Update graphics data
	ASL $324D			; 0E 4D 32 | Arithmetic shift left (absolute)
	ADC $FF22,X		  ; 7D 22 FF | Add with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	JMP $FFC3FF		  ; 5C FF C3 FF | Jump to address long
	CLC				  ; 18 | Clear carry flag
	ROR $70FF			; 6E FF 70 | Rotate right (absolute)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA $FDEC,X		  ; 1D EC FD | Logical OR with accumulator (absolute,X)
	STA $22DF76		  ; 8F 76 DF 22 | Update graphics data
	ASL $FFE3,X		  ; 1E E3 FF | Arithmetic shift left (absolute,X)
	ASL $42C3,X		  ; 1E C3 42 | Hardware register operation
	STA ($81,X)		  ; 81 81 | Update graphics data
	BEQ $80			  ; F0 80 | Branch if equal
	SBC $E101,Y		  ; F9 01 E1 | Subtract with carry (absolute,Y)
	STA ($01,X)		  ; 81 01 | Update graphics data
	AND $7E01,X		  ; 3D 01 7E | Logical AND with accumulator (absolute,X)
	SBC $7AFF,X		  ; FD FF 7A | Subtract with carry (absolute,X)
	STA				  ; 9F 6D 03 00 | Update graphics data
	SBC $FF85,X		  ; FD 85 FF | Subtract with carry (absolute,X)
	STA $20FF			; 8D FF 20 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $5C7F,X		  ; 5D 7F 5C | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $0863,X		  ; 5D 63 08 | Exclusive OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26E
; Address: $F4FF3F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26E:
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0C02			; 0E 02 0C | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDX $FFBE,Y		  ; BE BE FF | Load from absolute,Y into X register
	SBC #$FB			 ; E9 FB | Subtract with carry (immediate)
	EOR $E1			  ; 45 E1 | Exclusive OR with accumulator (zero page)
	ASL $E100,X		  ; 1E 00 E1 | Arithmetic shift left (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC $1F72			; 6D 72 1F | Add with carry (absolute)
	ASL $0303,X		  ; 1E 03 03 | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	INC $E6			  ; E6 E6 | Increment (zero page)
	STA				  ; 9F 0D E0 00 | Update graphics data
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $0C07,X		  ; 1E 07 0C | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank68_GraphicsFunction_26F
; Address: $F4FFE2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank68_GraphicsFunction_26F:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	INC $F7E6,X		  ; FE E6 F7 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
