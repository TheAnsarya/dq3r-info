;==============================================================================
; Dragon Quest III - Bank $66
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F30000-$F37FFF
; Instructions: 8524
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_66"

;------------------------------------------------------------------------------
; Bank66_DmaFunction_000
; Address: $F38004
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_000:
	BRA $00			  ; 80 00 | Branch always
	BVS $7C			  ; 70 7C | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	ROR $037F,X		  ; 7E 7F 03 | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_001
; Address: $F38065
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_001:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	BMI $48			  ; 30 48 | Branch if negative
	BMI $A8			  ; 30 A8 | Branch if negative
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BVC $50			  ; 50 50 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $9A71,X		  ; FE 71 9A | Increment (absolute,X)
	STA $9A95,X		  ; 9D 95 9A | Store accumulator to absolute,X
	PLX				  ; FA | Pull X register from stack
	SBC $7EBD,X		  ; FD BD 7E | Subtract with carry (absolute,X)
	ROR $1B1F			; 6E 1F 1B | Rotate right (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	STA				  ; 9F 60 9F 60 | Store accumulator to absolute long,X
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	AND ($91),Y		  ; 31 91 | Logical AND with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BPL $E7			  ; 10 E7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_002
; Address: $F380FE
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_002:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $1D1E,X		  ; 3E 1E 1D | Rotate left (absolute,X)
	ADC $60			  ; 65 60 | Add with carry (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BRA $60			  ; 80 60 | Branch always
	BRA $70			  ; 80 70 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BPL $3E			  ; 10 3E | Branch if positive
	ROR $01			  ; 66 01 | Rotate right (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_003
; Address: $F3818B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_003:
	JSR $02E2			; 20 E2 02 | Jump to subroutine
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_004
; Address: $F3819E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_004:
	ROL $C1			  ; 26 C1 | Rotate left (zero page)
	BIT $1D			  ; 24 1D | Test bits in accumulator (zero page)
	ORA $0A0B,Y		  ; 19 0B 0A | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA $11			  ; 05 11 | Logical OR with accumulator (zero page)
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	AND $1B02,X		  ; 3D 02 1B | Logical AND with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	PEA #$17F0		   ; F4 F0 17 | Push effective address to stack
	ROR $DF7E,X		  ; 7E 7E DF | Rotate right (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PEA #$1708		   ; F4 08 17 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_005
; Address: $F381DE
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_005:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	JMP $001A00		  ; 5C 00 1A 00 | Jump to address long
	WDM #$C0			 ; 42 C0 | Reserved instruction
	LSR $003C,X		  ; 5E 3C 00 | Logical shift right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	REP #$3C			 ; C2 3C | Reset processor status bits
	ROR $0400,X		  ; 7E 00 04 | Rotate right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $7F			  ; F0 7F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $0501,X		  ; 1E 01 05 | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_006
; Address: $F38283
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_006:
	JSL $7024A8		  ; 22 A8 24 70 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 20 A7 58 | Store accumulator to absolute long,X
	LDX #$58			 ; A2 58 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_007
; Address: $F382A1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_007:
	JSL $1544FF		  ; 22 FF 44 15 | Jump to subroutine long
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	BIT $123C			; 2C 3C 12 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	AND $E5C4,Y		  ; 39 C4 E5 | Logical AND with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	EOR $1A			  ; 45 1A | Exclusive OR with accumulator (zero page)
	LSR $3E10			; 4E 10 3E | Logical shift right (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_008
; Address: $F382C1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_008:
	JSL $36420B		  ; 22 0B 42 36 | Jump to subroutine long
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	BVS $84			  ; 70 84 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPY $2378			; CC 78 23 | Compare Y register (absolute)
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	CPY $F830			; CC 30 F8 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_009
; Address: $F382E6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_009:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BVS $D0			  ; 70 D0 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00A
; Address: $F38314
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00A:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	BMI $E4			  ; 30 E4 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	ASL $070B			; 0E 0B 07 | Arithmetic shift left (absolute)
	ORA $0900			; 0D 00 09 | Logical OR with accumulator (absolute)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BMI $2C			  ; 30 2C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $0F			  ; 10 0F | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00B
; Address: $F38406
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00B:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00C
; Address: $F38412
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00C:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00D
; Address: $F38416
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00D:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CMP $00D9,Y		  ; D9 D9 00 | Compare accumulator (absolute,Y)
	CMP $00D9,Y		  ; D9 D9 00 | Compare accumulator (absolute,Y)
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00E
; Address: $F38509
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00E:
	RTI				  ; 40 | Return from interrupt
	BMI $A0			  ; 30 A0 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $28			  ; B0 28 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY $E0D0,X		  ; BC D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_00F
; Address: $F38522
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_00F:
	BCC $E0			  ; 90 E0 | Game work RAM access
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	REP #$F6			 ; C2 F6 | Reset processor status bits
	LDA #$C1			 ; A9 C1 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $2C			  ; 50 2C | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_010
; Address: $F3852F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_010:
	ASL $00E0,X		  ; 1E E0 00 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	DEC $FC40,X		  ; DE 40 FC | Decrement (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_011
; Address: $F38567
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_011:
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	BPL $F8			  ; 10 F8 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_013
; Address: $F38584
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_013:
	BPL $40			  ; 10 40 | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_015
; Address: $F38594
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_015:
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_016
; Address: $F385A0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_016:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $6806			; 0D 06 68 | Logical OR with accumulator (absolute)
	BPL $48			  ; 10 48 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $FC00			; 6E 00 FC | Rotate right (absolute)
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	BCS $FC			  ; B0 FC | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	ASL $3100			; 0E 00 31 | Arithmetic shift left (absolute)
	ASL $30CE			; 0E CE 30 | Arithmetic shift left (absolute)
	ASL $3F00			; 0E 00 3F | Arithmetic shift left (absolute)
	INC $0800,X		  ; FE 00 08 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_017
; Address: $F385E4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_017:
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BVS $18			  ; 70 18 | Branch if overflow set
	BNE $80			  ; D0 80 | Branch if not equal
	BEQ $C4			  ; F0 C4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BRA $FC			  ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_018
; Address: $F385F9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_018:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	LDX #$C6			 ; A2 C6 | Load immediate value into X register
	ORA $53A1,Y		  ; 19 A1 53 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_019
; Address: $F3860A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_019:
	BEQ $6F			  ; F0 6F | Branch if equal
	LDY #$9B			 ; A0 9B | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	STZ $AA			  ; 64 AA | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	AND $3E75,Y		  ; 39 75 3E | Logical AND with accumulator (absolute,Y)
	CMP $8E7C,Y		  ; D9 7C 8E | Compare accumulator (absolute,Y)
	STY $FF			  ; 84 FF | Store Y register to zero page
	STZ $8F68,X		  ; 9E 68 8F | Store zero to absolute,X
	SEI				  ; 78 | Set interrupt disable flag
	ROR $FC03,X		  ; 7E 03 FC | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $68			  ; F0 68 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_01A
; Address: $F3868C
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_01A:
	JSR $E03D			; 20 3D E0 | Game work RAM access
	SBC $E0F8,Y		  ; F9 F8 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $50			  ; 10 50 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BVC $28			  ; 50 28 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $50			  ; 10 50 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	EOR ($5D),Y		  ; 51 5D | Exclusive OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	ADC ($B4),Y		  ; 71 B4 | Add with carry ((zero page),Y)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	INC $FC05,X		  ; FE 05 FC | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_01B
; Address: $F3873E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_01B:
	BVS $2F			  ; 70 2F | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	STZ $7860			; 9C 60 78 | Store zero to absolute
	BRA $B0			  ; 80 B0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_01C
; Address: $F38749
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_01C:
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PLX				  ; FA | Pull X register from stack
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEY				  ; 88 | Decrement Y register
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $D1			  ; 80 D1 | Branch always
	CPX $CCA1			; EC A1 CC | Compare X register (absolute)
	ORA ($AC),Y		  ; 11 AC | Logical OR with accumulator ((zero page),Y)
	BIT $0860			; 2C 60 08 | Test bits in accumulator (absolute)
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_01E
; Address: $F3876E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_01E:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	DEC $FC40,X		  ; DE 40 FC | Decrement (absolute,X)
	BPL $F8			  ; 10 F8 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_021
; Address: $F3878A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_021:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	BMI $01			  ; 30 01 | Branch if negative
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT #$08			 ; 89 08 | Test bits in accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $3C			  ; 10 3C | Branch if positive
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($FC),Y		  ; F1 FC | Subtract with carry ((zero page),Y)
	INC $FF35,X		  ; FE 35 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_022
; Address: $F387B5
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_022:
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	REP #$FF			 ; C2 FF | Reset processor status bits
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BVC $50			  ; 50 50 | Branch if overflow clear
	BRA $20			  ; 80 20 | Branch always
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	STY $EC			  ; 84 EC | Store Y register to zero page
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY $A8E0			; CC E0 A8 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BPL $FE			  ; 10 FE | Branch if positive
	INC $FE10,X		  ; FE 10 FE | Increment (absolute,X)
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROL $F0FE,X		  ; 3E FE F0 | Rotate left (absolute,X)
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_023
; Address: $F38859
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_023:
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $A0			  ; 10 A0 | Branch if positive
	BVC $50			  ; 50 50 | Branch if overflow clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_024
; Address: $F38866
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_024:
	JSR $60C0			; 20 C0 60 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	INX				  ; E8 | Increment X register
	BPL $C8			  ; 10 C8 | Branch if positive
	BMI $88			  ; 30 88 | Branch if negative
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $07			  ; 80 07 | Branch always
	ASL $0C10			; 0E 10 0C | Arithmetic shift left (absolute)
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_025
; Address: $F3888B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_025:
	JSR $3040			; 20 40 30 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_026
; Address: $F38892
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_026:
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BEQ $4F			  ; F0 4F | Branch if equal
	SBC ($5E,X)		  ; E1 5E | Subtract with carry ((zero page,X))
	SEP #$5C			 ; E2 5C | Set processor status bits
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BMI $80			  ; 30 80 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_027
; Address: $F388A0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_027:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_028
; Address: $F388E5
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_028:
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_029
; Address: $F38911
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_029:
	BMI $F3			  ; 30 F3 | Branch if negative
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $2C			  ; 50 2C | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_02A
; Address: $F38945
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_02A:
	ASL $68F0,X		  ; 1E F0 68 | Arithmetic shift left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEC $DE00,X		  ; DE 00 DE | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_02B
; Address: $F38974
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_02B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_02C
; Address: $F389AC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_02C:
	BRA $30			  ; 80 30 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $E101,X		  ; 1E 01 E1 | Arithmetic shift left (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_02D
; Address: $F389CD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_02D:
	JSR $4810			; 20 10 48 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEP #$FE			 ; E2 FE | Set processor status bits
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D0A			; 0D 0A 0D | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_02E
; Address: $F38A08
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_02E:
	JSR $5420			; 20 20 54 | Jump to subroutine
	JMP $1F1414		  ; 5C 14 14 1F | Jump to address long
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROL $2A08,X		  ; 3E 08 2A | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_030
; Address: $F38A53
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_030:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BRA $03			  ; 80 03 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_032
; Address: $F38AC1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_032:
	JSR $6000			; 20 00 60 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ROR $0100,X		  ; 7E 00 01 | Rotate right (absolute,X)
	ROL $3FC0,X		  ; 3E C0 3F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_033
; Address: $F38AEC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_033:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	ORA $0606,X		  ; 1D 06 06 | Logical OR with accumulator (absolute,X)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_035
; Address: $F38B45
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_035:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_036
; Address: $F38B50
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_036:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $10			  ; 05 10 | Logical OR with accumulator (zero page)
	BPL $3E			  ; 10 3E | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_038
; Address: $F38BAF
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_038:
	JSR $000F			; 20 0F 00 | Jump to subroutine
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	ROR $FE14,X		  ; 7E 14 FE | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	ORA $0606,X		  ; 1D 06 06 | Logical OR with accumulator (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_039
; Address: $F38C1A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_039:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BRA $07			  ; 80 07 | Branch always
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $07FF,X		  ; FE FF 07 | Increment (absolute,X)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BMI $38			  ; 30 38 | Branch if negative
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BMI $18			  ; 30 18 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $0400,X		  ; 1E 00 04 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BRA $04			  ; 80 04 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	REP #$00			 ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank66_DmaFunction_03A
; Address: $F38C8A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_03A:
	JSL $201240		  ; 22 40 12 20 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $F8			  ; 10 F8 | Branch if positive
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $FC			  ; 70 FC | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $FE3C,X		  ; FE 3C FE | Increment (absolute,X)
	STZ $0CFE			; 9C FE 0C | Store zero to absolute
	ROL $4004,X		  ; 3E 04 40 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_03C
; Address: $F38CA5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_03C:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_03D
; Address: $F38CBA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_03D:
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $04			  ; 80 04 | Branch always
	CPX #$82			 ; E0 82 | Compare X register (immediate)
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_03E
; Address: $F38CD5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_03E:
	CLC				  ; 18 | Clear carry flag
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	ASL $3EFF,X		  ; 1E FF 3E | Arithmetic shift left (absolute,X)
	ROR $FEFF,X		  ; 7E FF FE | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_040
; Address: $F38D28
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_040:
	JSR $4050			; 20 50 40 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	LDA				  ; BF 8A FE A0 | Load from absolute long,X into accumulator
	INC $FC94,X		  ; FE 94 FC | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_043
; Address: $F38D6B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_043:
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BRA $3F			  ; 80 3F | Branch always
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_044
; Address: $F38DC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_044:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $FC04			; 0E 04 FC | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BNE $F0			  ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_045
; Address: $F38DDB
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_045:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $2A00,X		  ; 1E 00 2A | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BMI $00			  ; 30 00 | Branch if negative
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_046
; Address: $F38E6D
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_046:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROL $7C10,X		  ; 3E 10 7C | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BPL $08			  ; 10 08 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	ORA $0606,X		  ; 1D 06 06 | Logical OR with accumulator (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BPL $FC			  ; 10 FC | Branch if positive
	LDY #$E0			 ; A0 E0 | Game work RAM access
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_047
; Address: $F38F2E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_047:
	JSR $0010			; 20 10 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $3C04,X		  ; 1E 04 3C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY $70			  ; A4 70 | Load from zero page into Y register
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_048
; Address: $F38F50
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_048:
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	ORA $1E12,Y		  ; 19 12 1E | Logical OR with accumulator (absolute,Y)
	ASL $0014,X		  ; 1E 14 00 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $2A			  ; 24 2A | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROR $7C18,X		  ; 7E 18 7C | Rotate right (absolute,X)
	BPL $54			  ; 10 54 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_04A
; Address: $F38F85
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_04A:
	JSR $0040			; 20 40 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BPL $70			  ; 10 70 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	EOR ($20,X)		  ; 41 20 | Exclusive OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_04B
; Address: $F38FBD
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_04B:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	CPX $CAF0			; EC F0 CA | Compare X register (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BEQ $C0			  ; F0 C0 | Branch if equal
	INC $3F20,X		  ; FE 20 3F | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BMI $23			  ; 30 23 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_04C
; Address: $F3901C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_04C:
	STA $83CD03		  ; 8F 03 CD 83 | Store accumulator to absolute long address
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ADC $65			  ; 65 65 | Add with carry (zero page)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FC			  ; 80 FC | Branch always
	PHX				  ; DA | Push X register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $90			  ; F0 90 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	INX				  ; E8 | Increment X register
	SBC $FFFD			; ED FD FF | Subtract with carry (absolute)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INC $00E7,X		  ; FE E7 00 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_04E
; Address: $F39069
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_04E:
	JSR $A080			; 20 80 A0 | Jump to subroutine
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_04F
; Address: $F3907E
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_04F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $E726,X		  ; 1E 26 E7 | Arithmetic shift left (absolute,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	ROR $F700,X		  ; 7E 00 F7 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $00FD50		  ; AF 50 FD 00 | Load from absolute long address into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	JMP $FE4C			; 4C 4C FE | Jump to address
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	AND $3E7D,X		  ; 3D 7D 3E | Logical AND with accumulator (absolute,X)
	INC $FF7F,X		  ; FE 7F FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_050
; Address: $F390EE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_050:
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	ASL $82			  ; 06 82 | Arithmetic shift left (zero page)
	DEC $C2			  ; C6 C2 | Decrement (zero page)
	LDX $A66C			; AE 6C A6 | Load from absolute address into X register
	ROR $6A			  ; 66 6A | Rotate right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $1E1E			; 0E 1E 1E | Arithmetic shift left (absolute)
	ROL $7E30,X		  ; 3E 30 7E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_051
; Address: $F39146
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_051:
	JSR $407E			; 20 7E 40 | Jump to subroutine
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_052
; Address: $F39162
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_052:
	JSR $0326			; 20 26 03 | Jump to subroutine
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	ADC ($22,X)		  ; 61 22 | Add with carry ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	DEC				  ; 3A | Decrement accumulator
	LSR $003E,X		  ; 5E 3E 00 | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_053
; Address: $F39182
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_053:
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_054
; Address: $F3918D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_054:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	AND #$30			 ; 29 30 | Logical AND with accumulator (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEP #$FE			 ; E2 FE | Set processor status bits
	INC $1BFE,X		  ; FE FE 1B | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_058
; Address: $F391CF
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_058:
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $1E0C			; 0D 0C 1E | Logical OR with accumulator (absolute)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	AND $3D13,X		  ; 3D 13 3D | Logical AND with accumulator (absolute,X)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	ORA $0707,X		  ; 1D 07 07 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA ($C3),Y		  ; B1 C3 | Load from (zero page),Y into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	BIT $BD			  ; 24 BD | Test bits in accumulator (zero page)
	STA $FCE8,Y		  ; 99 E8 FC | Store accumulator to absolute,Y
	CMP ($B8,X)		  ; C1 B8 | Compare accumulator ((zero page,X))
	BRA $24			  ; 80 24 | Branch always
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDY $707C,X		  ; BC 7C 70 | Load from absolute,X into Y register
	DEY				  ; 88 | Decrement Y register
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BIT $CE34			; 2C 34 CE | Test bits in accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	SBC $7B1B,X		  ; FD 1B 7B | Subtract with carry (absolute,X)
	LDY #$87			 ; A0 87 | Load immediate value into Y register
	BVS $13			  ; 70 13 | Branch if overflow set
	BRA $01			  ; 80 01 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEC				  ; 3A | Decrement accumulator
	EOR $DB			  ; 45 DB | Exclusive OR with accumulator (zero page)
	SBC $77			  ; E5 77 | Subtract with carry (zero page)
	EOR #$6E			 ; 49 6E | Exclusive OR with accumulator (immediate)
	CMP $10F2			; CD F2 10 | Compare accumulator (absolute)
	STZ $8C00			; 9C 00 8C | Store zero to absolute
	BPL $2C			  ; 10 2C | Branch if positive
	BPL $98			  ; 10 98 | Branch if positive
	BIT $B4			  ; 24 B4 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BCS $78			  ; B0 78 | Branch if carry set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_059
; Address: $F39262
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_059:
	TXS				  ; 9A | Transfer X register to stack pointer
	PLY				  ; 7A | Pull Y register from stack
	STA $C07F,Y		  ; 99 7F C0 | Store accumulator to absolute,Y
	CPY $B830			; CC 30 B8 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $540E			; 0E 0E 54 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $3FFF,X		  ; 7E FF 3F | Rotate right (absolute,X)
	INC $FE1F,X		  ; FE 1F FE | Increment (absolute,X)
	ASL $0EFE,X		  ; 1E FE 0E | Arithmetic shift left (absolute,X)
	INC $FC0C,X		  ; FE 0C FC | Increment (absolute,X)
	INC $FF7F,X		  ; FE 7F FF | Increment (absolute,X)
	ADC $7EFF,X		  ; 7D FF 7E | Add with carry (absolute,X)
	SBC $FC3F,X		  ; FD 3F FC | Subtract with carry (absolute,X)
	AND $3BFA,X		  ; 3D FA 3B | Logical AND with accumulator (absolute,X)
	ASL $00FD			; 0E FD 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BMI $F8			  ; 30 F8 | Branch if negative
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	BVC $78			  ; 50 78 | Branch if overflow clear
	BCC $E8			  ; 90 E8 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL $3A38,X		  ; 3E 38 3A | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_05A
; Address: $F3934A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_05A:
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $3810,X		  ; 1E 10 38 | Arithmetic shift left (absolute,X)
	BIT $3A10			; 2C 10 3A | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	LSR $5E3E,X		  ; 5E 3E 5E | Logical shift right (absolute,X)
	ROL $3E4F,X		  ; 3E 4F 3E | Rotate left (absolute,X)
	AND $151E			; 2D 1E 15 | Logical AND with accumulator (absolute)
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BRA $7F			  ; 80 7F | Branch always
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($E0,X)		  ; 61 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BNE $E0			  ; D0 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_05B
; Address: $F393AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_05B:
	BEQ $90			  ; F0 90 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_05E
; Address: $F393BF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_05E:
	SEC				  ; 38 | Set carry flag
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $1F0A			; 0D 0A 1F | Logical OR with accumulator (absolute)
	ORA $061A,X		  ; 1D 1A 06 | Logical OR with accumulator (absolute,X)
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	BPL $3A			  ; 10 3A | Branch if positive
	ASL $0B00			; 0E 00 0B | Arithmetic shift left (absolute)
	ORA $1B0E,X		  ; 1D 0E 1B | Logical OR with accumulator (absolute,X)
	ASL $1A00			; 0E 00 1A | Arithmetic shift left (absolute)
	ROL $3918,X		  ; 3E 18 39 | Rotate left (absolute,X)
	CMP $50B1,Y		  ; D9 B1 50 | Compare accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $6566			; 0E 66 65 | Arithmetic shift left (absolute)
	AND $767F,X		  ; 3D 7F 76 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_05F
; Address: $F393F9
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_05F:
	ADC $3F2E,X		  ; 7D 2E 3F | Add with carry (absolute,X)
	LDA $EB67,Y		  ; B9 67 EB | Load from absolute,Y into accumulator
	AND $F3			  ; 25 F3 | Logical AND with accumulator (zero page)
	BIT $D3			  ; 24 D3 | Test bits in accumulator (zero page)
	CMP $26			  ; C5 26 | Compare accumulator (zero page)
	ORA $060A			; 0D 0A 06 | Logical OR with accumulator (absolute)
	ORA $8000,Y		  ; 19 00 80 | Logical OR with accumulator (absolute,Y)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	STA				  ; 9F BF BF BF | Store accumulator to absolute long,X
	CPY $29			  ; C4 29 | Compare Y register (zero page)
	STY $854B			; 8C 4B 85 | Store Y register to absolute address
	EOR $82			  ; 45 82 | Exclusive OR with accumulator (zero page)
	STA ($1E),Y		  ; 91 1E | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank66_DmaFunction_060
; Address: $F3942F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_060:
	JSL $030001		  ; 22 01 00 03 | Jump to subroutine long
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BIT #$86			 ; 89 86 | Test bits in accumulator (immediate)
	INC $F7E1,X		  ; FE E1 F7 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_061
; Address: $F394E1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_061:
	JSR $40F0			; 20 F0 40 | Jump to subroutine
	BCC $60			  ; 90 60 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $58			  ; 70 58 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $3C			  ; 10 3C | Branch if positive
	LSR $78			  ; 46 78 | Logical shift right (zero page)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	STY $4C			  ; 84 4C | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank66_DmaFunction_063
; Address: $F39503
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_063:
	JSR $3048			; 20 48 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $58			  ; 30 58 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_064
; Address: $F39509
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_064:
	JSR $2058			; 20 58 20 | Jump to subroutine
	LDY $4640,X		  ; BC 40 46 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_065
; Address: $F39512
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_065:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLX				  ; FA | Pull X register from stack
	STY $3A			  ; 84 3A | Store Y register to zero page
	SBC $527A			; ED 7A 52 | Subtract with carry (absolute)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	ROL $FB18,X		  ; 3E 18 FB | Rotate left (absolute,X)
	STZ $7E			  ; 64 7E | Store zero to zero page
	BPL $7C			  ; 10 7C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $0532			; 0D 32 05 | Logical OR with accumulator (absolute)
	ROR $277F,X		  ; 7E 7F 27 | Rotate right (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_066
; Address: $F39580
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_066:
	JSR $D033			; 20 33 D0 | Jump to subroutine
	JMP ($B08C)		  ; 6C 8C B0 | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	AND ($61,X)		  ; 21 61 | Logical AND with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	AND ($CC,X)		  ; 21 CC | Logical AND with accumulator ((zero page,X))
	ADC $00C0,Y		  ; 79 C0 00 | Add with carry (absolute,Y)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $EE			  ; F0 EE | Branch if equal
	CPX #$92			 ; E0 92 | Compare X register (immediate)
	STY $0402			; 8C 02 04 | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BNE $D0			  ; D0 D0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_067
; Address: $F395A5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_067:
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($DC1C)		  ; 6C 1C DC | Jump to address (absolute indirect)
	CPX $F8F6			; EC F6 F8 | Compare X register (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $00D0,X		  ; 1E D0 00 | Arithmetic shift left (absolute,X)
	BEQ $D8			  ; F0 D8 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$6C9C		   ; F4 9C 6C | Push effective address to stack
	BIT $081C			; 2C 1C 08 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_068
; Address: $F395BC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_068:
	JSR $0040			; 20 40 00 | Jump to subroutine
	BRA $ED			  ; 80 ED | Branch always
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	STZ $7E			  ; 64 7E | Store zero to zero page
	BPL $7C			  ; 10 7C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL $171B			; 0E 1B 17 | Arithmetic shift left (absolute)
	ORA $0C0D,X		  ; 1D 0D 0C | Logical OR with accumulator (absolute,X)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $3F04			; 0E 04 3F | Arithmetic shift left (absolute)
	ORA $061F			; 0D 1F 06 | Logical OR with accumulator (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $3F1C			; 0E 1C 3F | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	LDA				  ; BF BF 93 93 | Load from absolute long,X into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_069
; Address: $F3961B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_069:
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_06E
; Address: $F3967E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_06E:
	JSR $3F20			; 20 20 3F | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_06F
; Address: $F396CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_06F:
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	ORA #$39			 ; 09 39 | Logical OR with accumulator (immediate)
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_070
; Address: $F396E7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_070:
	CPX #$41			 ; E0 41 | Compare X register (immediate)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	LDX #$C1			 ; A2 C1 | Load immediate value into X register
	CMP ($E3,X)		  ; C1 E3 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR $3E00,X		  ; 5D 00 3E | Exclusive OR with accumulator (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_071
; Address: $F39706
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_071:
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	BVC $58			  ; 50 58 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHB				  ; 8B | Push data bank register to stack
	ADC $1E52,X		  ; 7D 52 1E | Add with carry (absolute,X)
	CPY $5C74			; CC 74 5C | Compare Y register (absolute)
	BIT $1939			; 2C 39 19 | Test bits in accumulator (absolute)
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $6C0E			; 0E 0E 6C | Arithmetic shift left (absolute)
	STZ $3F			  ; 64 3F | Store zero to zero page
	INC $7F0C,X		  ; FE 0C 7F | Increment (absolute,X)
	STX $5CBE			; 8E BE 5C | Store X register to absolute address
	LDY $B8D0,X		  ; BC D0 B8 | Load from absolute,X into Y register
	BEQ $FE			  ; F0 FE | Branch if equal
	STZ $3ECC			; 9C CC 3E | Store zero to absolute
	CPY $0032			; CC 32 00 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_072
; Address: $F39757
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_072:
	JSR $3030			; 20 30 30 | Jump to subroutine
	ASL $4E7C,X		  ; 1E 7C 4E | Arithmetic shift left (absolute,X)
	LDY $7C00,X		  ; BC 00 7C | Load from absolute,X into Y register
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	AND $001F,Y		  ; 39 1F 00 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_073
; Address: $F3977E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_073:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	ROL $77			  ; 26 77 | Rotate left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $123F,X		  ; 3E 3F 12 | Rotate left (absolute,X)
	STY $2423			; 8C 23 24 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	BMI $DF			  ; 30 DF | Branch if negative
	DEC $1A			  ; C6 1A | Decrement (zero page)
	DEY				  ; 88 | Decrement Y register
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	JMP $8206			; 4C 06 82 | Jump to address
	DEC $C2			  ; C6 C2 | Decrement (zero page)
	LDX $006C			; AE 6C 00 | Load from absolute address into X register
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA $141B			; 0D 1B 14 | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	STZ $58			  ; 64 58 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_074
; Address: $F397F5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_074:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $38			  ; 64 38 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $1EFF,X		  ; 1E FF 1E | Arithmetic shift left (absolute,X)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_075
; Address: $F3982C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_075:
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_076
; Address: $F3984F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_076:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $01FF,X		  ; FE FF 01 | Increment (absolute,X)
	INC $38C6,X		  ; FE C6 38 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BCC $F8			  ; 90 F8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank66_DmaFunction_077
; Address: $F39883
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_077:
	JSR $3048			; 20 48 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BMI $58			  ; 30 58 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_078
; Address: $F39889
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_078:
	JSR $306C			; 20 6C 30 | Jump to subroutine
	LSR $2320,X		  ; 5E 20 23 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_079
; Address: $F3989C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_079:
	JSL $427D1C		  ; 22 1C 7D 42 | Hardware register operation
	PEA #$FDFF		   ; F4 FF FD | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation
	SEP #$ED			 ; E2 ED | Set processor status bits
	CMP $F1E2,X		  ; DD E2 F1 | Compare accumulator (absolute,X)
	INC $0000			; EE 00 00 | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $0A			  ; 10 0A | Branch if positive
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_07A
; Address: $F39902
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_07A:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP $5E			  ; C5 5E | Compare accumulator (zero page)
	EOR #$2F			 ; 49 2F | Exclusive OR with accumulator (immediate)
	INC $7A			  ; E6 7A | Increment (zero page)
	LSR $2C36			; 4E 36 2C | Logical shift right (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BPL $1F			  ; 10 1F | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F19,Y		  ; 19 19 0F | Logical OR with accumulator (absolute,Y)
	ORA $FE1F,X		  ; 1D 1F FE | Logical OR with accumulator (absolute,X)
	STY $3F			  ; 84 3F | Store Y register to zero page
	LSR $5E			  ; 46 5E | Logical shift right (zero page)
	BIT $586C			; 2C 6C 58 | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BVS $7E			  ; 70 7E | Branch if overflow set
	STZ $3EE4			; 9C E4 3E | Store zero to absolute
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BCS $B0			  ; B0 B0 | Branch if carry set
	BMI $DE			  ; 30 DE | Branch if negative
	INC $7C			  ; E6 7C | Increment (zero page)
	ASL $0E16			; 0E 16 0E | Arithmetic shift left (absolute)
	ASL $0E13			; 0E 13 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_07C
; Address: $F399A4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_07C:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BIT $271F			; 2C 1F 27 | Test bits in accumulator (absolute)
	ORA $18F9,Y		  ; 19 F9 18 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	ADC $E5			  ; 65 E5 | Add with carry (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_07E
; Address: $F399DE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_07E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CPY $8C88			; CC 88 8C | Compare Y register (absolute)
	DEY				  ; 88 | Decrement Y register
	STY $CC48			; 8C 48 CC | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_07F
; Address: $F39A00
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_07F:
	JSR $1030			; 20 30 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $84			  ; 80 84 | Branch always
	STY $86			  ; 84 86 | Store Y register to zero page
	STY $86			  ; 84 86 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	REP #$C0			 ; C2 C0 | Reset processor status bits
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCC $60			  ; 90 60 | Branch if carry clear
	BNE $20			  ; D0 20 | Branch if not equal
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_080
; Address: $F39A19
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_080:
	JSR $1068			; 20 68 10 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BPL $3C			  ; 10 3C | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BIT $003B			; 2C 3B 00 | Test bits in accumulator (absolute)
	ASL $1F1E,X		  ; 1E 1E 1F | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ORA $C840,Y		  ; 19 40 C8 | Logical OR with accumulator (absolute,Y)
	INC $06			  ; E6 06 | Increment (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $17			  ; 10 17 | Branch if positive
	ASL $0E16			; 0E 16 0E | Arithmetic shift left (absolute)
	ASL $0F17			; 0E 17 0F | Arithmetic shift left (absolute)
	ASL $0C0A			; 0E 0A 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_081
; Address: $F39A92
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_081:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	CPX $DA			  ; E4 DA | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_082
; Address: $F39AF5
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_082:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	JMP $0734			; 4C 34 07 | Jump to address
	BIT $0010			; 2C 10 00 | Test bits in accumulator (absolute)
	AND $301F,Y		  ; 39 1F 30 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $7C			  ; 70 7C | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $060F,Y		  ; 19 0F 06 | Logical OR with accumulator (absolute,Y)
	ORA $1E0D			; 0D 0D 1E | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $020D			; 0E 0D 02 | Arithmetic shift left (absolute)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	ORA $0506			; 0D 06 05 | Logical OR with accumulator (absolute)
	SBC $81FF,Y		  ; F9 FF 81 | Subtract with carry (absolute,Y)
	ROR $9E61,X		  ; 7E 61 9E | Rotate right (absolute,X)
	LDA				  ; BF 40 C0 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_083
; Address: $F39B5E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_083:
	BRA $00			  ; 80 00 | Branch always
	CPX $E6			  ; E4 E6 | Compare X register (zero page)
	CPY $C6			  ; C4 C6 | Compare Y register (zero page)
	CPY $C6			  ; C4 C6 | Compare Y register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_084
; Address: $F39B67
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_084:
	SEP #$F4			 ; E2 F4 | Set processor status bits
	LDY $7C6E			; AC 6E 7C | Load from absolute address into Y register
	BMI $36			  ; 30 36 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $030C			; 0E 0C 03 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $9EE8			; 2C E8 9E | Test bits in accumulator (absolute)
	SBC $BF07,X		  ; FD 07 BF | Subtract with carry (absolute,X)
	STY $3F			  ; 84 3F | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	ASL $7B			  ; 06 7B | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_085
; Address: $F39BB3
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_085:
	SEP #$FA			 ; E2 FA | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	CPY $8CFF			; CC FF 8C | Compare Y register (absolute)
	STZ $78FC			; 9C FC 78 | Store zero to absolute
	BEQ $30			  ; F0 30 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	LDY $7EFC,X		  ; BC FC 7E | Load from absolute,X into Y register
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	ROR $FC78,X		  ; 7E 78 FC | Rotate right (absolute,X)
	INC $0800,X		  ; FE 00 08 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	JMP ($F614)		  ; 6C 14 F6 | Jump to address (absolute indirect)
	INC $3B42,X		  ; FE 42 3B | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_086
; Address: $F39C0F
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_086:
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	CMP $5E			  ; C5 5E | Compare accumulator (zero page)
	EOR #$2F			 ; 49 2F | Exclusive OR with accumulator (immediate)
	INC $7A			  ; E6 7A | Increment (zero page)
	LSR $2E36			; 4E 36 2E | Logical shift right (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BPL $1F			  ; 10 1F | Branch if positive
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F19,Y		  ; 19 19 0F | Logical OR with accumulator (absolute,Y)
	INC $3F84,X		  ; FE 84 3F | Increment (absolute,X)
	LSR $5E			  ; 46 5E | Logical shift right (zero page)
	BIT $586C			; 2C 6C 58 | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BMI $BE			  ; 30 BE | Branch if negative
	JMP $00BE64		  ; 5C 64 BE 00 | Jump to address long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $F0			  ; B0 F0 | Branch if carry set
	BCS $9E			  ; B0 9E | Branch if carry set
	INC $FC			  ; E6 FC | Increment (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $7C			  ; 80 7C | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $160D			; 0E 0D 16 | Arithmetic shift left (absolute)
	ORA $101F,Y		  ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
	AND $763E,X		  ; 3D 3E 76 | Logical AND with accumulator (absolute,X)
	AND $1E29,X		  ; 3D 29 1E | Logical AND with accumulator (absolute,X)
	ROL $141C,X		  ; 3E 1C 14 | Rotate left (absolute,X)
	ORA $1906			; 0D 06 19 | Logical OR with accumulator (absolute)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ASL $0C3F			; 0E 3F 0C | Arithmetic shift left (absolute)
	ADC $3F32,X		  ; 7D 32 3F | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $1414,X		  ; 3E 14 14 | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_087
; Address: $F39CC8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_087:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC				  ; 1A | Increment accumulator
	ORA $0602			; 0D 02 06 | Logical OR with accumulator (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	ORA $0019,Y		  ; 19 19 00 | Logical OR with accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_088
; Address: $F39D07
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_088:
	BCC $40			  ; 90 40 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $30FF			; 0D FF 30 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $BC			  ; 80 BC | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_089
; Address: $F39D49
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_089:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $FC			  ; 30 FC | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $FC			  ; F0 FC | Branch if equal
	BMI $F8			  ; 30 F8 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_08A
; Address: $F39DA7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_08A:
	RTI				  ; 40 | Return from interrupt
	BMI $38			  ; 30 38 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BVS $70			  ; 70 70 | Branch if overflow set
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $0D1F,X		  ; 1D 1F 0D | Logical OR with accumulator (absolute,X)
	CPX $1A			  ; E4 1A | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $C0			  ; C4 C0 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	REP #$7C			 ; C2 7C | Reset processor status bits
	STZ $F8			  ; 64 F8 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_08B
; Address: $F39DF5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_08B:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1806			; 0E 06 18 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_08C
; Address: $F39E0D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_08C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ROR $3C7E,X		  ; 7E 7E 3C | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_08D
; Address: $F39E31
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_08D:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $1B16			; 0D 16 1B | Logical OR with accumulator (absolute)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	BMI $2F			  ; 30 2F | Branch if negative
	ORA $101F			; 0D 1F 10 | Logical OR with accumulator (absolute)
	AND $1F0B,Y		  ; 39 0B 1F | Logical AND with accumulator (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_08E
; Address: $F39E7B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_08E:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	ASL $1E11,X		  ; 1E 11 1E | Arithmetic shift left (absolute,X)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	AND $A856,Y		  ; 39 56 A8 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ASL $3FE6,X		  ; 1E E6 3F | Arithmetic shift left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $E0			  ; E6 E0 | Game work RAM access
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	BEQ $F4			  ; F0 F4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFC,X		  ; FD FC FF | Subtract with carry (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_090
; Address: $F39ED6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_090:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA #$79			 ; 09 79 | Logical OR with accumulator (immediate)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	SBC ($B8,X)		  ; E1 B8 | Subtract with carry ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STX $1E0E			; 8E 0E 1E | Store X register to absolute address
	ASL $0C44,X		  ; 1E 44 0C | Arithmetic shift left (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	PEA #$7E78		   ; F4 78 7E | Push effective address to stack
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_091
; Address: $F39F3B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_091:
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC #$9F			 ; 69 9F | Add with carry (immediate)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	ADC $FF11,Y		  ; 79 11 FF | Add with carry (absolute,Y)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BRA $86			  ; 80 86 | Branch always
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_092
; Address: $F39FA1
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_092:
	JSR $4700			; 20 00 47 | Jump to subroutine
	BPL $6F			  ; 10 6F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06F7			; 0D F7 06 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PEA #$8407		   ; F4 07 84 | Push effective address to stack
	PHB				  ; 8B | Push data bank register to stack
	SBC ($04),Y		  ; F1 04 | Subtract with carry ((zero page),Y)
	INC $EEFE,X		  ; FE FE EE | Increment (absolute,X)
	BVS $F7			  ; 70 F7 | Branch if overflow set
	BRA $83			  ; 80 83 | Branch always
	ROL $BC3F,X		  ; 3E 3F BC | Rotate left (absolute,X)
	LDX $FFFA,Y		  ; BE FA FF | Load from absolute,Y into X register
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $78F0,X		  ; FE F0 78 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_094
; Address: $F3A009
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_094:
	JSL $1C6700		  ; 22 00 67 1C | Jump to subroutine long
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ORA $3F1C,X		  ; 1D 1C 3F | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $AE			  ; 80 AE | Branch always
	RTI				  ; 40 | Return from interrupt
	CMP $E961,Y		  ; D9 61 E9 | Compare accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDX $80			  ; A6 80 | Load from zero page into X register
	STX $00			  ; 86 00 | Store X register to zero page
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_096
; Address: $F3A067
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_096:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_097
; Address: $F3A0A1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_097:
	JSL $182232		  ; 22 32 22 18 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ASL $060E			; 0E 0E 06 | Arithmetic shift left (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL $4F3E			; 2E 3E 4F | Rotate left (absolute)
	SBC $D3			  ; E5 D3 | Subtract with carry (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $90			  ; 80 90 | Branch always
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FCF0,X		  ; FE F0 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_098
; Address: $F3A0F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_098:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_099
; Address: $F3A114
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_099:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BPL $1C			  ; 10 1C | Branch if positive
	CPX $280C			; EC 0C 28 | Compare X register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($31,X)		  ; 61 31 | Add with carry ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	CPX #$4D			 ; E0 4D | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	CPX $5E78			; EC 78 5E | Compare X register (absolute)
	BMI $7B			  ; 30 7B | Branch if negative
	LSR $FB			  ; 46 FB | Logical shift right (zero page)
	INC $CC4A,X		  ; FE 4A CC | Increment (absolute,X)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	BEQ $7C			  ; F0 7C | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	CPX $5CB0			; EC B0 5C | Compare X register (absolute)
	STY $38			  ; 84 38 | Store Y register to zero page
	BPL $20			  ; 10 20 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	ORA $3715			; 0D 15 37 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $2818			; 2E 18 28 | Rotate left (absolute)
	AND ($61,X)		  ; 21 61 | Logical AND with accumulator ((zero page,X))
	BVS $60			  ; 70 60 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_09B
; Address: $F3A17D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_09B:
	JSR $0816			; 20 16 08 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	INC $EF7E,X		  ; FE 7E EF | Increment (absolute,X)
	LDA				  ; BF FF 9F F7 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	ROR $3FF4,X		  ; 7E F4 3F | Rotate right (absolute,X)
	ROR $7E1F			; 6E 1F 7E | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $3F04			; 0E 04 3F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_09C
; Address: $F3A1B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_09C:
	ASL $3F1C			; 0E 1C 3F | Arithmetic shift left (absolute)
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_09D
; Address: $F3A1DB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_09D:
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0F0A			; 0E 0A 0F | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCC $FF			  ; 90 FF | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_09E
; Address: $F3A22C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_09E:
	BRA $B0			  ; 80 B0 | Branch always
	BMI $F8			  ; 30 F8 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_09F
; Address: $F3A239
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_09F:
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	JMP $000404		  ; 5C 04 04 00 | Jump to address long
	DEC $5C			  ; C6 5C | Decrement (zero page)
	SBC $3E			  ; E5 3E | Subtract with carry (zero page)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ORA $1D0B,X		  ; 1D 0B 1D | Logical OR with accumulator (absolute,X)
	ASL $0E16			; 0E 16 0E | Arithmetic shift left (absolute)
	ASL $0425			; 0E 25 04 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $3718,Y		  ; 19 18 37 | Logical OR with accumulator (absolute,Y)
	STX $847B			; 8E 7B 84 | Store X register to absolute address
	LDY $D8			  ; A4 D8 | Load from zero page into Y register
	PLA				  ; 68 | Pull accumulator from stack
	BVC $78			  ; 50 78 | Branch if overflow clear
	ROR $7C58,X		  ; 7E 58 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A0
; Address: $F3A28D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A0:
	ROR $7EA4,X		  ; 7E A4 7E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	STY $30			  ; 84 30 | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	LDY $3CBE,X		  ; BC BE 3C | Load from absolute,X into Y register
	LDX $3C			  ; A6 3C | Load from zero page into X register
	AND $4E03,Y		  ; 39 03 4E | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A1
; Address: $F3A2A5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A1:
	ROL $1930,X		  ; 3E 30 19 | Rotate left (absolute,X)
	ASL $87			  ; 06 87 | Arithmetic shift left (zero page)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $79			  ; F0 79 | Branch if equal
	ADC ($7E,X)		  ; 61 7E | Add with carry ((zero page,X))
	SBC $7D09,Y		  ; F9 09 7D | Subtract with carry (absolute,Y)
	STA $5FAF			; 8D AF 5F | Store accumulator to absolute address
	DEC $B078,X		  ; DE 78 B0 | Decrement (absolute,X)
	ROR $601C,X		  ; 7E 1C 60 | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A2
; Address: $F3A2DB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A2:
	JSR $F0F0			; 20 F0 F0 | Jump to subroutine
	STZ $80FC,X		  ; 9E FC 80 | Store zero to absolute,X
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BMI $62			  ; 30 62 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $000F			; 0D 0F 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A3
; Address: $F3A375
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A3:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BEQ $50			  ; F0 50 | Branch if equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ROR $182F			; 6E 2F 18 | Rotate right (absolute)
	CMP $77FF,Y		  ; D9 FF 77 | Compare accumulator (absolute,Y)
	STY $4C7E			; 8C 7E 4C | Store Y register to absolute address
	SEC				  ; 38 | Set carry flag
	DEC $82FC			; CE FC 82 | Decrement (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1800			; 0E 00 18 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $7E			  ; 10 7E | Branch if positive
	BVC $FE			  ; 50 FE | Branch if overflow clear
	LDY $FE			  ; A4 FE | Load from zero page into Y register
	CPY $F8FE			; CC FE F8 | Compare Y register (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A4
; Address: $F3A415
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A4:
	JSR $847C			; 20 7C 84 | Jump to subroutine
	BIT #$3C			 ; 89 3C | Test bits in accumulator (immediate)
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	ASL $0004,X		  ; 1E 04 00 | Arithmetic shift left (absolute,X)
	BRA $98			  ; 80 98 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	DEC $0000			; CE 00 00 | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A6
; Address: $F3A44D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A6:
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $7807,X		  ; 1D 07 78 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A7
; Address: $F3A4A8
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A7:
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ROL $787F,X		  ; 3E 7F 78 | Rotate left (absolute,X)
	ADC $00FF,X		  ; 7D FF 00 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	STY $07			  ; 84 07 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BVC $70			  ; 50 70 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	CPY $1C			  ; C4 1C | Compare Y register (zero page)
	SBC ($0D),Y		  ; F1 0D | Subtract with carry ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $80			  ; 70 80 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	STA				  ; 9F 9F 00 10 | Store accumulator to absolute long,X
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0A9
; Address: $F3A4FD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0A9:
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	NOP				  ; EA | No operation
	INX				  ; E8 | Increment X register
	INC $FFC8,X		  ; FE C8 FF | Increment (absolute,X)
	ASL $1E10			; 0E 10 1E | Arithmetic shift left (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $1E12			; 0E 12 1E | Arithmetic shift left (absolute)
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	BMI $1E			  ; 30 1E | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AA
; Address: $F3A51F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AA:
	JSR $CFF5			; 20 F5 CF | Jump to subroutine
	CMP $5CE7,Y		  ; D9 E7 5C | Compare accumulator (absolute,Y)
	ORA $86E3,X		  ; 1D E3 86 | Logical OR with accumulator (absolute,X)
	ADC ($A7),Y		  ; 71 A7 | Add with carry ((zero page),Y)
	BVC $E9			  ; 50 E9 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AB
; Address: $F3A531
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AB:
	JSR $3006			; 20 06 30 | Jump to subroutine
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	ORA ($B4,X)		  ; 01 B4 | Logical OR with accumulator ((zero page,X))
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $83			  ; 80 83 | Branch always
	ORA $C7			  ; 05 C7 | Logical OR with accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AC
; Address: $F3A54C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AC:
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STZ $01			  ; 64 01 | Store zero to zero page
	JMP $830801		  ; 5C 01 08 83 | Jump to address long
	INC $D1A7			; EE A7 D1 | Increment (absolute)
	ASL $18E6			; 0E E6 18 | Arithmetic shift left (absolute)
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	BMI $90			  ; 30 90 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AD
; Address: $F3A56E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AD:
	JSR $4220			; 20 20 42 | Hardware register operation
	ASL $318F,X		  ; 1E 8F 31 | Arithmetic shift left (absolute,X)
	ASL $3866,X		  ; 1E 66 38 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $190B			; 0D 0B 19 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $1618			; 0E 18 16 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	STX $07			  ; 86 07 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	ORA $0D03			; 0D 03 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $190B			; 0D 0B 19 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FAFB,X		  ; FE FB FA | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AE
; Address: $F3A5E4
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AE:
	SBC $FAFF,X		  ; FD FF FA | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SEP #$FF			 ; E2 FF | Set processor status bits
	SEP #$FF			 ; E2 FF | Set processor status bits
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $1C03,Y		  ; 19 03 1C | Logical OR with accumulator (absolute,Y)
	SBC $FE03,X		  ; FD 03 FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	SBC $60			  ; E5 60 | Subtract with carry (zero page)
	STA $EA7F			; 8D 7F EA | Store accumulator to absolute address
	LDX $C041,Y		  ; BE 41 C0 | Load from absolute,Y into X register
	BRA $00			  ; 80 00 | Branch always
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ORA $0A80,X		  ; 1D 80 0A | Logical OR with accumulator (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BVC $EE			  ; 50 EE | Branch if overflow clear
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	STX $62			  ; 86 62 | Store X register to zero page
	CPY $18			  ; C4 18 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	AND $F21E,Y		  ; 39 1E F2 | Logical AND with accumulator (absolute,Y)
	CPX $78			  ; E4 78 | Compare X register (zero page)
	DEY				  ; 88 | Decrement Y register
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

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0AF
; Address: $F3A67A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0AF:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 9F 2E 0F | Load from absolute long,X into accumulator
	ROL $240F			; 2E 0F 24 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B1
; Address: $F3A68D
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B1:
	JSR $2037			; 20 37 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $51			  ; F0 51 | Branch if equal
	BEQ $D1			  ; F0 D1 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	PLB				  ; AB | Pull data bank register from stack
	INC $5529,X		  ; FE 29 55 | Increment (absolute,X)
	INC $FF64,X		  ; FE 64 FF | Increment (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $7E			  ; E5 7E | Subtract with carry (zero page)
	BCS $7F			  ; B0 7F | Branch if carry set
	BPL $7F			  ; 10 7F | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $A11C,X		  ; 7D 1C A1 | Add with carry (absolute,X)
	ASL $90			  ; 06 90 | Arithmetic shift left (zero page)
	ASL $0490			; 0E 90 04 | Arithmetic shift left (absolute)
	STA ($02),Y		  ; 91 02 | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPX $F600			; EC 00 F6 | Compare X register (absolute)
	PLX				  ; FA | Pull X register from stack
	LDA $5F03,X		  ; BD 03 5F | Load from absolute,X into accumulator
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	AND ($D7,X)		  ; 21 D7 | Logical AND with accumulator ((zero page,X))
	BMI $6A			  ; 30 6A | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP #$9C			 ; C9 9C | Compare accumulator (immediate)
	DEC $F500			; CE 00 F5 | Decrement (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $36			  ; 80 36 | Branch always
	BRA $1A			  ; 80 1A | Branch always
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	ROL $BD80,X		  ; 3E 80 BD | Rotate left (absolute,X)
	BRA $9F			  ; 80 9F | Branch always
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	ADC ($AE,X)		  ; 61 AE | Add with carry ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B2
; Address: $F3A6FB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B2:
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	LDA ($0E),Y		  ; B1 0E | Load from (zero page),Y into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B3
; Address: $F3A701
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B3:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	AND #$21			 ; 29 21 | PPU graphics register access
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B4
; Address: $F3A72B
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B4:
	JSR $2028			; 20 28 20 | Jump to subroutine
	BIT $1820			; 2C 20 18 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BIT $303C			; 2C 3C 30 | Test bits in accumulator (absolute)
	BMI $3E			  ; 30 3E | Branch if negative
	AND ($C2,X)		  ; 21 C2 | Logical AND with accumulator ((zero page,X))
	REP #$FF			 ; C2 FF | Reset processor status bits
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STA $85F3			; 8D F3 85 | Store accumulator to absolute address
	ASL $CC71			; 0E 71 CC | Arithmetic shift left (absolute)
	AND $3C03,Y		  ; 39 03 3C | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BRA $7E			  ; 80 7E | Branch always
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	AND ($21),Y		  ; 31 21 | PPU graphics register access
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	BVC $40			  ; 50 40 | Branch if overflow clear
	BNE $80			  ; D0 80 | Branch if not equal
	BIT #$80			 ; 89 80 | Test bits in accumulator (immediate)
	BIT #$80			 ; 89 80 | Test bits in accumulator (immediate)
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B5
; Address: $F3A773
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B5:
	JSR $243E			; 20 3E 24 | Jump to subroutine
	ROR $7F4C,X		  ; 7E 4C 7F | Rotate right (absolute,X)
	JMP $A6FF			; 4C FF A6 | Jump to address
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	BRA $E5			  ; 80 E5 | Branch always
	REP #$FF			 ; C2 FF | Reset processor status bits
	CMP $FB			  ; C5 FB | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B6
; Address: $F3A786
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B6:
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ROL $3C81,X		  ; 3E 81 3C | Rotate left (absolute,X)
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B7
; Address: $F3A7A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B7:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B8
; Address: $F3A7B7
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B8:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BVS $10			  ; 70 10 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ROR $AD38,X		  ; 7E 38 AD | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ADC $3630,Y		  ; 79 30 36 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0B9
; Address: $F3A80B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0B9:
	JSR $464F			; 20 4F 46 | Jump to subroutine
	ADC $0349,Y		  ; 79 49 03 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BMI $3F			  ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BA
; Address: $F3A81B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BA:
	JSR $467F			; 20 7F 46 | Jump to subroutine
	ADC $7749,Y		  ; 79 49 77 | Add with carry (absolute,Y)
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	REP #$C7			 ; C2 C7 | Reset processor status bits
	REP #$C7			 ; C2 C7 | Reset processor status bits
	DEC $CC82			; CE 82 CC | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BB
; Address: $F3A82F
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BB:
	STY $FF			  ; 84 FF | Store Y register to zero page
	BIT $2CFF			; 2C FF 2C | Test bits in accumulator (absolute)
	JMP $FFD2FF		  ; 5C FF D2 FF | Jump to address long
	INC $FC82,X		  ; FE 82 FC | Increment (absolute,X)
	STY $4D			  ; 84 4D | Store Y register to zero page
	ROL $3F92,X		  ; 3E 92 3F | Rotate left (absolute,X)
	LDY $1F			  ; A4 1F | Load from zero page into Y register
	PHX				  ; DA | Push X register to stack
	SBC $F603			; ED 03 F6 | Subtract with carry (absolute)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BVS $6F			  ; 70 6F | Branch if overflow set
	STZ $8760,X		  ; 9E 60 87 | Store zero to absolute,X
	ADC ($C3),Y		  ; 71 C3 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	DEC $47AB			; CE AB 47 | Decrement (absolute)
	STA $3CE7,Y		  ; 99 E7 3C | Store accumulator to absolute,Y
	EOR $D6E2,X		  ; 5D E2 D6 | Exclusive OR with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	CPY $E619			; CC 19 E6 | Compare Y register (absolute)
	ORA $9C00,Y		  ; 19 00 9C | Logical OR with accumulator (absolute,Y)
	BRA $0E			  ; 80 0E | Branch always
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY $683C			; CC 3C 68 | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	STY $BC			  ; 84 BC | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	ROR $FFF1			; 6E F1 FF | Rotate right (absolute)
	CMP $6B3B,X		  ; DD 3B 6B | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $2600			; 0E 00 26 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BC
; Address: $F3A8DB
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BC:
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BIT $6624			; 2C 24 66 | Test bits in accumulator (absolute)
	ROR $DC44			; 6E 44 DC | Rotate right (absolute)
	STY $DC			  ; 84 DC | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $D8			  ; 10 D8 | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	AND $7F			  ; 25 7F | Logical AND with accumulator (zero page)
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	INC				  ; 1A | Increment accumulator
	SBC $1B			  ; E5 1B | Subtract with carry (zero page)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	INC $18			  ; E6 18 | Increment (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $898D			; 0E 8D 89 | Arithmetic shift left (absolute)
	CMP $7889			; CD 89 78 | Compare accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LDA $FF08,X		  ; BD 08 FF | Load from absolute,X into accumulator
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BIT #$7F			 ; 89 7F | Test bits in accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BD
; Address: $F3A957
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BD:
	DEC				  ; 3A | Decrement accumulator
	ROL $CAFF			; 2E FF CA | Rotate left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BE
; Address: $F3A981
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BE:
	JSR $F828			; 20 28 F8 | Jump to subroutine
	CPY $3C			  ; C4 3C | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $FE03,X		  ; FD 03 FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	INC $7F80,X		  ; FE 80 7F | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCS $50			  ; B0 50 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0BF
; Address: $F3A9C4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0BF:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA $061E,Y		  ; 19 1E 06 | Logical OR with accumulator (absolute,Y)
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $0707,Y		  ; 19 07 07 | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	LDX $B906,Y		  ; BE 06 B9 | Load from absolute,Y into X register
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C0
; Address: $F3A9E9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C0:
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ASL $2060,X		  ; 1E 60 20 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C1
; Address: $F3A9EF
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C1:
	JSR $88F8			; 20 F8 88 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	INC $FF06,X		  ; FE 06 FF | Increment (absolute,X)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	ASL $A0E0,X		  ; 1E E0 A0 | Arithmetic shift left (absolute,X)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	BVS $7C			  ; 70 7C | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ADC ($4E),Y		  ; 71 4E | Add with carry ((zero page),Y)
	BPL $7F			  ; 10 7F | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	STZ $6D80,X		  ; 9E 80 6D | Store zero to absolute,X
	WDM #$3F			 ; 42 3F | Reserved instruction
	BMI $0F			  ; 30 0F | Branch if negative
	JMP $1A13			; 4C 13 1A | Jump to address
	ORA $AF			  ; 05 AF | Logical OR with accumulator (zero page)
	ADC ($ED,X)		  ; 61 ED | Add with carry ((zero page,X))
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA				  ; 9F 80 FD 80 | Store accumulator to absolute long,X
	BNE $37			  ; D0 37 | Branch if not equal
	CMP $25			  ; C5 25 | Compare accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	LDX $5C			  ; A6 5C | Load from zero page into X register
	INC $0004,X		  ; FE 04 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	CPY $00			  ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C2
; Address: $F3AA7B
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C2:
	CPX $40			  ; E4 40 | Compare X register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	AND $0D38,X		  ; 3D 38 0D | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $7B			  ; 10 7B | Branch if positive
	ADC ($93,X)		  ; 61 93 | Add with carry ((zero page,X))
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $7F			  ; 10 7F | Branch if positive
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	STA $60FF,Y		  ; 99 FF 60 | Store accumulator to absolute,Y
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	STY $F608			; 8C 08 F6 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C3
; Address: $F3AAD3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C3:
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STY $0C0E			; 8C 0E 0C | Store Y register to absolute address
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ADC $BF18,X		  ; 7D 18 BF | Add with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP $7988			; CD 88 79 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C5
; Address: $F3AB0B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C5:
	JSR $2828			; 20 28 28 | Jump to subroutine
	EOR $FF48,X		  ; 5D 48 FF | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	BRA $FF			  ; 80 FF | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BCS $8F			  ; B0 8F | Branch if carry set
	STA $C040C0		  ; 8F C0 40 C0 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BCS $8F			  ; B0 8F | Branch if carry set
	STA $C040C0		  ; 8F C0 40 C0 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C6
; Address: $F3AB4F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C6:
	JSR $1FE0			; 20 E0 1F | Jump to subroutine
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C7
; Address: $F3AB5F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C7:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BCC $70			  ; 90 70 | Branch if carry clear
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	REP #$3E			 ; C2 3E | Reset processor status bits
	INX				  ; E8 | Increment X register
	SBC $4012			; ED 12 40 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $30			  ; 80 30 | Branch always
	BRA $28			  ; 80 28 | Branch always
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C8
; Address: $F3AB88
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C8:
	JSL $FD09BE		  ; 22 BE 09 FD | Jump to subroutine long
	LDA ($FD,X)		  ; A1 FD | Load from (zero page,X) into accumulator
	LDA $0000,Y		  ; B9 00 00 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0C9
; Address: $F3AB98
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0C9:
	ROL				  ; 2A | Rotate left (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	ORA $A3			  ; 05 A3 | Logical OR with accumulator (zero page)
	ORA $7907			; 0D 07 79 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $040789		  ; 8F 89 07 04 | Store accumulator to absolute long address
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $9D			  ; A4 9D | Load from zero page into Y register
	STA $040708		  ; 8F 08 07 04 | Store accumulator to absolute long address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $43			  ; F0 43 | Branch if equal
	LDY $9EA4,X		  ; BC A4 9E | Load from absolute,X into Y register
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$E0C0		   ; F4 C0 E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CA
; Address: $F3AC5E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CA:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ADC ($27,X)		  ; 61 27 | Add with carry ((zero page,X))
	AND ($36,X)		  ; 21 36 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CB
; Address: $F3AC65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CB:
	JSL $160816		  ; 22 16 08 16 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC #$3F			 ; 69 3F | Add with carry (immediate)
	AND #$3E			 ; 29 3E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CC
; Address: $F3AC75
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CC:
	JSL $0C0C0C		  ; 22 0C 0C 0C | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CD
; Address: $F3ACA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CD:
	JSL $020225		  ; 22 25 02 02 | Jump to subroutine long
	BNE $20			  ; D0 20 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CE
; Address: $F3ACD0
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CE:
	JSR $0020			; 20 20 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ROL $7F80,X		  ; 3E 80 7F | Rotate left (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ROL $F206,X		  ; 3E 06 F2 | Rotate left (absolute,X)
	ASL $3CC2			; 0E C2 3C | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL $3EF2			; 0E F2 3E | Arithmetic shift left (absolute)
	REP #$FC			 ; C2 FC | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	STY $8CB8			; 8C B8 8C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0CF
; Address: $F3AD4C
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0CF:
	LDY $CC			  ; A4 CC | Load from zero page into Y register
	STZ $CE			  ; 64 CE | Store zero to zero page
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	LDY $B400			; AC 00 B4 | Load from absolute address into Y register
	PHY				  ; 5A | Push Y register to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	SBC ($E5,X)		  ; E1 E5 | Subtract with carry ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDX $00			  ; A6 00 | Load from zero page into X register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BMI $38			  ; 30 38 | Branch if negative
	BMI $18			  ; 30 18 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	SEC				  ; 38 | Set carry flag
	AND $0018,X		  ; 3D 18 00 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D0
; Address: $F3ADD1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D0:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6400)		  ; 6C 00 64 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D2
; Address: $F3ADE3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D2:
	JSR $2030			; 20 30 20 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BMI $38			  ; 30 38 | Branch if negative
	BMI $18			  ; 30 18 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D4
; Address: $F3ADF1
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D4:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6C00)		  ; 6C 00 6C | Jump to address (absolute indirect)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3F11,Y		  ; 19 11 3F | Logical OR with accumulator (absolute,Y)
	STA $D3B9C7		  ; 8F C7 B9 D3 | Store accumulator to absolute long address
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $2E00,Y		  ; 19 00 2E | Logical OR with accumulator (absolute,Y)
	BPL $D0			  ; 10 D0 | Branch if positive
	BRA $7C			  ; 80 7C | Branch always
	BRA $7E			  ; 80 7E | Branch always
	STX $6E			  ; 86 6E | Store X register to zero page
	LSR $63BF			; 4E BF 63 | Logical shift right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D5
; Address: $F3AE44
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D5:
	ROL $7C			  ; 26 7C | Rotate left (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA $7E			  ; 05 7E | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D6
; Address: $F3AE51
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D6:
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ROR $A9			  ; 66 A9 | Rotate right (zero page)
	ROR $F4			  ; 66 F4 | Rotate right (zero page)
	CMP #$33			 ; C9 33 | Compare accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	STA $3FBE,X		  ; 9D BE 3F | Store accumulator to absolute,X
	AND $00C3			; 2D C3 00 | Logical AND with accumulator (absolute)
	LDA $DF00,X		  ; BD 00 DF | Load from absolute,X into accumulator
	INC $E700,X		  ; FE 00 E7 | Increment (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX $08			  ; E4 08 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0D9
; Address: $F3AE8B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0D9:
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0DB
; Address: $F3AE8F
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0DB:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $31			  ; 90 31 | Branch if carry clear
	BMI $08			  ; 30 08 | Branch if negative
	ROL $1F01,X		  ; 3E 01 1F | Rotate left (absolute,X)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ORA $3E			  ; 05 3E | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ASL $0F01,X		  ; 1E 01 0F | Arithmetic shift left (absolute,X)
	ASL $0401			; 0E 01 04 | Arithmetic shift left (absolute)
	LDA $63			  ; A5 63 | Load from zero page into accumulator
	LDY $5C73			; AC 73 5C | Load from absolute address into Y register
	CPY $33			  ; C4 33 | Compare Y register (zero page)
	LDA				  ; BF 3E 9B 07 | Load from absolute long,X into accumulator
	AND $00C3			; 2D C3 00 | Logical AND with accumulator (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX $08			  ; E4 08 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	BPL $98			  ; 10 98 | Branch if positive
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0DC
; Address: $F3AEEE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0DC:
	BVS $40			  ; 70 40 | Branch if overflow set
	BPL $C0			  ; 10 C0 | Branch if positive
	BMI $40			  ; 30 40 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0DD
; Address: $F3AEF4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0DD:
	JSR $0840			; 20 40 08 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	INX				  ; E8 | Increment X register
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $10			  ; 80 10 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0DE
; Address: $F3AF0A
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0DE:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0702			; 0E 02 07 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC #$1C			 ; 69 1C | Add with carry (immediate)
	ADC $448E,Y		  ; 79 8E 44 | Add with carry (absolute,Y)
	LDY $865C,X		  ; BC 5C 86 | Load from absolute,X into Y register
	INC $0082			; EE 82 00 | Increment (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BRA $67			  ; 80 67 | Branch always
	BRA $43			  ; 80 43 | Branch always
	BRA $63			  ; 80 63 | Branch always
	DEY				  ; 88 | Decrement Y register
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0704			; 0E 04 07 | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7B18,X		  ; 3D 18 7B | Logical AND with accumulator (absolute,X)
	STZ $9CE9			; 9C E9 9C | Store zero to absolute
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 86 F9 5B | Load from absolute long,X into accumulator
	LDY $BCFF,X		  ; BC FF BC | Load from absolute,X into Y register
	STZ $00			  ; 64 00 | Store zero to zero page
	AND $80			  ; 25 80 | Logical AND with accumulator (zero page)
	BRA $77			  ; 80 77 | Branch always
	BRA $77			  ; 80 77 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $67			  ; 80 67 | Branch always
	BRA $43			  ; 80 43 | Branch always
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $1F9F1F		  ; 8F 1F 9F 1F | Store accumulator to absolute long address
	STA				  ; 9F 1F 97 0F | Store accumulator to absolute long,X
	STA $CFEF87		  ; 8F 87 EF CF | Store accumulator to absolute long address
	SBC $FD0F,X		  ; FD 0F FD | Subtract with carry (absolute,X)
	STA $3ECFFD		  ; 8F FD CF 3E | Store accumulator to absolute long address
	ASL $1D17,X		  ; 1E 17 1D | Arithmetic shift left (absolute,X)
	ASL $0C02,X		  ; 1E 02 0C | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0203			; 0E 03 02 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0DF
; Address: $F3AFE0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0DF:
	LDX #$4D			 ; A2 4D | Load immediate value into X register
	BMI $3D			  ; 30 3D | Branch if negative
	ASL $0F10,X		  ; 1E 10 0F | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $1FFE,X		  ; 3D FE 1F | Logical AND with accumulator (absolute,X)
	SBC $4C80,X		  ; FD 80 4C | Subtract with carry (absolute,X)
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	STZ $7E00			; 9C 00 7E | Store zero to absolute
	STY $FE7D			; 8C 7D FE | Store Y register to absolute address
	ORA $95FE			; 0D FE 95 | Logical OR with accumulator (absolute)
	DEC $A4FE			; CE FE A4 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E0
; Address: $F3B010
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E0:
	JSR $00B0			; 20 B0 00 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	ASL $071E			; 0E 1E 07 | Arithmetic shift left (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $0601			; 0E 01 06 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0701			; 0E 01 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	REP #$2D			 ; C2 2D | Reset processor status bits
	BPL $3B			  ; 10 3B | Branch if positive
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	CMP $6F8F			; CD 8F 6F | Compare accumulator (absolute)
	SBC $2CC0,X		  ; FD C0 2C | Subtract with carry (absolute,X)
	CPY #$27			 ; C0 27 | Compare Y register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	INC $FF1E,X		  ; FE 1E FF | Increment (absolute,X)
	STA $C04F7F		  ; 8F 7F 4F C0 | Store accumulator to absolute long address
	BMI $40			  ; 30 40 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E1
; Address: $F3B066
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E1:
	SED				  ; F8 | Set decimal mode flag
	BEQ $34			  ; F0 34 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STZ $D870			; 9C 70 D8 | Store zero to absolute
	BMI $E8			  ; 30 E8 | Branch if negative
	BPL $30			  ; 10 30 | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	LDY $8800,X		  ; BC 00 88 | Load from absolute,X into Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E3
; Address: $F3B07D
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E3:
	JSR $90C0			; 20 C0 90 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY $1031			; AC 31 10 | Load from absolute address into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $879B,Y		  ; 19 9B 87 | Logical OR with accumulator (absolute,Y)
	AND #$27			 ; 29 27 | Logical AND with accumulator (immediate)
	AND $CC			  ; 25 CC | Logical AND with accumulator (zero page)
	AND $6FC0,X		  ; 3D C0 6F | Logical AND with accumulator (absolute,X)
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	BEQ $8C			  ; F0 8C | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	ROL $263C			; 2E 3C 26 | Rotate left (absolute)
	STZ $2E86			; 9C 86 2E | Store zero to absolute
	BIT $10B1			; 2C B1 10 | Test bits in accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STZ $5C53			; 9C 53 5C | Store zero to absolute
	DEC				  ; 3A | Decrement accumulator
	AND $3D			  ; 25 3D | Logical AND with accumulator (zero page)
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ADC $3DCC,Y		  ; 79 CC 3D | Add with carry (absolute,Y)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	CPX #$97			 ; E0 97 | Compare X register (immediate)
	BVS $5F			  ; 70 5F | Branch if overflow set
	BMI $2F			  ; 30 2F | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0B17,X		  ; 1D 17 0B | Logical OR with accumulator (absolute,X)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $1F27,X		  ; 3E 27 1F | Rotate left (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $A0			  ; E4 A0 | Compare X register (zero page)
	BEQ $D0			  ; F0 D0 | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E4
; Address: $F3B124
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E4:
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BMI $D0			  ; 30 D0 | Branch if negative
	BCS $F0			  ; B0 F0 | Branch if carry set
	BCC $F0			  ; 90 F0 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $0F13,Y		  ; 19 13 0F | Logical OR with accumulator (absolute,Y)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $1E2F,X		  ; 3E 2F 1E | Rotate left (absolute,X)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E5
; Address: $F3B173
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E5:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F17,X		  ; 1E 17 1F | Arithmetic shift left (absolute,X)
	ASL $0E13,X		  ; 1E 13 0E | Arithmetic shift left (absolute,X)
	ASL $0609			; 0E 09 06 | Arithmetic shift left (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E6
; Address: $F3B19E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E6:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0F17,X		  ; 1D 17 0F | Logical OR with accumulator (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $060A			; 0E 0A 06 | Arithmetic shift left (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ROL $003F,X		  ; 3E 3F 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CPY $8C84			; CC 84 8C | Compare Y register (absolute)
	STY $98			  ; 84 98 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STY $8C04			; 8C 04 8C | Store Y register to absolute address
	DEC $DB8A,X		  ; DE 8A DB | Decrement (absolute,X)
	AND #$78			 ; 29 78 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STY $FC			  ; 84 FC | Store Y register to zero page
	STY $F8			  ; 84 F8 | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $FC			  ; 64 FC | Store zero to zero page
	STZ $FE			  ; 64 FE | Store zero to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E8
; Address: $F3B23B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E8:
	JSR $5000			; 20 00 50 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	SEP #$1E			 ; E2 1E | Set processor status bits
	PEA #$F80E		   ; F4 0E F8 | Push effective address to stack
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$06			 ; C0 06 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0E9
; Address: $F3B259
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0E9:
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	ADC $7EFF,X		  ; 7D FF 7E | Add with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $FAFF,X		  ; FD FF FA | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $03FF,X		  ; FD FF 03 | Subtract with carry (absolute,X)
	CPY $07			  ; C4 07 | Compare Y register (zero page)
	BRA $03			  ; 80 03 | Branch always
	STA $03			  ; 85 03 | Store accumulator to zero page
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	EOR $5722,X		  ; 5D 22 57 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0EE
; Address: $F3B2E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0EE:
	JSR $2030			; 20 30 20 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BMI $10			  ; 30 10 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0EF
; Address: $F3B2F3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0EF:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6400)		  ; 6C 00 64 | Jump to address (absolute indirect)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BPL $AF			  ; 10 AF | Branch if positive
	BCC $7F			  ; 90 7F | Branch if carry clear
	LDY $C61C,X		  ; BC 1C C6 | Load from absolute,X into Y register
	STX $0382			; 8E 82 03 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F0
; Address: $F3B32B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F0:
	SBC $B3D3			; ED D3 B3 | Subtract with carry (absolute)
	BRA $7C			  ; 80 7C | Branch always
	BRA $43			  ; 80 43 | Branch always
	BRA $63			  ; 80 63 | Branch always
	DEY				  ; 88 | Decrement Y register
	ADC $7C8C,Y		  ; 79 8C 7C | Add with carry (absolute,Y)
	BRA $6C			  ; 80 6C | Branch always
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	PLY				  ; 7A | Pull Y register from stack
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	DEX				  ; CA | Decrement X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F1
; Address: $F3B378
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F1:
	JSR $2800			; 20 00 28 | Jump to subroutine
	BRA $2A			  ; 80 2A | Branch always
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	LDA $070301		  ; AF 01 03 07 | Load from absolute long address into accumulator
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BMI $20			  ; 30 20 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	ASL $3F16,X		  ; 1E 16 3F | Arithmetic shift left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BEQ $EF			  ; F0 EF | Branch if equal
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	BRA $BF			  ; 80 BF | Branch always
	BRA $03			  ; 80 03 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F2
; Address: $F3B3E0
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F2:
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	STY $8C84			; 8C 84 8C | Store Y register to absolute address
	STY $DC			  ; 84 DC | Store Y register to zero page
	STY $D8			  ; 84 D8 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	STY $7804			; 8C 04 78 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	STY $FC			  ; 84 FC | Store Y register to zero page
	STY $FC			  ; 84 FC | Store Y register to zero page
	STY $F8			  ; 84 F8 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$1C			 ; 29 1C | Logical AND with accumulator (immediate)
	LDA #$9C			 ; A9 9C | Load immediate value into accumulator
	LDY $861C,X		  ; BC 1C 86 | Load from absolute,X into Y register
	LDX $02C2			; AE C2 02 | Load from absolute address into X register
	CPX $90F0			; EC F0 90 | Compare X register (absolute)
	SBC $0099			; ED 99 00 | Subtract with carry (absolute)
	BRA $77			  ; 80 77 | Branch always
	BRA $43			  ; 80 43 | Branch always
	BRA $63			  ; 80 63 | Branch always
	DEY				  ; 88 | Decrement Y register
	ADC $7D8C,Y		  ; 79 8C 7D | Add with carry (absolute,Y)
	BRA $6F			  ; 80 6F | Branch always
	CPX #$16			 ; E0 16 | Compare X register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $870F,X		  ; 9D 0F 87 | Store accumulator to absolute,X
	STA $C6EF			; 8D EF C6 | Store accumulator to absolute address
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $8EFE			; 0E FE 8E | Arithmetic shift left (absolute)
	INC $3FCF,X		  ; FE CF 3F | Increment (absolute,X)
	ASL $F417,X		  ; 1E 17 F4 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F3
; Address: $F3B491
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F3:
	PEA #$7F80		   ; F4 80 7F | Push effective address to stack
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	PLB				  ; AB | Pull data bank register from stack
	SBC ($86),Y		  ; F1 86 | Subtract with carry ((zero page),Y)
	STY $78			  ; 84 78 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA $E21E,Y		  ; 19 1E E2 | Logical OR with accumulator (absolute,Y)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F4
; Address: $F3B4F7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F4:
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $8E04			; 8C 04 8E | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	DEC $DA08,X		  ; DE 08 DA | Decrement (absolute,X)
	BIT $DE			  ; 24 DE | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F6
; Address: $F3B54E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F6:
	JSR $FC00			; 20 00 FC | Jump to subroutine
	STZ $FC			  ; 64 FC | Store zero to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0F9
; Address: $F3B562
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0F9:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	CPX #$5C			 ; E0 5C | Compare X register (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $4C7C			; 8C 7C 4C | Store Y register to absolute address
	ROL $1E2E,X		  ; 3E 2E 1E | Rotate left (absolute,X)
	ORA $0B17,X		  ; 1D 17 0B | Logical OR with accumulator (absolute,X)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F17,X		  ; 1E 17 0F | Arithmetic shift left (absolute,X)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA #$63			 ; A9 63 | Load immediate value into accumulator
	STA				  ; 9F D3 B6 00 | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BIT $5E80			; 2C 80 5E | Test bits in accumulator (absolute)
	STX $7E			  ; 86 7E | Store X register to zero page
	STX $6F			  ; 86 6F | Store X register to zero page
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $0C0F			; 0E 0F 0C | Arithmetic shift left (absolute)
	BPL $39			  ; 10 39 | Branch if positive
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $0C0F			; 0E 0F 0C | Arithmetic shift left (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	AND ($36,X)		  ; 21 36 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	CPY $0C9F			; CC 9F 0C | Compare Y register (absolute)
	INC				  ; 1A | Increment accumulator
	LDA $CC29,Y		  ; B9 29 CC | Load from absolute,Y into accumulator
	BRA $7A			  ; 80 7A | Branch always
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	CPY $0CFF			; CC FF 0C | Compare Y register (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $F829,Y		  ; F9 29 F8 | Subtract with carry (absolute,Y)
	BRA $7C			  ; 80 7C | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BVS $0F			  ; 70 0F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0FA
; Address: $F3B65B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0FA:
	BRA $7F			  ; 80 7F | Branch always
	BVS $0F			  ; 70 0F | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0FC
; Address: $F3B66D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0FC:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0FD
; Address: $F3B679
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0FD:
	JSR $283E			; 20 3E 28 | Jump to subroutine
	ROR $7F58,X		  ; 7E 58 7F | Rotate right (absolute,X)
	JMP $0B171D		  ; 5C 1D 17 0B | Jump to address long
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E17,X		  ; 1E 17 0E | Arithmetic shift left (absolute,X)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BEQ $10			  ; F0 10 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDX $B952,Y		  ; BE 52 B9 | Load from absolute,Y into X register
	LDX $40			  ; A6 40 | Load from zero page into X register
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	CPY $72FE			; CC FE 72 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 1F 9F 1F | Store accumulator to absolute long,X
	STA $2F474F		  ; 8F 4F 47 2F | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0FE
; Address: $F3B711
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0FE:
	LDA				  ; BF EF 5F FF | Load from absolute long,X into accumulator
	SBC $7D8F,X		  ; FD 8F 7D | Subtract with carry (absolute,X)
	AND $3E0F,X		  ; 3D 0F 3E | Logical AND with accumulator (absolute,X)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $13			  ; 10 13 | Branch if positive
	BMI $21			  ; 30 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_0FF
; Address: $F3B72E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_0FF:
	JSR $0021			; 20 21 00 | Jump to subroutine
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $3E29,X		  ; 3E 29 3E | Rotate left (absolute,X)
	AND $0030			; 2D 30 00 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_100
; Address: $F3B783
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_100:
	RTI				  ; 40 | Return from interrupt
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	AND $1D20,Y		  ; 39 20 1D | Logical AND with accumulator (absolute,Y)
	BPL $0C			  ; 10 0C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $447F			; 4C 7F 44 | Jump to address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_101
; Address: $F3B795
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_101:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F17,X		  ; 1E 17 1F | Arithmetic shift left (absolute,X)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_102
; Address: $F3B7E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_102:
	JSR $1013			; 20 13 10 | Jump to subroutine
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	AND ($31,X)		  ; 21 31 | Logical AND with accumulator ((zero page,X))
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	AND $243F			; 2D 3F 24 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_103
; Address: $F3B7F5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_103:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $11			  ; 10 11 | Branch if positive
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $3F17,X		  ; 1E 17 3F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_104
; Address: $F3B83F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_104:
	JSL $BAFFDA		  ; 22 DA FF BA | Jump to subroutine long
	LDA $3AFF,X		  ; BD FF 3A | Load from absolute,X into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9A7F,X		  ; 9D 7F 9A | Store accumulator to absolute,X
	EOR $033F,Y		  ; 59 3F 03 | Exclusive OR with accumulator (absolute,Y)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	CPX $07			  ; E4 07 | Compare X register (zero page)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_106
; Address: $F3B88F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_106:
	JSL $000200		  ; 22 00 02 00 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0708			; 0D 08 07 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	NOP				  ; EA | No operation
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_107
; Address: $F3B8BD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_107:
	BRA $07			  ; 80 07 | Branch always
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	CPY #$85			 ; C0 85 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_108
; Address: $F3B8D7
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_108:
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR #$3F			 ; 49 3F | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $1FA8,X		  ; 3D A8 1F | Logical AND with accumulator (absolute,X)
	LDA ($1F,X)		  ; A1 1F | Load from (zero page,X) into accumulator
	REP #$1D			 ; C2 1D | Reset processor status bits
	BNE $0F			  ; D0 0F | Branch if not equal
	CPX $FF03			; EC 03 FF | Compare X register (absolute)
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	STA ($74,X)		  ; 81 74 | Store accumulator to (zero page,X)
	STA ($7C,X)		  ; 81 7C | Store accumulator to (zero page,X)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $183F			; 0E 3F 18 | Arithmetic shift left (absolute)
	AND $7AFF,X		  ; 3D FF 7A | Logical AND with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	EOR $03FF,X		  ; 5D FF 03 | Exclusive OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	ADC ($03),Y		  ; 71 03 | Add with carry ((zero page),Y)
	CPX $07			  ; E4 07 | Compare X register (zero page)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	STY $07			  ; 84 07 | Store Y register to zero page
	LDY #$21			 ; A0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_10A
; Address: $F3B945
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_10A:
	JSR $1013			; 20 13 10 | Jump to subroutine
	BPL $33			  ; 10 33 | Branch if positive
	AND ($31,X)		  ; 21 31 | Logical AND with accumulator ((zero page,X))
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ASL $1F11,X		  ; 1E 11 1F | Arithmetic shift left (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	ORA $B2			  ; 05 B2 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_10B
; Address: $F3B965
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_10B:
	PLY				  ; 7A | Pull Y register from stack
	BPL $7F			  ; 10 7F | Branch if positive
	STA $3A			  ; 85 3A | Store accumulator to zero page
	BRA $3F			  ; 80 3F | Branch always
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SBC $E802			; ED 02 E8 | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BMI $30			  ; 30 30 | Branch if negative
	JMP $48485C		  ; 5C 5C 48 48 | Jump to address long
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STZ $64			  ; 64 64 | Store zero to zero page
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP $C5			  ; C5 C5 | Compare accumulator (zero page)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	STZ $009E,X		  ; 9E 9E 00 | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STZ $C702,X		  ; 9E 02 C7 | Store zero to absolute,X
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_10D
; Address: $F3B9E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_10D:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_10E
; Address: $F3B9F7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_10E:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ROR $F820,X		  ; 7E 20 F8 | Rotate right (absolute,X)
	BVS $FC			  ; 70 FC | Branch if overflow set
	BEQ $F0			  ; F0 F0 | Branch if equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_10F
; Address: $F3BA03
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_10F:
	INX				  ; E8 | Increment X register
	BIT $082C			; 2C 2C 08 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STZ $0C00			; 9C 00 0C | Store zero to absolute
	BIT $0800			; 2C 00 08 | Test bits in accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $1E19,Y		  ; 19 19 1E | Logical OR with accumulator (absolute,Y)
	ASL $1616,X		  ; 1E 16 16 | Arithmetic shift left (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1E08,X		  ; 1E 08 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $7070,X		  ; 3E 70 70 | Rotate left (absolute,X)
	ORA $081D,X		  ; 1D 1D 08 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_111
; Address: $F3BA4C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_111:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BVS $E0			  ; 70 E0 | Game work RAM access
	SBC $F8F0,X		  ; FD F0 F8 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $1F00,X		  ; FE 00 1F | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $E6			  ; E6 E6 | Increment (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	CPY $44CC			; CC CC 44 | Compare Y register (absolute)
	JMP $004C			; 4C 4C 00 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INC $9E0C,X		  ; FE 0C 9E | Increment (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $AF			  ; 06 AF | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $071E,X		  ; 1E 1E 07 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_112
; Address: $F3BAD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_112:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0700,X		  ; 1E 00 07 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_113
; Address: $F3BAE8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_113:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $10			  ; 30 10 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_114
; Address: $F3BAF9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_114:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_116
; Address: $F3BB02
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_116:
	JSR $1820			; 20 20 18 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BVC $50			  ; 50 50 | Branch if overflow clear
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ORA $0C7F,Y		  ; 19 7F 0C | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BCC $F9			  ; 90 F9 | Branch if carry clear
	BEQ $FC			  ; F0 FC | Branch if equal
	INX				  ; E8 | Increment X register
	INC $FEC8,X		  ; FE C8 FE | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BMI $7A			  ; 30 7A | Branch if negative
	BEQ $11			  ; F0 11 | Branch if equal
	ORA ($28),Y		  ; 11 28 | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_117
; Address: $F3BB5A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_117:
	JSR $03F7			; 20 F7 03 | Jump to subroutine
	ORA $0F19,Y		  ; 19 19 0F | Logical OR with accumulator (absolute,Y)
	ASL $800E			; 0E 0E 80 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_119
; Address: $F3BB6E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_119:
	ROL $F83E,X		  ; 3E 3E F8 | Rotate left (absolute,X)
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_11A
; Address: $F3BB76
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_11A:
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	STA				  ; 9F FF C1 FF | Store accumulator to absolute long,X
	BVS $70			  ; 70 70 | Branch if overflow set
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	INC $E6			  ; E6 E6 | Increment (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	INC $FE88,X		  ; FE 88 FE | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $CBEE			; EE EE CB | Increment (absolute)
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	STZ $64			  ; 64 64 | Store zero to zero page
	ASL $0C1E,X		  ; 1E 1E 0C | Arithmetic shift left (absolute,X)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	ASL $CF			  ; 06 CF | Arithmetic shift left (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $1F1E,X		  ; 1E 1E 1F | Arithmetic shift left (absolute,X)
	STA $06068F		  ; 8F 8F 06 06 | Store accumulator to absolute long address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC $FEFF,Y		  ; F9 FF FE | Subtract with carry (absolute,Y)
	AND $3B39,Y		  ; 39 39 3B | Logical AND with accumulator (absolute,Y)
	INC $E6			  ; E6 E6 | Increment (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	EOR $D959,Y		  ; 59 59 D9 | Exclusive OR with accumulator (absolute,Y)
	CMP $FFC6,Y		  ; D9 C6 FF | Compare accumulator (absolute,Y)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $FC48,X		  ; FE 48 FC | Increment (absolute,X)
	STY $FE			  ; 84 FE | Store Y register to zero page
	STY $FE			  ; 84 FE | Store Y register to zero page
	STX $DF			  ; 86 DF | Store X register to zero page
	ASL $DF			  ; 06 DF | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_11B
; Address: $F3BC11
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_11B:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_11D
; Address: $F3BC2E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_11D:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_11E
; Address: $F3BC3B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_11E:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STY $84			  ; 84 84 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank66_DmaFunction_120
; Address: $F3BC87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_120:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_121
; Address: $F3BC95
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_121:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $1F19,Y		  ; 19 19 1F | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $1F00,Y		  ; 19 00 1F | Logical OR with accumulator (absolute,Y)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_123
; Address: $F3BCCA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_123:
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_124
; Address: $F3BCDB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_124:
	BEQ $80			  ; F0 80 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BRA $C8			  ; 80 C8 | Branch always
	AND $0039,Y		  ; 39 39 00 | Logical AND with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_125
; Address: $F3BCF3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_125:
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $11CD			; CD CD 11 | Compare accumulator (absolute)
	ORA ($93),Y		  ; 11 93 | Logical OR with accumulator ((zero page),Y)
	CPX $3BEC			; EC EC 3B | Compare X register (absolute)
	ASL $0C1F			; 0E 1F 0C | Arithmetic shift left (absolute)
	STA				  ; 9F 00 FF 10 | Store accumulator to absolute long,X
	STZ $989C			; 9C 9C 98 | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_127
; Address: $F3BD2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_127:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STZ $9800			; 9C 00 98 | Store zero to absolute
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_128
; Address: $F3BD3B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_128:
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12A
; Address: $F3BD62
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12A:
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SBC $71F9,Y		  ; F9 F9 71 | Subtract with carry (absolute,Y)
	ADC ($05),Y		  ; 71 05 | Add with carry ((zero page),Y)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $E6			  ; E6 E6 | Increment (zero page)
	STA				  ; 9F FF 3E FF | Store accumulator to absolute long,X
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STX $FAFF			; 8E FF FA | Store X register to absolute address
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $91			  ; E6 91 | Increment (zero page)
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	STA ($93),Y		  ; 91 93 | Store accumulator to (zero page),Y
	ROR $7C7E,X		  ; 7E 7E 7C | Rotate right (absolute,X)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	BRA $80			  ; 80 80 | Branch always
	ASL $0E9F			; 0E 9F 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12B
; Address: $F3BD93
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12B:
	STA				  ; 9F 0C 9F 08 | Store accumulator to absolute long,X
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12C
; Address: $F3BDEA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12C:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $18			  ; 30 18 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12D
; Address: $F3BDFB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12D:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $070E			; 0E 0E 07 | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12E
; Address: $F3BE60
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12E:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $70			  ; 30 70 | Branch if negative
	BVS $E0			  ; 70 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_12F
; Address: $F3BE8C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_12F:
	ROL $303E,X		  ; 3E 3E 30 | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ROL $3000,X		  ; 3E 00 30 | Rotate left (absolute,X)
	SBC $07FD,X		  ; FD FD 07 | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	SBC $0700,X		  ; FD 00 07 | Subtract with carry (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $387F			; 0E 7F 38 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	STX $86			  ; 86 86 | Store X register to zero page
	WDM #$42			 ; 42 42 | Hardware register operation
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEP #$E2			 ; E2 E2 | Set processor status bits
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	STX $00			  ; 86 00 | Store X register to zero page
	WDM #$00			 ; 42 00 | Reserved instruction
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEP #$80			 ; E2 80 | Set processor status bits
	BRA $C1			  ; 80 C1 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_133
; Address: $F3BEF7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_133:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_135
; Address: $F3BF04
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_135:
	ORA $100D			; 0D 0D 10 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ORA $1000			; 0D 00 10 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SBC $87FD,X		  ; FD FD 87 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_136
; Address: $F3BF24
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_136:
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BRA $80			  ; 80 80 | Branch always
	SBC $FF78,X		  ; FD 78 FF | Subtract with carry (absolute,X)
	ASL $03FF			; 0E FF 03 | Arithmetic shift left (absolute)
	AND $7FFF,Y		  ; 39 FF 7F | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	REP #$C2			 ; C2 C2 | Reset processor status bits
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	STZ $4E04,X		  ; 9E 04 4E | Store zero to absolute,X
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	BRA $C3			  ; 80 C3 | Branch always
	BRA $C1			  ; 80 C1 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_138
; Address: $F3BF9D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_138:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_141
; Address: $F3BFFD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_141:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CMP $C5			  ; C5 C5 | Compare accumulator (zero page)
	STA $8B8B8F		  ; 8F 8F 8B 8B | Store accumulator to absolute long address
	JMP ($006C)		  ; 6C 6C 00 | Jump to address (absolute indirect)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	STA $048F04		  ; 8F 04 8F 04 | Store accumulator to absolute long address
	LDA $FEBD,X		  ; BD BD FE | Load from absolute,X into accumulator
	INC $F1F1,X		  ; FE F1 F1 | Increment (absolute,X)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_143
; Address: $F3C02A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_143:
	JSR $9120			; 20 20 91 | Jump to subroutine
	STA ($80),Y		  ; 91 80 | Store accumulator to (zero page),Y
	BRA $42			  ; 80 42 | Hardware register operation
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_144
; Address: $F3C03B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_144:
	JSR $9100			; 20 00 91 | Jump to subroutine
	BRA $B1			  ; 80 B1 | Branch always
	LDA ($BB),Y		  ; B1 BB | Load from (zero page),Y into accumulator
	STA				  ; 9F 9F 0D 0D | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 00 0D 00 | Store accumulator to absolute long,X
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_146
; Address: $F3C066
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_146:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	JMP $BB4C			; 4C 4C BB | Jump to address
	ORA $340D			; 0D 0D 34 | Logical OR with accumulator (absolute)
	BMI $7C			  ; 30 7C | Branch if negative
	BPL $3F			  ; 10 3F | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_147
; Address: $F3C0A4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_147:
	ROL $7F3E,X		  ; 3E 3E 7F | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$E8			 ; C0 E8 | Compare Y register (immediate)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	INC $E6			  ; E6 E6 | Increment (zero page)
	PEA #$3BF4		   ; F4 F4 3B | Push effective address to stack
	STA				  ; 9F 9F 4C 4C | Store accumulator to absolute long,X
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	ORA $0BFF,Y		  ; 19 FF 0B | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F 80 CC 00 | Store accumulator to absolute long,X
	DEC $40			  ; C6 40 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_14B
; Address: $F3C0E6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_14B:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STA $85			  ; 85 85 | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STZ $64			  ; 64 64 | Store zero to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $00			  ; 85 00 | Store accumulator to zero page
	ASL $1E04			; 0E 04 1E | Arithmetic shift left (absolute)
	BPL $74			  ; 10 74 | Branch if positive
	LDA				  ; BF BF C1 C1 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_14C
; Address: $F3C127
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_14C:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $049C			; 9C 9C 04 | Store zero to absolute
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $040D			; 0D 0D 04 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STZ $0C08			; 9C 08 0C | Store zero to absolute
	ORA $0D04			; 0D 04 0D | Logical OR with accumulator (absolute)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_150
; Address: $F3C166
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_150:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_152
; Address: $F3C177
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_152:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($73),Y		  ; 11 73 | Logical OR with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_153
; Address: $F3C1A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_153:
	RTI				  ; 40 | Return from interrupt
	CMP ($D1),Y		  ; D1 D1 | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_154
; Address: $F3C1B2
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_154:
	JSR $08F1			; 20 F1 08 | Jump to subroutine
	INC $2800,X		  ; FE 00 28 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY $94CC			; CC CC 94 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $9C08			; CC 08 9C | Compare Y register (absolute)
	BPL $F8			  ; 10 F8 | Branch if positive
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $7F			  ; 10 7F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $C17E,X		  ; 7E 7E C1 | Rotate right (absolute,X)
	CMP ($E7,X)		  ; C1 E7 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ROL $18FF,X		  ; 3E FF 18 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	STA $8B8B8F		  ; 8F 8F 8B 8B | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_155
; Address: $F3C226
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_155:
	JSL $F2F222		  ; 22 22 F2 F2 | Jump to subroutine long
	INC $E6			  ; E6 E6 | Increment (zero page)
	CPY $3CCC			; CC CC 3C | Compare Y register (absolute)
	STA $048F04		  ; 8F 04 8F 04 | Store accumulator to absolute long address
	ROL $FE0C			; 2E 0C FE | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	INC $FC30,X		  ; FE 30 FC | Increment (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_156
; Address: $F3C244
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_156:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_158
; Address: $F3C264
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_158:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_159
; Address: $F3C275
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_159:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SEP #$E2			 ; E2 E2 | Set processor status bits
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_15A
; Address: $F3C28A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_15A:
	JSR $1820			; 20 20 18 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_15B
; Address: $F3C29B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_15B:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $3118,X		  ; 1E 18 31 | Arithmetic shift left (absolute,X)
	BMI $3E			  ; 30 3E | Branch if negative
	ROL $3133,X		  ; 3E 33 31 | Rotate left (absolute,X)
	ROR $2B20			; 6E 20 2B | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $2E			  ; 10 2E | Branch if positive
	BPL $6F			  ; 10 6F | Branch if positive
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_15C
; Address: $F3C2FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_15C:
	JSR $005F			; 20 5F 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_15E
; Address: $F3C30F
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_15E:
	STX $00			  ; 86 00 | Store X register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ASL $6100,X		  ; 1E 00 61 | Arithmetic shift left (absolute,X)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	EOR $7E			  ; 45 7E | Exclusive OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $3670,X		  ; 7D 70 36 | Add with carry (absolute,X)
	AND ($19),Y		  ; 31 19 | Logical AND with accumulator ((zero page),Y)
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9F 70 | Load from absolute long,X into accumulator
	STA $184F30		  ; 8F 30 4F 18 | Store accumulator to absolute long address
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_15F
; Address: $F3C383
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_15F:
	PHP				  ; 08 | Push processor status to stack
	BRA $90			  ; 80 90 | Branch always
	BRA $20			  ; 80 20 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_161
; Address: $F3C38D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_161:
	JSR $4000			; 20 00 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $40			  ; 90 40 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank66_DmaFunction_162
; Address: $F3C3AF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_162:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_163
; Address: $F3C3BF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_163:
	JSR $0402			; 20 02 04 | Jump to subroutine
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_164
; Address: $F3C3E5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_164:
	JSR $2080			; 20 80 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_165
; Address: $F3C3EB
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_165:
	JSR $2040			; 20 40 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_166
; Address: $F3C421
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_166:
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_167
; Address: $F3C43F
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_167:
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $0A0F,X		  ; 1D 0F 0A | Logical OR with accumulator (absolute,X)
	ASL $151F			; 0E 1F 15 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	DEC $BB			  ; C6 BB | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	AND $5400,Y		  ; 39 00 54 | Logical AND with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	BNE $7C			  ; D0 7C | Branch if not equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_168
; Address: $F3C494
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_168:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	LDY $8B00			; AC 00 8B | Load from absolute address into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_169
; Address: $F3C4C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_169:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_16B
; Address: $F3C4D1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_16B:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $20			  ; 80 20 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_16C
; Address: $F3C504
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_16C:
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_16E
; Address: $F3C545
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_16E:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	LDA				  ; BF ED 4F AD | Load from absolute long,X into accumulator
	CMP $DB81			; CD 81 DB | Compare accumulator (absolute)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	CPX #$1D			 ; E0 1D | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_16F
; Address: $F3C597
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_16F:
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	ROL $2F00,X		  ; 3E 00 2F | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BVS $9C			  ; 70 9C | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	INC $00C7,X		  ; FE C7 00 | Increment (absolute,X)
	ASL $8B00,X		  ; 1E 00 8B | Arithmetic shift left (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	DEC $D6			  ; C6 D6 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	INC $C7FE,X		  ; FE FE C7 | Increment (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	DEC $83			  ; C6 83 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	ASL $5F01			; 0E 01 5F | Arithmetic shift left (absolute)
	STY $1EBF			; 8C BF 1E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_170
; Address: $F3C5EA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_170:
	JSL $D8CAF0		  ; 22 F0 CA D8 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDX $00			  ; A6 00 | Load from zero page into X register
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	STY $0F00			; 8C 00 0F | Store Y register to absolute address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_171
; Address: $F3C609
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_171:
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PEA #$EC00		   ; F4 00 EC | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	ROR $920C			; 6E 0C 92 | Rotate right (absolute)
	BPL $7C			  ; 10 7C | Branch if positive
	ADC $3938,Y		  ; 79 38 39 | Add with carry (absolute,Y)
	ASL $0C0D			; 0E 0D 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_173
; Address: $F3C635
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_173:
	STA				  ; 9F 38 47 0C | Store accumulator to absolute long,X
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $60			  ; 80 60 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_174
; Address: $F3C643
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_174:
	BCC $B1			  ; 90 B1 | Branch if carry clear
	ASL $C003			; 0E 03 C0 | Arithmetic shift left (absolute)
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	EOR ($23,X)		  ; 41 23 | Exclusive OR with accumulator ((zero page,X))
	STA ($43,X)		  ; 81 43 | Store accumulator to (zero page,X)
	STA ($43,X)		  ; 81 43 | Store accumulator to (zero page,X)
	EOR ($DF,X)		  ; 41 DF | Exclusive OR with accumulator ((zero page,X))
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FFF7,X		  ; FE F7 FF | Increment (absolute,X)
	SBC $4CFF,Y		  ; F9 FF 4C | Subtract with carry (absolute,Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $01FF,X		  ; FE FF 01 | Increment (absolute,X)
	AND $83FF,Y		  ; 39 FF 83 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $C600,X		  ; FE 00 C6 | Increment (absolute,X)
	JMP ($3200)		  ; 6C 00 32 | Jump to address (absolute indirect)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FEBF,X		  ; 7E BF FE | Rotate right (absolute,X)
	INC $DCFF,X		  ; FE FF DC | Increment (absolute,X)
	STZ $38FF			; 9C FF 38 | Store zero to absolute
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_175
; Address: $F3C6F0
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_175:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $8000			; EE 00 80 | Increment (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $0604			; 0D 04 06 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BNE $40			  ; D0 40 | Branch if not equal
	BNE $C0			  ; D0 C0 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_176
; Address: $F3C74F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_176:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	BEQ $F4			  ; F0 F4 | Branch if equal
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BPL $A8			  ; 10 A8 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $88			  ; 70 88 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_177
; Address: $F3C798
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_177:
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BRA $7C			  ; 80 7C | Branch always
	INC $0703,X		  ; FE 03 07 | Increment (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $22			  ; 80 22 | Branch always
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROL $00FF,X		  ; 3E FF 00 | Rotate left (absolute,X)
	BEQ $9F			  ; F0 9F | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_178
; Address: $F3C800
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_178:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	REP #$00			 ; C2 00 | Reset processor status bits
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROL $0FF3,X		  ; 3E F3 0F | Rotate left (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LDX $C500,Y		  ; BE 00 C5 | Load from absolute,Y into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $4C			  ; 10 4C | Branch if positive
	LDY #$1A			 ; A0 1A | Load immediate value into Y register
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0A3C,X		  ; 1E 3C 0A | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_179
; Address: $F3C895
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_179:
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	ROL $1E00,X		  ; 3E 00 1E | Rotate left (absolute,X)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	REP #$70			 ; C2 70 | Reset processor status bits
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_17A
; Address: $F3C8C5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_17A:
	JSL $1EE11A		  ; 22 1A E1 1E | Jump to subroutine long
	AND $0D1E,Y		  ; 39 1E 0D | Logical AND with accumulator (absolute,Y)
	ASL $0607			; 0E 07 06 | Arithmetic shift left (absolute)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_17B
; Address: $F3C90E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_17B:
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($B1,X)		  ; 61 B1 | Add with carry ((zero page,X))
	STX $4E			  ; 86 4E | Store X register to zero page
	EOR $FEEF,Y		  ; 59 EF FE | Exclusive OR with accumulator (absolute,Y)
	LSR $B700			; 4E 00 B7 | Logical shift right (absolute)
	ASL $51			  ; 06 51 | Arithmetic shift left (zero page)
	EOR ($F8,X)		  ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_17C
; Address: $F3C966
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_17C:
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	JMP $8E7E			; 4C 7E 8E | Jump to address
	STA				  ; 9F 3E E3 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_17E
; Address: $F3C9AA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_17E:
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	STX $9E00			; 8E 00 9E | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_17F
; Address: $F3C9E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_17F:
	JSR $E0C0			; 20 C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_180
; Address: $F3C9F2
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_180:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	SBC $BF			  ; E5 BF | Subtract with carry (zero page)
	SBC $BF			  ; E5 BF | Subtract with carry (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LSR $1300			; 4E 00 13 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $38			  ; F0 38 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY $E838			; CC 38 E8 | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_181
; Address: $F3CA58
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_181:
	BCS $00			  ; B0 00 | Branch if carry set
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ASL $FCFB,X		  ; 1E FB FC | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_182
; Address: $F3CA8C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_182:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SBC $9900,Y		  ; F9 00 99 | Subtract with carry (absolute,Y)
	REP #$00			 ; C2 00 | Reset processor status bits
	STY $6D8B			; 8C 8B 6D | Store Y register to absolute address
	SBC $29FE,X		  ; FD FE 29 | Subtract with carry (absolute,X)
	JMP ($DEFE)		  ; 6C FE DE | Jump to address (absolute indirect)
	STA $A7FF,Y		  ; 99 FF A7 | Store accumulator to absolute,Y
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_183
; Address: $F3CABA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_183:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BCS $58			  ; B0 58 | Branch if carry set
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BEQ $70			  ; F0 70 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_184
; Address: $F3CAD8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_184:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ROL $2243,X		  ; 3E 43 22 | Rotate left (absolute,X)
	ROR $20			  ; 66 20 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0900,Y		  ; 19 00 09 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STZ $3FF9,X		  ; 9E F9 3F | Store zero to absolute,X
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_185
; Address: $F3CB66
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_185:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND $3800,Y		  ; 39 00 38 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	DEC $CEFF			; CE FF CE | Decrement (absolute)
	SBC ($1E),Y		  ; F1 1E | Subtract with carry ((zero page),Y)
	CPY #$21			 ; C0 21 | PPU graphics register access
	AND ($B5),Y		  ; 31 B5 | Logical AND with accumulator ((zero page),Y)
	ADC $7F			  ; 65 7F | Add with carry (zero page)
	ADC $7F			  ; 65 7F | Add with carry (zero page)
	RTI				  ; 40 | Return from interrupt
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	DEC $7B00,X		  ; DE 00 7B | Decrement (absolute,X)
	AND ($E1),Y		  ; 31 E1 | Logical AND with accumulator ((zero page),Y)
	ADC ($E1,X)		  ; 61 E1 | Add with carry ((zero page,X))
	ADC ($A0,X)		  ; 61 A0 | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	STA $CC2F01		  ; 8F 01 2F CC | Store accumulator to absolute long address
	CPY $5CDF			; CC DF 5C | Compare Y register (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA $0E1F			; 0D 1F 0E | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_186
; Address: $F3CBFC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_186:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	INC $FC8F,X		  ; FE 8F FC | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FC1C,X		  ; FE 1C FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	STY $F800			; 8C 00 F8 | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	ROL $78F0,X		  ; 3E F0 78 | Rotate left (absolute,X)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	BRA $1F			  ; 80 1F | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3800			; 0E 00 38 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_187
; Address: $F3CC40
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_187:
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $04			  ; E4 04 | Compare X register (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $1A00,X		  ; 1E 00 1A | Arithmetic shift left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ADC $61FF,X		  ; 7D FF 61 | Add with carry (absolute,X)
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	ORA $EC00,X		  ; 1D 00 EC | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	STZ $4E00,X		  ; 9E 00 4E | Store zero to absolute,X
	ASL $F067,X		  ; 1E 67 F0 | Arithmetic shift left (absolute,X)
	BPL $F8			  ; 10 F8 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	STX $0F80			; 8E 80 0F | Store X register to absolute address
	ORA $E100,Y		  ; 19 00 E1 | Logical OR with accumulator (absolute,Y)
	STA $00E700		  ; 8F 00 E7 00 | Store accumulator to absolute long address
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $1D			  ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_188
; Address: $F3CCC7
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_188:
	ORA $7F79,X		  ; 1D 79 7F | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $F80C			; EE 0C F8 | Increment (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $1B0D			; 0E 0D 1B | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0100,Y		  ; 19 00 01 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT #$F3			 ; 89 F3 | Test bits in accumulator (immediate)
	AND $3F3F,X		  ; 3D 3F 3F | Logical AND with accumulator (absolute,X)
	LDY $6C00			; AC 00 6C | Load from absolute address into Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $3FBF			; 0E BF 3F | Arithmetic shift left (absolute)
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	DEC $DE00,X		  ; DE 00 DE | Decrement (absolute,X)
	ROR $81FF,X		  ; 7E FF 81 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STX $0E00			; 8E 00 0E | Store X register to absolute address
	ASL $1E3F,X		  ; 1E 3F 1E | Arithmetic shift left (absolute,X)
	STZ $811C			; 9C 1C 81 | Store zero to absolute
	ROR $0E00,X		  ; 7E 00 0E | Rotate right (absolute,X)
	BEQ $EA			  ; F0 EA | Branch if equal
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	LDA				  ; BF FC 7F FC | Load from absolute long,X into accumulator
	INC $00CC,X		  ; FE CC 00 | Increment (absolute,X)
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	REP #$00			 ; C2 00 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$3030		   ; F4 30 30 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_189
; Address: $F3CD67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_189:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_18A
; Address: $F3CD78
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_18A:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SBC $F3F0,Y		  ; F9 F0 F3 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_18C
; Address: $F3CDA8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_18C:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA $3300,Y		  ; 99 00 33 | Store accumulator to absolute,Y
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_18D
; Address: $F3CDCB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_18D:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_18E
; Address: $F3CDE3
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_18E:
	JSR $C020			; 20 20 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $30			  ; 70 30 | Branch if overflow set
	BEQ $B0			  ; F0 B0 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1700,X		  ; 1E 00 17 | Arithmetic shift left (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF E7 FF | Store accumulator to absolute long,X
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_18F
; Address: $F3CE72
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_18F:
	CLC				  ; 18 | Clear carry flag
	ASL $E200			; 0E 00 E2 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $E000			; 8C 00 E0 | Game work RAM access
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA				  ; 9F F0 E0 FF | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $3300,X		  ; 1E 00 33 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_190
; Address: $F3CE98
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_190:
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	AND $3C7F,X		  ; 3D 7F 3C | Logical AND with accumulator (absolute,X)
	ASL $3C7F,X		  ; 1E 7F 3C | Arithmetic shift left (absolute,X)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	STY $00			  ; 84 00 | Store Y register to zero page
	REP #$00			 ; C2 00 | Reset processor status bits
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	STA ($9D,X)		  ; 81 9D | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	ROR $6200,X		  ; 7E 00 62 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	BMI $00			  ; 30 00 | Branch if negative
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	INC $FED8,X		  ; FE D8 FE | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $FE30,X		  ; FE 30 FE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_191
; Address: $F3CEEE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_191:
	BEQ $F8			  ; F0 F8 | Branch if equal
	ADC $00			  ; 65 00 | Add with carry (zero page)
	EOR $9E00			; 4D 00 9E | Exclusive OR with accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_193
; Address: $F3CF27
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_193:
	BRA $40			  ; 80 40 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_194
; Address: $F3CF40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_194:
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	SBC $F31F,Y		  ; F9 1F F3 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_195
; Address: $F3CF49
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_195:
	STA $CC2F00		  ; 8F 00 2F CC | Store accumulator to absolute long address
	DEC $DFCC,X		  ; DE CC DF | Decrement (absolute,X)
	EOR $8A00,X		  ; 5D 00 8A | Exclusive OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	INC $00			  ; E6 00 | Increment (zero page)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BCC $70			  ; 90 70 | Branch if carry clear
	BNE $20			  ; D0 20 | Branch if not equal
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_196
; Address: $F3CF78
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_196:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $803B80		  ; 8F 80 3B 80 | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $00FE			; 8C FE 00 | Store Y register to absolute address
	DEC $02			  ; C6 02 | Decrement (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_198
; Address: $F3D034
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_198:
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $301F,X		  ; 1E 1F 30 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_199
; Address: $F3D06B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_199:
	DEC $DF7D			; CE 7D DF | Decrement (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $330E00		  ; 5C 00 0E 33 | Jump to address long
	SBC ($EA),Y		  ; F1 EA | Subtract with carry ((zero page),Y)
	SBC #$1A			 ; E9 1A | Subtract with carry (immediate)
	INC				  ; 1A | Increment accumulator
	LDA				  ; BF FC 7F FC | Load from absolute long,X into accumulator
	INC $00CD,X		  ; FE CD 00 | Increment (absolute,X)
	STA $00			  ; 85 00 | Store accumulator to zero page
	STA $00			  ; 85 00 | Store accumulator to zero page
	REP #$00			 ; C2 00 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19A
; Address: $F3D0CF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19A:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $3C			  ; 30 3C | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($DF,X)		  ; 61 DF | Add with carry ((zero page,X))
	DEC $A7			  ; C6 A7 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	LSR $0006,X		  ; 5E 06 00 | Logical shift right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $7EFC			; 8C FC 7E | Store Y register to absolute address
	INC $4E3F			; EE 3F 4E | Increment (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $641C,Y		  ; 19 1C 64 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19B
; Address: $F3D14C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19B:
	INC $BFF3			; EE F3 BF | Increment (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LSR $FFFF,X		  ; 5E FF FF | Logical shift right (absolute,X)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0E08			; 0E 08 0E | Arithmetic shift left (absolute)
	ORA $0D0E			; 0D 0E 0D | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	STA ($FC),Y		  ; 91 FC | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	AND ($1C),Y		  ; 31 1C | Logical AND with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	LDA				  ; BF 00 00 01 | Load from absolute long,X into accumulator
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	STZ $BFFD,X		  ; 9E FD BF | Store zero to absolute,X
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	ORA $0061,X		  ; 1D 61 00 | Logical OR with accumulator (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	PLX				  ; FA | Pull X register from stack
	INC $010C			; EE 0C 01 | Increment (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19C
; Address: $F3D232
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDA ($3F,X)		  ; A1 3F | Load from (zero page,X) into accumulator
	LSR $3F67,X		  ; 5E 67 3F | Logical shift right (absolute,X)
	SEP #$47			 ; E2 47 | Set processor status bits
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	ROL $7EC3,X		  ; 3E C3 7E | Rotate left (absolute,X)
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	AND ($D8,X)		  ; 21 D8 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $BF00,X		  ; 9D 00 BF | Store accumulator to absolute,X
	SEC				  ; 38 | Set carry flag
	SBC $813C,X		  ; FD 3C 81 | Subtract with carry (absolute,X)
	ROL $8200,X		  ; 3E 00 82 | Rotate left (absolute,X)
	STA				  ; 9F 0E F3 F3 | Store accumulator to absolute long,X
	SBC ($CD),Y		  ; F1 CD | Subtract with carry ((zero page),Y)
	CMP $3F3F			; CD 3F 3F | Compare accumulator (absolute)
	LDA				  ; BF EF 7F 8B | Load from absolute long,X into accumulator
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	ORA $0E00,X		  ; 1D 00 0E | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	CPX #$D2			 ; E0 D2 | Compare X register (immediate)
	CPX #$16			 ; E0 16 | Compare X register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEI				  ; 78 | Set interrupt disable flag
	ROL $B08E,X		  ; 3E 8E B0 | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	LDY $0200,X		  ; BC 00 02 | Load from absolute,X into Y register
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	JMP ($3000)		  ; 6C 00 30 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19D
; Address: $F3D2A2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19D:
	JSR $0037			; 20 37 00 | Jump to subroutine
	JMP $4F00			; 4C 00 4F | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($A3),Y		  ; B1 A3 | Load from (zero page),Y into accumulator
	ROR $17			  ; 66 17 | Rotate right (zero page)
	ROR $7F3F,X		  ; 7E 3F 7F | Rotate right (absolute,X)
	JMP $00D900		  ; 5C 00 D9 00 | Jump to address long
	INX				  ; E8 | Increment X register
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19E
; Address: $F3D2DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19E:
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BRA $E7			  ; 80 E7 | Branch always
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_19F
; Address: $F3D2F8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_19F:
	JSR $1F00			; 20 00 1F | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A0
; Address: $F3D322
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A0:
	JSR $6AC7			; 20 C7 6A | Jump to subroutine
	ADC $7EFD			; 6D FD 7E | Add with carry (absolute)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $AF5FEF		  ; 8F EF 5F AF | Store accumulator to absolute long address
	BRA $DE			  ; 80 DE | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A2
; Address: $F3D384
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A2:
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7EFD			; 6D FD 7E | Add with carry (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ADC $037F,Y		  ; 79 7F 03 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $081F			; 0D 1F 08 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A3
; Address: $F3D3DC
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A3:
	BMI $00			  ; 30 00 | Branch if negative
	ROL $80FF,X		  ; 3E FF 80 | Rotate left (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($BF,X)		  ; E1 BF | Subtract with carry ((zero page,X))
	STA				  ; 9F FF EF 7E | Store accumulator to absolute long,X
	LDY $C0FF,X		  ; BC FF C0 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	LSR $6000,X		  ; 5E 00 60 | Logical shift right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	INC $FCCF,X		  ; FE CF FC | Increment (absolute,X)
	STA				  ; 9F F9 3F F1 | Store accumulator to absolute long,X
	SBC ($20,X)		  ; E1 20 | Subtract with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PEA #$902C		   ; F4 2C 90 | Push effective address to stack
	PEA #$F408		   ; F4 08 F4 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	PEA #$F00C		   ; F4 0C F0 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	STZ $00			  ; 64 00 | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A4
; Address: $F3D445
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A4:
	BRA $00			  ; 80 00 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BVS $38			  ; 70 38 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A5
; Address: $F3D468
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A5:
	JSR $1901			; 20 01 19 | Jump to subroutine
	ROL $000E,X		  ; 3E 0E 00 | Rotate left (absolute,X)
	LDX $9B00,Y		  ; BE 00 9B | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $6600,X		  ; 1E 00 66 | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A6
; Address: $F3D480
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A6:
	PHB				  ; 8B | Push data bank register to stack
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A7
; Address: $F3D4CD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A7:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $3EFF,Y		  ; 79 FF 3E | Add with carry (absolute,Y)
	ORA $0E3E,Y		  ; 19 3E 0E | Logical OR with accumulator (absolute,Y)
	STX $00			  ; 86 00 | Store X register to zero page
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	ASL $0F0F			; 0E 0F 0F | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROR $E8FE,X		  ; 7E FE E8 | Rotate right (absolute,X)
	CPX #$30			 ; E0 30 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A8
; Address: $F3D56A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A8:
	JSR $33C0			; 20 C0 33 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1A9
; Address: $F3D574
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1A9:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY $1F00			; CC 00 1F | Compare Y register (absolute)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	CPX #$C4			 ; E0 C4 | Compare X register (immediate)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	ASL $7800,X		  ; 1E 00 78 | Arithmetic shift left (absolute,X)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1AB
; Address: $F3D5B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1AB:
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1AC
; Address: $F3D5C2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1AC:
	JSR $1C7C			; 20 7C 1C | Jump to subroutine
	ROL $1F1F,X		  ; 3E 1F 1F | Rotate left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1AD
; Address: $F3D5D6
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1AD:
	JSR $1900			; 20 00 19 | Jump to subroutine
	ORA $0600,Y		  ; 19 00 06 | Logical OR with accumulator (absolute,Y)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	WDM #$C7			 ; 42 C7 | Reserved instruction
	SBC $EF			  ; E5 EF | Subtract with carry (zero page)
	SBC $E4FC,Y		  ; F9 FC E4 | Subtract with carry (absolute,Y)
	ROR $1FF3			; 6E F3 1F | Rotate right (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STZ $9C00			; 9C 00 9C | Store zero to absolute
	ORA $2501,Y		  ; 19 01 25 | Logical OR with accumulator (absolute,Y)
	ORA $11			  ; 05 11 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0403			; 0E 03 04 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1AE
; Address: $F3D682
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1AE:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	BRA $90			  ; 80 90 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BCS $88			  ; B0 88 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1AF
; Address: $F3D68D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1AF:
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B0
; Address: $F3D693
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B0:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $32FE			; 9C FE 32 | Store zero to absolute
	ROR $537C,X		  ; 7E 7C 53 | Rotate right (absolute,X)
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	CMP $A000			; CD 00 A0 | Compare accumulator (absolute)
	ASL $0F60			; 0E 60 0F | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BMI $28			  ; 30 28 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $2A40			; 2C 40 2A | Test bits in accumulator (absolute)
	CPY #$B6			 ; C0 B6 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND $44			  ; 25 44 | Logical AND with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B2
; Address: $F3D71E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B2:
	JSR $005F			; 20 5F 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BVC $08			  ; 50 08 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B3
; Address: $F3D72C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B3:
	BCS $88			  ; B0 88 | Branch if carry set
	BRA $10			  ; 80 10 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $001F			; 0E 1F 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B4
; Address: $F3D78A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B4:
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B5
; Address: $F3D79A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B5:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $6860			; 2C 60 68 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $18			  ; 80 18 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BIT $4C			  ; 24 4C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B6
; Address: $F3D7C3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B6:
	JSL $1602A8		  ; 22 A8 02 16 | Jump to subroutine long
	LDA ($3E,X)		  ; A1 3E | Load from (zero page,X) into accumulator
	ORA $0F1E,X		  ; 1D 1E 0F | Logical OR with accumulator (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	CPX $2D			  ; E4 2D | Compare X register (zero page)
	ROL $1E4A			; 2E 4A 1E | Rotate left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B7
; Address: $F3D80C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B7:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B8
; Address: $F3D830
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B8:
	JSR $2100			; 20 00 21 | PPU graphics register access
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ASL $3C00,X		  ; 1E 00 3C | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	ADC $7B30,Y		  ; 79 30 7B | Add with carry (absolute,Y)
	BMI $1A			  ; 30 1A | Branch if negative
	BPL $02			  ; 10 02 | Branch if positive
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BMI $4F			  ; 30 4F | Branch if negative
	BPL $6F			  ; 10 6F | Branch if positive
	BPL $2B			  ; 10 2B | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1B9
; Address: $F3D861
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1B9:
	JSR $4080			; 20 80 40 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1BA
; Address: $F3D86D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1BA:
	JSL $00B505		  ; 22 05 B5 00 | Jump to subroutine long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA $3817,X		  ; 1D 17 38 | Logical OR with accumulator (absolute,X)
	LDA $78AFFF		  ; AF FF AF 78 | Load from absolute long address into accumulator
	BEQ $CE			  ; F0 CE | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1BB
; Address: $F3D89C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1BB:
	STA $002C00		  ; 8F 00 2C 00 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	PEA #$FFCF		   ; F4 CF FF | Push effective address to stack
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	STA $7FDFFF		  ; 8F FF DF 7F | Store accumulator to absolute long address
	STA				  ; 9F F8 1F 30 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1BC
; Address: $F3D8B4
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1BC:
	BMI $00			  ; 30 00 | Branch if negative
	LDX $5000			; AE 00 50 | Load from absolute address into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $B8			  ; F0 B8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	STA $0018FE		  ; 8F FE 18 00 | Store accumulator to absolute long address
	STY $4C00			; 8C 00 4C | Store Y register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVC $01			  ; 50 01 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BVS $C0			  ; 70 C0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $F0			  ; 30 F0 | Branch if negative
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $08			  ; 30 08 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0E06			; 0E 06 0E | Arithmetic shift left (absolute)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BNE $F8			  ; D0 F8 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $60			  ; F0 60 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1BE
; Address: $F3D976
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1BE:
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BCS $04			  ; B0 04 | Branch if carry set
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BRA $78			  ; 80 78 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $00			  ; 30 00 | Branch if negative
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BMI $05			  ; 30 05 | Branch if negative
	SBC $543D			; ED 3D 54 | Subtract with carry (absolute)
	AND #$33			 ; 29 33 | Logical AND with accumulator (immediate)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($4B),Y		  ; 11 4B | Logical OR with accumulator ((zero page),Y)
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	ORA #$63			 ; 09 63 | Logical OR with accumulator (immediate)
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	LSR $4C00			; 4E 00 4C | Logical shift right (absolute)
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	CMP ($69,X)		  ; C1 69 | Compare accumulator ((zero page,X))
	BNE $D9			  ; D0 D9 | Branch if not equal
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	INC $F0EF			; EE EF F0 | Increment (absolute)
	SBC $FFF8,X		  ; FD F8 FF | Subtract with carry (absolute,X)
	CPX $97FB			; EC FB 97 | Compare X register (absolute)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STY $D918			; 8C 18 D9 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1BF
; Address: $F3DA24
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1BF:
	STX $E0FE			; 8E FE E0 | Game work RAM access
	LDA $DF38,Y		  ; B9 38 DF | Load from absolute,Y into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $3E			  ; 80 3E | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $0046			; 0E 46 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C0
; Address: $F3DA38
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C0:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $E3			  ; F0 E3 | Branch if equal
	CPX #$9D			 ; E0 9D | Compare X register (immediate)
	ORA $3273,X		  ; 1D 73 32 | Logical OR with accumulator (absolute,X)
	SBC ($6A),Y		  ; F1 6A | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	DEC $3EDD,X		  ; DE DD 3E | Decrement (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	STY $0E00			; 8C 00 0E | Store Y register to absolute address
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C1
; Address: $F3DA6A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C1:
	JSR $00B0			; 20 B0 00 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $F8			  ; 80 F8 | Branch always
	CLC				  ; 18 | Clear carry flag
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $4000			; CC 00 40 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C2
; Address: $F3DA80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C2:
	JSR $0090			; 20 90 00 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C3
; Address: $F3DA87
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C3:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $04			  ; 30 04 | Branch if negative
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C4
; Address: $F3DABD
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C4:
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0E04			; 0D 04 0E | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $4468,X		  ; 1E 68 44 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PEA #$7C38		   ; F4 38 7C | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	ORA $1E1C,X		  ; 1D 1C 1E | Logical OR with accumulator (absolute,X)
	ORA $1618,Y		  ; 19 18 16 | Logical OR with accumulator (absolute,Y)
	BPL $11			  ; 10 11 | Branch if positive
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C5
; Address: $F3DB27
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C5:
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $210C,X		  ; FE 0C 21 | PPU graphics register access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C6
; Address: $F3DB68
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C6:
	BRA $E7			  ; 80 E7 | Branch always
	SED				  ; F8 | Set decimal mode flag
	JMP $3600			; 4C 00 36 | Jump to address
	SBC $07F8,Y		  ; F9 F8 07 | Subtract with carry (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $20FF,X		  ; 1E FF 20 | Arithmetic shift left (absolute,X)
	BPL $F3			  ; 10 F3 | Branch if positive
	ASL $4700			; 0E 00 47 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $1E1E,X		  ; 1E 1E 1E | Arithmetic shift left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	ASL $0FEE,X		  ; 1E EE 0F | Arithmetic shift left (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C7
; Address: $F3DC2A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C7:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C8
; Address: $F3DC3A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C8:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1C9
; Address: $F3DC4A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1C9:
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $78			  ; 70 78 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $08			  ; 70 08 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $4000			; 2C 00 40 | Test bits in accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CA
; Address: $F3DCBE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CA:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CB
; Address: $F3DD0C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CB:
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $0B04			; 0D 04 0B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CC
; Address: $F3DD40
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CC:
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CD
; Address: $F3DD4B
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CD:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND $0018,X		  ; 3D 18 00 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	LDA ($C1,X)		  ; A1 C1 | Load from (zero page,X) into accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ROR $7F7F,X		  ; 7E 7F 7F | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF 9F FC | Load from absolute long,X into accumulator
	STA				  ; 9F F8 9F F8 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CE
; Address: $F3DDCF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CE:
	SBC $0081			; ED 81 00 | Subtract with carry (absolute)
	CPY $4000			; CC 00 40 | Compare Y register (absolute)
	STA				  ; 9F FF 49 FE | Store accumulator to absolute long,X
	ADC $7EC3,X		  ; 7D C3 7E | Add with carry (absolute,X)
	STY $0C00			; 8C 00 0C | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1CF
; Address: $F3DDF6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1CF:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	NOP				  ; EA | No operation
	STA $4B00,Y		  ; 99 00 4B | Store accumulator to absolute,Y
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	ASL $C8E8			; 0E E8 C8 | Arithmetic shift left (absolute)
	CPX $20EC			; EC EC 20 | Compare X register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D0
; Address: $F3DE10
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D0:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	ROL $3700,X		  ; 3E 00 37 | Rotate left (absolute,X)
	DEC $FC00,X		  ; DE 00 FC | Decrement (absolute,X)
	AND $3D3F,Y		  ; 39 3F 3D | Logical AND with accumulator (absolute,Y)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D1
; Address: $F3DE36
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D1:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STZ $8000			; 9C 00 80 | Store zero to absolute
	STX $FF00			; 8E 00 FF | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	ROL $FFFF,X		  ; 3E FF FF | Rotate left (absolute,X)
	LDA				  ; BF D1 3F FE | Load from absolute long,X into accumulator
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROR $C100			; 6E 00 C1 | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	STY $0E00			; 8C 00 0E | Store Y register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D4
; Address: $F3DEB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D4:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	AND $3130,Y		  ; 39 30 31 | Logical AND with accumulator (absolute,Y)
	BVS $79			  ; 70 79 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D6
; Address: $F3DECA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D6:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BVS $0F			  ; 70 0F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D7
; Address: $F3DED7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D7:
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D8
; Address: $F3DEE5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D8:
	JSL $0F160C		  ; 22 0C 16 0F | Jump to subroutine long
	ORA $301E,Y		  ; 19 1E 30 | Logical OR with accumulator (absolute,Y)
	BMI $70			  ; 30 70 | Branch if negative
	BVS $02			  ; 70 02 | Branch if overflow set
	BEQ $02			  ; F0 02 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1E03,X		  ; 1E 03 1E | Arithmetic shift left (absolute,X)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	JMP $4800			; 4C 00 48 | Jump to address
	JMP $6000			; 4C 00 60 | Jump to address
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	BPL $9C			  ; 10 9C | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	LDY $F3FC,X		  ; BC FC F3 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	ASL $D700			; 0E 00 D7 | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1D9
; Address: $F3DF38
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1D9:
	STY $4300			; 8C 00 43 | Store Y register to absolute address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	DEC $E820			; CE 20 E8 | Decrement (absolute)
	LDA				  ; BF B3 7F 61 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1DB
; Address: $F3DF53
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1DB:
	JSR $C3FF			; 20 FF C3 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	JMP $9E00			; 4C 00 9E | Jump to address
	INC $003C,X		  ; FE 3C 00 | Increment (absolute,X)
	BCC $80			  ; 90 80 | Branch if carry clear
	BCS $10			  ; B0 10 | Branch if carry set
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $58			  ; 50 58 | Branch if overflow clear
	BEQ $F8			  ; F0 F8 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	BRA $A8			  ; 80 A8 | Branch always
	CLC				  ; 18 | Clear carry flag
	JMP ($AC00)		  ; 6C 00 AC | Jump to address (absolute indirect)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	DEC $DFFF,X		  ; DE FF DF | Decrement (absolute,X)
	SBC ($BF),Y		  ; F1 BF | Subtract with carry ((zero page),Y)
	LDA ($DC,X)		  ; A1 DC | Load from (zero page,X) into accumulator
	INC $EE			  ; E6 EE | Increment (zero page)
	STA ($33),Y		  ; 91 33 | Store accumulator to (zero page),Y
	LDA $FFECBC		  ; AF BC EC FF | Load from absolute long address into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $5E00			; 0E 00 5E | Arithmetic shift left (absolute)
	ORA $9E00,Y		  ; 19 00 9E | Logical OR with accumulator (absolute,Y)
	ASL $00CC			; 0E CC 00 | Arithmetic shift left (absolute)
	BEQ $1F			  ; F0 1F | Branch if equal
	EOR ($20,X)		  ; 41 20 | Exclusive OR with accumulator ((zero page,X))
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	SBC $73C0,X		  ; FD C0 73 | Subtract with carry (absolute,X)
	ADC ($BF),Y		  ; 71 BF | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	INC $7D00,X		  ; FE 00 7D | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1DD
; Address: $F3DFE0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1DD:
	SED				  ; F8 | Set decimal mode flag
	INC $FFBF,X		  ; FE BF FF | Increment (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	SEC				  ; 38 | Set carry flag
	ADC $DCCF,Y		  ; 79 CF DC | Add with carry (absolute,Y)
	LDX $07AE			; AE AE 07 | Load from absolute address into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1DE
; Address: $F3E005
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1DE:
	BRA $48			  ; 80 48 | Branch always
	BRA $58			  ; 80 58 | Branch always
	LDY $F0E0			; AC E0 F0 | Load from absolute address into Y register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1704,X		  ; 1D 04 17 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E0
; Address: $F3E049
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E0:
	JSR $2080			; 20 80 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E1
; Address: $F3E092
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E1:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E2
; Address: $F3E0B0
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E2:
	JSL $001E00		  ; 22 00 1E 00 | Jump to subroutine long
	JMP ($B6FF)		  ; 6C FF B6 | Jump to address (absolute indirect)
	BRA $3F			  ; 80 3F | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ADC $82C7,X		  ; 7D C7 82 | Add with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	DEC				  ; 3A | Decrement accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	INX				  ; E8 | Increment X register
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $B0			  ; 30 B0 | Branch if negative
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $FB			  ; F0 FB | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	LDX $C720,Y		  ; BE 20 C7 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E3
; Address: $F3E15A
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E3:
	INC $00			  ; E6 00 | Increment (zero page)
	LDX $C701,Y		  ; BE 01 C7 | Load from absolute,Y into X register
	ROL $F0F7,X		  ; 3E F7 F0 | Rotate left (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $BCFF,X		  ; 7E FF BC | Rotate right (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	INC $1F			  ; E6 1F | Increment (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	ORA $0300,Y		  ; 19 00 03 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	BMI $1E			  ; 30 1E | Branch if negative
	ORA $070E,X		  ; 1D 0E 07 | Logical OR with accumulator (absolute,X)
	BMI $4F			  ; 30 4F | Branch if negative
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E4
; Address: $F3E1E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E4:
	STZ $4634,X		  ; 9E 34 46 | Store zero to absolute,X
	ROL $0800,X		  ; 3E 00 08 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $13			  ; 70 13 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E6
; Address: $F3E204
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E6:
	JSR $467F			; 20 7F 46 | Jump to subroutine
	ADC #$DE			 ; 69 DE | Add with carry (immediate)
	AND ($7E),Y		  ; 31 7E | Logical AND with accumulator ((zero page),Y)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	AND $001F,Y		  ; 39 1F 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E7
; Address: $F3E213
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E7:
	BMI $00			  ; 30 00 | Branch if negative
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 58 8F 24 | Store accumulator to absolute long,X
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F 7C FB FF | Store accumulator to absolute long,X
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$66			 ; C0 66 | Compare Y register (immediate)
	CPY #$B9			 ; C0 B9 | Compare Y register (immediate)
	CPY #$29			 ; C0 29 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $06			  ; 80 06 | Branch always
	STX $01			  ; 86 01 | Store X register to zero page
	ORA $0007,Y		  ; 19 07 00 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BMI $7C			  ; 30 7C | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SBC $F19E			; ED 9E F1 | Subtract with carry (absolute)
	LDA ($7F),Y		  ; B1 7F | Load from (zero page),Y into accumulator
	SEC				  ; 38 | Set carry flag
	LDY $3F00,X		  ; BC 00 3F | Load from absolute,X into Y register
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1E9
; Address: $F3E2C6
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1E9:
	BPL $EF			  ; 10 EF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $1FE1,X		  ; 1E E1 1F | Arithmetic shift left (absolute,X)
	CPX $FFF3			; EC F3 FF | Compare X register (absolute)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BVC $00			  ; 50 00 | Branch if overflow clear
	INC $0700			; EE 00 07 | Increment (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	STX $FF			  ; 86 FF | Store X register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $7F			  ; 80 7F | Branch always
	DEC $3F			  ; C6 3F | Decrement (zero page)
	ADC $00BF,Y		  ; 79 BF 00 | Add with carry (absolute,Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	STX $7000			; 8E 00 70 | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ROR $3900,X		  ; 7E 00 39 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $BF41,X		  ; FE 41 BF | Increment (absolute,X)
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))
	STA $F08F78		  ; 8F 78 8F F0 | Store accumulator to absolute long address
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	STZ $8900,X		  ; 9E 00 89 | Store zero to absolute,X
	STX $7600			; 8E 00 76 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1EB
; Address: $F3E36A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1EB:
	JSR $2080			; 20 80 20 | Jump to subroutine
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1EC
; Address: $F3E37A
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1EC:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	WDM #$40			 ; 42 40 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $070E,Y		  ; 19 0E 07 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	BVS $FF			  ; 70 FF | Branch if overflow set
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	BVS $78			  ; 70 78 | Branch if overflow set
	BRA $D3			  ; 80 D3 | Branch always
	CPX #$CE			 ; E0 CE | Compare X register (immediate)
	BEQ $C1			  ; F0 C1 | Branch if equal
	INC $3C00,X		  ; FE 00 3C | Increment (absolute,X)
	STX $6E80			; 8E 80 6E | Store X register to absolute address
	ASL $1619,X		  ; 1E 19 16 | Arithmetic shift left (absolute,X)
	ROL $3C0C,X		  ; 3E 0C 3C | Rotate left (absolute,X)
	ASL $805E			; 0E 5E 80 | Arithmetic shift left (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	BMI $7C			  ; 30 7C | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	DEC $0E04			; CE 04 0E | Decrement (absolute)
	ORA $0900			; 0D 00 09 | Logical OR with accumulator (absolute)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	INY				  ; C8 | Increment Y register
	ORA $090B			; 0D 0B 09 | Logical OR with accumulator (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1ED
; Address: $F3E44E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1ED:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $0F			  ; 30 0F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDA $7000,Y		  ; B9 00 70 | Load from absolute,Y into accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	CMP ($F8,X)		  ; C1 F8 | Compare accumulator ((zero page,X))
	PEA #$D930		   ; F4 30 D9 | Push effective address to stack
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	JMP $0C00			; 4C 00 0C | Jump to address
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ROL $CC04			; 2E 04 CC | Rotate left (absolute)
	DEC $B078			; CE 78 B0 | Decrement (absolute)
	PEA #$BA40		   ; F4 40 BA | Push effective address to stack
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BPL $0F			  ; 10 0F | Branch if positive
	BIT $031F			; 2C 1F 03 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $130C			; 0D 0C 13 | Logical OR with accumulator (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	LDA				  ; BF 00 79 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	ADC ($FE,X)		  ; 61 FE | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA $C9E0,X		  ; 1D E0 C9 | Logical OR with accumulator (absolute,X)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	SBC #$F0			 ; E9 F0 | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1EE
; Address: $F3E511
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1EE:
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	ASL $D4			  ; 06 D4 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STX $8404			; 8E 04 84 | Store X register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	BEQ $80			  ; F0 80 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	BCS $30			  ; B0 30 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY $44			  ; C4 44 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F0
; Address: $F3E54C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F0:
	JSL $000002		  ; 22 02 00 00 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	ROR $3E80,X		  ; 7E 80 3E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F2
; Address: $F3E55D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F2:
	JSR $000F			; 20 0F 00 | Jump to subroutine
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	AND $3E1E,Y		  ; 39 1E 3E | Logical AND with accumulator (absolute,Y)
	AND $1B			  ; 25 1B | Logical AND with accumulator (zero page)
	AND $C712			; 2D 12 C7 | Logical AND with accumulator (absolute)
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA $1802,Y		  ; 19 02 18 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	CPY $B7			  ; C4 B7 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	LDA $77A870		  ; AF 70 A8 77 | Load from absolute long address into accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $8701,X		  ; FE 01 87 | Increment (absolute,X)
	BMI $8D			  ; 30 8D | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F3
; Address: $F3E593
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F3:
	JSR $7708			; 20 08 77 | Jump to subroutine
	BRA $68			  ; 80 68 | Branch always
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	BIT $0400			; 2C 00 04 | Test bits in accumulator (absolute)
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F4
; Address: $F3E5A6
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F4:
	SBC $F9FB,Y		  ; F9 FB F9 | Subtract with carry (absolute,Y)
	BEQ $77			  ; F0 77 | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $38			  ; 80 38 | Branch always
	SEC				  ; 38 | Set carry flag
	STX $00			  ; 86 00 | Store X register to zero page
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA $2C0E,X		  ; 1D 0E 2C | Logical OR with accumulator (absolute,X)
	CMP $03			  ; C5 03 | Compare accumulator (zero page)
	ADC $0078,Y		  ; 79 78 00 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	REP #$FE			 ; C2 FE | Reset processor status bits
	SEC				  ; 38 | Set carry flag
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	STX $30			  ; 86 30 | Store X register to zero page
	BEQ $FF			  ; F0 FF | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $F9D8,Y		  ; F9 D8 F9 | Subtract with carry (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $73B0,Y		  ; B9 B0 73 | Load from absolute,Y into accumulator
	CPY $8000			; CC 00 80 | Compare Y register (absolute)
	BRA $40			  ; 80 40 | Branch always
	STY $1E40			; 8C 40 1E | Store Y register to absolute address
	BRA $1E			  ; 80 1E | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F6
; Address: $F3E642
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F6:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ADC $86B6,Y		  ; 79 B6 86 | Add with carry (absolute,Y)
	CMP $5E39,X		  ; DD 39 5E | Compare accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	ROR $CF80,X		  ; 7E 80 CF | Rotate right (absolute,X)
	BMI $03			  ; 30 03 | Branch if negative
	CPY $0A01			; CC 01 0A | Compare Y register (absolute)
	STA				  ; 9F FF 6E 9F | Store accumulator to absolute long,X
	SBC $6B1E			; ED 1E 6B | Subtract with carry (absolute)
	STZ $DDAA			; 9C AA DD | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF BF 00 F8 | Load from absolute long,X into accumulator
	ORA $8E60,X		  ; 1D 60 8E | Logical OR with accumulator (absolute,X)
	SBC ($0C,X)		  ; E1 0C | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F7
; Address: $F3E6BA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F7:
	JSL $22805D		  ; 22 5D 80 22 | Jump to subroutine long
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY $1C3D			; CC 3D 1C | Compare Y register (absolute)
	CPX $A8FC			; EC FC A8 | Compare X register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F8
; Address: $F3E6D7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F8:
	JSR $2046			; 20 46 20 | Jump to subroutine
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	BVC $01			  ; 50 01 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1F9
; Address: $F3E700
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1F9:
	ASL $5B0E			; 0E 0E 5B | Arithmetic shift left (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INC $01			  ; E6 01 | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC $EF07,Y		  ; F9 07 EF | Subtract with carry (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BPL $EF			  ; 10 EF | Branch if positive
	CPY $00FC			; CC FC 00 | Compare Y register (absolute)
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FA
; Address: $F3E760
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FA:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FB
; Address: $F3E7A6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FB:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	STA				  ; 9F 00 1E 00 | Store accumulator to absolute long,X
	BRA $7F			  ; 80 7F | Branch always
	BRA $03			  ; 80 03 | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FC
; Address: $F3E7E7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FC:
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	ORA $7EE2,X		  ; 1D E2 7E | Logical OR with accumulator (absolute,X)
	BRA $C0			  ; 80 C0 | Branch always
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $D900			; 2D 00 D9 | Logical AND with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FD
; Address: $F3E800
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FD:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FE
; Address: $F3E826
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FE:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 4E 81 | Store accumulator to absolute long,X
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_1FF
; Address: $F3E854
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_1FF:
	BMI $81			  ; 30 81 | Branch if negative
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	AND $7FB0,Y		  ; 39 B0 7F | Logical AND with accumulator (absolute,Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	REP #$FD			 ; C2 FD | Reset processor status bits
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $21			  ; 06 21 | PPU graphics register access
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ADC $3900			; 6D 00 39 | Add with carry (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $190E			; 0E 0E 19 | Arithmetic shift left (absolute)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_200
; Address: $F3E8A6
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_200:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_202
; Address: $F3E8AD
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_202:
	JSR $1090			; 20 90 10 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	ROL $7F20,X		  ; 3E 20 7F | Rotate left (absolute,X)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ROL $90			  ; 26 90 | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BRA $38			  ; 80 38 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	STX $FF			  ; 86 FF | Store X register to zero page
	BRA $FF			  ; 80 FF | Branch always
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	DEC $3F			  ; C6 3F | Decrement (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF F8 FF 00 | Load from absolute long,X into accumulator
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	STX $7000			; 8E 00 70 | Store X register to absolute address
	ADC $7E00,Y		  ; 79 00 7E | Add with carry (absolute,Y)
	AND $B200,Y		  ; 39 00 B2 | Logical AND with accumulator (absolute,Y)
	WDM #$00			 ; 42 00 | Reserved instruction
	BCC $EF			  ; 90 EF | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	LDA $7EC7,Y		  ; B9 C7 7E | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	LDY $2E00,X		  ; BC 00 2E | Load from absolute,X into Y register
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	AND $1300,X		  ; 3D 00 13 | Logical AND with accumulator (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_204
; Address: $F3E983
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_204:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_205
; Address: $F3E9C4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_205:
	JSR $437F			; 20 7F 43 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	LDY $3F00,X		  ; BC 00 3F | Load from absolute,X into Y register
	JMP $007F20		  ; 5C 20 7F 00 | Jump to address long
	BCC $EF			  ; 90 EF | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	AND $3AC7,Y		  ; 39 C7 3A | Logical AND with accumulator (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	LDY $2E00,X		  ; BC 00 2E | Load from absolute,X into Y register
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_206
; Address: $F3EA05
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_206:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_207
; Address: $F3EA2D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_207:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_208
; Address: $F3EA46
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_208:
	JSR $437F			; 20 7F 43 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	LDY $7F00,X		  ; BC 00 7F | Load from absolute,X into Y register
	ROL $7F20,X		  ; 3E 20 7F | Rotate left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_209
; Address: $F3EA68
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_209:
	JSR $30DF			; 20 DF 30 | Jump to subroutine
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	EOR $BE00,Y		  ; 59 00 BE | Exclusive OR with accumulator (absolute,Y)
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)
	CMP $CE00			; CD 00 CE | Compare accumulator (absolute)
	CMP $0000			; CD 00 00 | Compare accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_20A
; Address: $F3EA87
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_20A:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CPY $7C3F			; CC 3F 7C | Compare Y register (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	BEQ $E1			  ; F0 E1 | Branch if equal
	INC $FF38,X		  ; FE 38 FF | Increment (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $8100,X		  ; 1E 00 81 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_20E
; Address: $F3EB0C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_20E:
	JSR $90C0			; 20 C0 90 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_210
; Address: $F3EB1F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_210:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	JMP ($7CDF)		  ; 6C DF 7C | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank66_DmaFunction_211
; Address: $F3EB51
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_211:
	STA $0100,Y		  ; 99 00 01 | Store accumulator to absolute,Y
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank66_DmaFunction_212
; Address: $F3EB5D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_212:
	STY $7E00			; 8C 00 7E | Store Y register to absolute address
	SEC				  ; 38 | Set carry flag
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPY $E800			; CC 00 E8 | Compare Y register (absolute)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_214
; Address: $F3EB8E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_214:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_215
; Address: $F3EB9E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_215:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF A3 DF 6C | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $07			  ; 10 07 | Branch if positive
	JMP ($3F17)		  ; 6C 17 3F | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_216
; Address: $F3EBD3
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_216:
	JMP $009900		  ; 5C 00 99 00 | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	JMP ($037B)		  ; 6C 7B 03 | Jump to address (absolute indirect)
	BRA $BA			  ; 80 BA | Branch always
	AND $32FE,Y		  ; 39 FE 32 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $EF			  ; F0 EF | Branch if equal
	AND $1200,Y		  ; 39 00 12 | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CPX #$0C			 ; E0 0C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_217
; Address: $F3EC00
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_217:
	JSR $A080			; 20 80 A0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_218
; Address: $F3EC0A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_218:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	AND $85C3,X		  ; 3D C3 85 | Logical AND with accumulator (absolute,X)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	LDA				  ; BF 3F C0 0F | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BIT $0441			; 2C 41 04 | Test bits in accumulator (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $E3			  ; F0 E3 | Branch if equal
	CMP $BCE3,X		  ; DD E3 BC | Compare accumulator (absolute,X)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	STX $FAFF			; 8E FF FA | Store X register to absolute address
	SBC $03FF,X		  ; FD FF 03 | Subtract with carry (absolute,X)
	INC $C21C			; EE 1C C2 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_219
; Address: $F3EC76
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_219:
	JSR $00DC			; 20 DC 00 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $88			  ; 06 88 | Arithmetic shift left (zero page)
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $E4			  ; F0 E4 | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_21A
; Address: $F3EC85
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_21A:
	SED				  ; F8 | Set decimal mode flag
	CPX $E8			  ; E4 E8 | Compare X register (zero page)
	CPX $E8			  ; E4 E8 | Compare X register (zero page)
	CPX $E8			  ; E4 E8 | Compare X register (zero page)
	CPY $D8			  ; C4 D8 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_21C
; Address: $F3EC94
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_21C:
	JSR $7008			; 20 08 70 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_21D
; Address: $F3EC9D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_21D:
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ROL $271F			; 2E 1F 27 | Rotate left (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0601			; 0E 01 06 | Arithmetic shift left (absolute)
	CMP $9EE3,X		  ; DD E3 9E | Compare accumulator (absolute,X)
	SBC ($C2,X)		  ; E1 C2 | Subtract with carry ((zero page,X))
	SBC $FFF8,X		  ; FD F8 FF | Subtract with carry (absolute,X)
	LDA				  ; BF 00 FE 00 | Load from absolute long,X into accumulator
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_21E
; Address: $F3ECD9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_21E:
	JSR $1D02			; 20 02 1D | Jump to subroutine
	BRA $7F			  ; 80 7F | Branch always
	CMP $BCE3,X		  ; DD E3 BC | Compare accumulator (absolute,X)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	STA $FEFFFF		  ; 8F FF FF FE | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	CPX $C214			; EC 14 C2 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_220
; Address: $F3ECFD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_220:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCC $E0			  ; 90 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	BEQ $C4			  ; F0 C4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$F2F8		   ; F4 F8 F2 | Push effective address to stack
	PEA #$F4F2		   ; F4 F2 F4 | Push effective address to stack
	PEA #$EC62		   ; F4 62 EC | Push effective address to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_221
; Address: $F3ED11
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_221:
	JSR $2000			; 20 00 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BMI $8C			  ; 30 8C | Branch if negative
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	LSR $003F			; 4E 3F 00 | Logical shift right (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_222
; Address: $F3ED38
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_222:
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	CMP $9EE3,X		  ; DD E3 9E | Compare accumulator (absolute,X)
	SBC ($C2,X)		  ; E1 C2 | Subtract with carry ((zero page,X))
	SBC $7E00,X		  ; FD 00 7E | Subtract with carry (absolute,X)
	INC $7B00,X		  ; FE 00 7B | Increment (absolute,X)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_223
; Address: $F3ED5D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_223:
	JSR $1D02			; 20 02 1D | Jump to subroutine
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	CMP $BCE3,X		  ; DD E3 BC | Compare accumulator (absolute,X)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_225
; Address: $F3ED7E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_225:
	JSR $205C			; 20 5C 20 | Jump to subroutine
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$F8FA		   ; F4 FA F8 | Push effective address to stack
	SBC $91FA,Y		  ; F9 FA 91 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_227
; Address: $F3ED93
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_227:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	ROL $FCFF,X		  ; 3E FF FC | Rotate left (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	LDY #$E0			 ; A0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_228
; Address: $F3EE24
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_228:
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA				  ; BF C0 8F F0 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	INC				  ; 1A | Increment accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_229
; Address: $F3EEA4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_229:
	JSR $181F			; 20 1F 18 | Jump to subroutine
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_22A
; Address: $F3EEB3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_22A:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 3F C0 0F | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $09			  ; 80 09 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	STX $F1FF			; 8E FF F1 | Store X register to absolute address
	INC $03FD,X		  ; FE FD 03 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank66_DmaFunction_22B
; Address: $F3EEF1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_22B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LSR $9E00			; 4E 00 9E | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_22D
; Address: $F3EF2A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_22D:
	JSR $407C			; 20 7C 40 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_22E
; Address: $F3EF46
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_22E:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	BMI $CF			  ; 30 CF | Branch if negative
	ROL $00			  ; 26 00 | Rotate left (zero page)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	LDX $BC00,Y		  ; BE 00 BC | Load from absolute,Y into X register
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_22F
; Address: $F3EF6D
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_22F:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $85C3,X		  ; 3D C3 85 | Logical AND with accumulator (absolute,X)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	LDA				  ; BF BF C0 EF | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BIT $0441			; 2C 41 04 | Test bits in accumulator (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BNE $00			  ; D0 00 | Branch if not equal
	AND $FF38,Y		  ; 39 38 FF | Logical AND with accumulator (absolute,Y)
	ROL $00DF,X		  ; 3E DF 00 | Rotate left (absolute,X)
	AND $C600,Y		  ; 39 00 C6 | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	EOR $0000			; 4D 00 00 | Exclusive OR with accumulator (absolute)
	INC $FF3E,X		  ; FE 3E FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BMI $FF			  ; 30 FF | Branch if negative
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_230
; Address: $F3F01B
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_230:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
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
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $07			  ; 70 07 | Branch if overflow set
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	AND ($58,X)		  ; 21 58 | Logical AND with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	TSX				  ; BA | Transfer stack pointer to X register
	ADC $7AC6,X		  ; 7D C6 7A | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $7B			  ; 80 7B | Branch always
	DEC $CD00			; CE 00 CD | Decrement (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank66_DmaFunction_231
; Address: $F3F080
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_231:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_232
; Address: $F3F08C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_232:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7F30,Y		  ; 39 30 7F | Logical AND with accumulator (absolute,Y)
	LDX $DF			  ; A6 DF | Load from zero page into X register
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_233
; Address: $F3F0D5
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_233:
	AND $4600,Y		  ; 39 00 46 | Logical AND with accumulator (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $0900,X		  ; 5D 00 09 | Exclusive OR with accumulator (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ROL $FF20,X		  ; 3E 20 FF | Rotate left (absolute,X)
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	STZ $0500,X		  ; 9E 00 05 | Store zero to absolute,X
	DEC				  ; 3A | Decrement accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA				  ; BF C0 EF F0 | Load from absolute long,X into accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_234
; Address: $F3F1A6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_234:
	JSR $131F			; 20 1F 13 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ROL $007F,X		  ; 3E 7F 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LSR $FF30,X		  ; 5E 30 FF | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_235
; Address: $F3F1C2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_235:
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SEP #$EC			 ; E2 EC | Set processor status bits
	BEQ $61			  ; F0 61 | Branch if equal
	INC $FF7E,X		  ; FE 7E FF | Increment (absolute,X)
	DEC $6E00			; CE 00 6E | Decrement (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BRA $01			  ; 80 01 | Branch always
	BMI $C0			  ; 30 C0 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_237
; Address: $F3F1EA
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_237:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	EOR $003F,X		  ; 5D 3F 00 | Exclusive OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	AND $F3D6			; 2D D6 F3 | Logical AND with accumulator (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CMP $9EE3,X		  ; DD E3 9E | Compare accumulator (absolute,X)
	SBC ($2C,X)		  ; E1 2C | Subtract with carry ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	INC $7B00,X		  ; FE 00 7B | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_238
; Address: $F3F23D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_238:
	JSR $201E			; 20 1E 20 | Jump to subroutine
	CPY $23			  ; C4 23 | Compare Y register (zero page)
	BCC $8F			  ; 90 8F | Branch if carry clear
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	CMP $BCE3,X		  ; DD E3 BC | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_239
; Address: $F3F251
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_239:
	JSL $000EE0		  ; 22 E0 0E 00 | Jump to subroutine long
	LDY $2000,X		  ; BC 00 20 | Load from absolute,X into Y register
	BMI $00			  ; 30 00 | Branch if negative
	CPY $0214			; CC 14 02 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_23B
; Address: $F3F267
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_23B:
	SED				  ; F8 | Set decimal mode flag
	PEA #$F8FA		   ; F4 FA F8 | Push effective address to stack
	SBC $C1FA,Y		  ; F9 FA C1 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_23F
; Address: $F3F27F
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_23F:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ROL $E2FF,X		  ; 3E FF E2 | Rotate left (absolute,X)
	CMP $9EE3,X		  ; DD E3 9E | Compare accumulator (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	DEC $6200,X		  ; DE 00 62 | Decrement (absolute,X)
	CMP ($16,X)		  ; C1 16 | Compare accumulator ((zero page,X))
	BRA $12			  ; 80 12 | Branch always
	STY $78			  ; 84 78 | Store Y register to zero page
	CPX #$61			 ; E0 61 | Compare X register (immediate)
	INC $FF7C,X		  ; FE 7C FF | Increment (absolute,X)
	LDY $00C3,X		  ; BC C3 00 | Load from absolute,X into Y register
	CPY $6800			; CC 00 68 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_240
; Address: $F3F2DB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_240:
	JSR $C01C			; 20 1C C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_241
; Address: $F3F2E4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_241:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_242
; Address: $F3F2FF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_242:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_243
; Address: $F3F318
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_243:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $63			  ; 05 63 | Logical OR with accumulator (zero page)
	CMP $DEE3,X		  ; DD E3 DE | Compare accumulator (absolute,X)
	SBC ($E2,X)		  ; E1 E2 | Subtract with carry ((zero page,X))
	SBC $DFB9,X		  ; FD B9 DF | Subtract with carry (absolute,X)
	STA				  ; 9F FF 80 FF | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	EOR ($16,X)		  ; 41 16 | Exclusive OR with accumulator ((zero page,X))
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CPY $DA00			; CC 00 DA | Compare Y register (absolute)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	BRA $10			  ; 80 10 | Branch always
	BRA $E3			  ; 80 E3 | Branch always
	CMP $BDE3,X		  ; DD E3 BD | Compare accumulator (absolute,X)
	DEC $F3FD			; CE FD F3 | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_244
; Address: $F3F353
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_244:
	CPY #$34			 ; C0 34 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	STA $AD00,Y		  ; 99 00 AD | Store accumulator to absolute,Y
	BNE $2C			  ; D0 2C | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_247
; Address: $F3F384
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_247:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	REP #$FD			 ; C2 FD | Reset processor status bits
	BRA $7F			  ; 80 7F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA $4200,X		  ; 1D 00 42 | Hardware register operation
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_249
; Address: $F3F3D3
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_249:
	AND ($48,X)		  ; 21 48 | Logical AND with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LSR $1C00			; 4E 00 1C | Logical shift right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEP #$7D			 ; E2 7D | Set processor status bits
	SBC $673F,Y		  ; F9 3F 67 | Subtract with carry (absolute,Y)
	STA				  ; 9F FF 80 BF | Store accumulator to absolute long,X
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $FB			  ; F0 FB | Branch if equal
	JMP $3A00			; 4C 00 3A | Jump to address
	STA $001A			; 8D 1A 00 | Store accumulator to absolute address
	BPL $C0			  ; 10 C0 | Branch if positive
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	INC $FCF3,X		  ; FE F3 FC | Increment (absolute,X)
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24A
; Address: $F3F450
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24A:
	JSR $0098			; 20 98 00 | Jump to subroutine
	LDX $D800			; AE 00 D8 | Load from absolute address into X register
	BIT $0400			; 2C 00 04 | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $05			  ; 10 05 | Branch if positive
	BNE $60			  ; D0 60 | Branch if not equal
	INX				  ; E8 | Increment X register
	BVS $68			  ; 70 68 | Branch if overflow set
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24B
; Address: $F3F471
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24B:
	JSR $1060			; 20 60 10 | Jump to subroutine
	BVS $80			  ; 70 80 | Branch if overflow set
	BMI $08			  ; 30 08 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24C
; Address: $F3F48C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24C:
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $F7			  ; F0 F7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24D
; Address: $F3F4B9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24D:
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24E
; Address: $F3F4DD
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24E:
	JSR $8000			; 20 00 80 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $A8			  ; F0 A8 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $48			  ; F0 48 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $13			  ; 10 13 | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $F807,X		  ; FD 07 F8 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $F800			; 0D 00 F8 | Logical OR with accumulator (absolute)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_24F
; Address: $F3F569
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_24F:
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_250
; Address: $F3F579
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_250:
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_251
; Address: $F3F5B5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_251:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_252
; Address: $F3F5C2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_252:
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2100,X		  ; 1E 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_253
; Address: $F3F61D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_253:
	JSR $1000			; 20 00 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	STX $FF			  ; 86 FF | Store X register to zero page
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_254
; Address: $F3F639
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_254:
	JSL $002000		  ; 22 00 20 00 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_255
; Address: $F3F659
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_255:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank66_DmaFunction_256
; Address: $F3F682
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_256:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	SBC $7E48,X		  ; FD 48 7E | Subtract with carry (absolute,X)
	DEC $CFFF			; CE FF CF | Decrement (absolute)
	JMP ($00FF)		  ; 6C FF 00 | Jump to address (absolute indirect)
	AND $1D00,Y		  ; 39 00 1D | Logical AND with accumulator (absolute,Y)
	ORA $817E,X		  ; 1D 7E 81 | Logical OR with accumulator (absolute,X)
	STA ($10,X)		  ; 81 10 | Store accumulator to (zero page,X)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $4400,X		  ; 5E 00 44 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_257
; Address: $F3F6A0
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_257:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BRA $88			  ; 80 88 | Branch always
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	BVS $10			  ; 70 10 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	REP #$00			 ; C2 00 | Reset processor status bits
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_258
; Address: $F3F72D
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_258:
	BRA $80			  ; 80 80 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $6C			  ; 10 6C | Branch if positive
	SEC				  ; 38 | Set carry flag
	DEC $10			  ; C6 10 | Decrement (zero page)
	JMP ($3800)		  ; 6C 00 38 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	JMP ($447C)		  ; 6C 7C 44 | Jump to address (absolute indirect)
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	JMP ($0010)		  ; 6C 10 00 | Jump to address (absolute indirect)
	ORA $1A3F,Y		  ; 19 3F 1A | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $3B00,Y		  ; 19 00 3B | Logical OR with accumulator (absolute,Y)
	AND $2C10,X		  ; 3D 10 2C | Logical AND with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	DEC $10			  ; C6 10 | Decrement (zero page)
	INC $0045,X		  ; FE 45 00 | Increment (absolute,X)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCS $60			  ; B0 60 | Branch if carry set
	BCS $60			  ; B0 60 | Branch if carry set
	BVS $E0			  ; 70 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $28			  ; F0 28 | Branch if equal
	BEQ $B8			  ; F0 B8 | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_25A
; Address: $F3F7BF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_25A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	ASL $0305,X		  ; 1E 05 03 | Arithmetic shift left (absolute,X)
	AND $FF1F,X		  ; 3D 1F FF | Logical AND with accumulator (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_25C
; Address: $F3F7F5
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_25C:
	CLC				  ; 18 | Clear carry flag
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FFE3,X		  ; FE E3 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $1C31			; EE 31 1C | Increment (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $E200,X		  ; FE 00 E2 | Increment (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ASL $D1E0			; 0E E0 D1 | Arithmetic shift left (absolute)
	SBC $3100			; ED 00 31 | Subtract with carry (absolute)
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $9C			  ; F0 9C | Branch if equal
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STA $7400FF		  ; 8F FF 00 74 | Store accumulator to absolute long address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_25D
; Address: $F3F84B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_25D:
	BRA $18			  ; 80 18 | Branch always
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_25E
; Address: $F3F85D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_25E:
	JSR $0078			; 20 78 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $2D			  ; 30 2D | Branch if negative
	BIT $595A			; 2C 5A 59 | Test bits in accumulator (absolute)
	JMP ($1862)		  ; 6C 62 18 | Jump to address (absolute indirect)
	ASL $3C			  ; 06 3C | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $7E			  ; 06 7E | Arithmetic shift left (zero page)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $2E			  ; F0 2E | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_260
; Address: $F3F883
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_260:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	JMP ($1000)		  ; 6C 00 10 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF 78 FF 78 | Load from absolute long,X into accumulator
	SBC $337E,X		  ; FD 7E 33 | Subtract with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_261
; Address: $F3F8B4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_261:
	JSR $0058			; 20 58 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEP #$3C			 ; E2 3C | Set processor status bits
	LDX #$7C			 ; A2 7C | Load immediate value into X register
	LDX #$7C			 ; A2 7C | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank66_DmaFunction_262
; Address: $F3F8F1
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_262:
	JSR $2098			; 20 98 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $0B			  ; 80 0B | Branch always
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $F9FE,X		  ; FD FE F9 | Subtract with carry (absolute,X)
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	STA ($44,X)		  ; 81 44 | Store accumulator to (zero page,X)
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_263
; Address: $F3F942
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_263:
	INC $351F			; EE 1F 35 | Increment (absolute)
	INC $FF00			; EE 00 FF | Increment (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_264
; Address: $F3F951
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_264:
	ASL $00E0,X		  ; 1E E0 00 | Arithmetic shift left (absolute,X)
	ORA ($EA),Y		  ; 11 EA | Logical OR with accumulator ((zero page),Y)
	AND ($8A),Y		  ; 31 8A | Logical AND with accumulator ((zero page),Y)
	STA $870FF3		  ; 8F F3 0F 87 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $08			  ; F0 08 | Branch if equal
	BRA $70			  ; 80 70 | Branch always
	STY $30			  ; 84 30 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	BEQ $F1			  ; F0 F1 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	STZ $3C00,X		  ; 9E 00 3C | Store zero to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
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
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $0E			  ; 70 0E | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	SBC $FE7E,X		  ; FD 7E FE | Subtract with carry (absolute,X)
	LDA				  ; BF 7F BF 7F | Load from absolute long,X into accumulator
	LDA				  ; BF 7F 97 7F | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	INC $82FF,X		  ; FE FF 82 | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_265
; Address: $F3FA22
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_265:
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	PHX				  ; DA | Push X register to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2100,X		  ; 1E 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_266
; Address: $F3FA5B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_266:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	STX $FF			  ; 86 FF | Store X register to zero page
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_267
; Address: $F3FA77
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_267:
	JSL $002000		  ; 22 00 20 00 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_268
; Address: $F3FABD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_268:
	JSR $1800			; 20 00 18 | Jump to subroutine
	BVS $70			  ; 70 70 | Branch if overflow set
	STA				  ; 9F FF 8C FF | Store accumulator to absolute long,X
	STY $0CFF			; 8C FF 0C | Store Y register to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_269
; Address: $F3FAE9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_269:
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $8B00,X		  ; 1E 00 8B | Arithmetic shift left (absolute,X)
	STX $CE00			; 8E 00 CE | Store X register to absolute address
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
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

;------------------------------------------------------------------------------
; Bank66_DmaFunction_26A
; Address: $F3FB77
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_26A:
	JSL $FC2AFC		  ; 22 FC 2A FC | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $0C			  ; 30 0C | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_26C
; Address: $F3FBB1
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_26C:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL $0031			; 0E 31 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	BPL $0E			  ; 10 0E | Branch if positive

;------------------------------------------------------------------------------
; Bank66_DmaFunction_26D
; Address: $F3FC1F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_26D:
	JSR $7E81			; 20 81 7E | Jump to subroutine
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_26E
; Address: $F3FC26
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_26E:
	JSL $FC3FF8		  ; 22 F8 3F FC | Jump to subroutine long
	INC $F3ED,X		  ; FE ED F3 | Increment (absolute,X)
	INC $00F1			; EE F1 00 | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_270
; Address: $F3FC3D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_270:
	JSR $E00E			; 20 0E E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_271
; Address: $F3FC48
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_271:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank66_DmaFunction_272
; Address: $F3FC59
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_272:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $40			  ; 10 40 | Branch if positive
	LDA				  ; BF 40 BF F8 | Load from absolute long,X into accumulator
	STA ($FC),Y		  ; 91 FC | Store accumulator to (zero page),Y
	STA				  ; 9F FE D9 FF | Store accumulator to absolute long,X
	SBC $F877,Y		  ; F9 77 F8 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_273
; Address: $F3FC97
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_273:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BVS $80			  ; 70 80 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_274
; Address: $F3FCA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_274:
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_276
; Address: $F3FCBC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_276:
	JSR $0020			; 20 20 00 | Jump to subroutine
	WDM #$3D			 ; 42 3D | Reserved instruction
	WDM #$3D			 ; 42 3D | Reserved instruction
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	AND $4D7F,Y		  ; 39 7F 4D | Logical AND with accumulator (absolute,Y)
	STA $002100		  ; 8F 00 21 00 | Store accumulator to absolute long address
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	BMI $10			  ; 30 10 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	BMI $81			  ; 30 81 | Branch if negative
	BVS $07			  ; 70 07 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	BCS $16			  ; B0 16 | Branch if carry set
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	CPX #$99			 ; E0 99 | Compare X register (immediate)
	BEQ $6E			  ; F0 6E | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_277
; Address: $F3FCF1
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_277:
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$34			 ; C0 34 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank66_DmaFunction_278
; Address: $F3FCF6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_278:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $62			  ; 86 62 | Store X register to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2100,X		  ; 1E 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank66_DmaFunction_279
; Address: $F3FD1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_279:
	JSR $1000			; 20 00 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	STX $FF			  ; 86 FF | Store X register to zero page
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_27A
; Address: $F3FD37
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_27A:
	JSL $002000		  ; 22 00 20 00 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	BVS $31			  ; 70 31 | Branch if overflow set
	ROR $FF5D,X		  ; 7E 5D FF | Rotate right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($46,X)		  ; 01 46 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA $E700			; AD 00 E7 | Load from absolute address into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_27C
; Address: $F3FD7F
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_27C:
	JSR $E15E			; 20 5E E1 | Jump to subroutine
	EOR ($EF),Y		  ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
	CMP $F9FF,X		  ; DD FF F9 | Compare accumulator (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	RTI				  ; 40 | Return from interrupt
	BPL $4C			  ; 10 4C | Branch if positive
	LDY $DA00			; AC 00 DA | Load from absolute address into Y register
	BIT $2C01			; 2C 01 2C | Test bits in accumulator (absolute)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $07			  ; 80 07 | Branch always
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BVS $3F			  ; 70 3F | Branch if overflow set
	BVS $3F			  ; 70 3F | Branch if overflow set
	BVS $05			  ; 70 05 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	AND $5026,Y		  ; 39 26 50 | Logical AND with accumulator (absolute,Y)
	ROL $50			  ; 26 50 | Rotate left (zero page)
	BIT $50			  ; 24 50 | Test bits in accumulator (zero page)
	LDA $77A870		  ; AF 70 A8 77 | Load from absolute long address into accumulator
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	STA $8820			; 8D 20 88 | Store accumulator to absolute address
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLB				  ; AB | Pull data bank register from stack
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_27E
; Address: $F3FE0E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_27E:
	BEQ $60			  ; F0 60 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_27F
; Address: $F3FE1C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_27F:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_280
; Address: $F3FE3E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_280:
	JSL $877A58		  ; 22 58 7A 87 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	ROR $0045,X		  ; 7E 45 00 | Rotate right (absolute,X)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$8C08		   ; F4 08 8C | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	JMP $F89CF8		  ; 5C F8 9C F8 | Jump to address long
	JMP $38FCF8		  ; 5C F8 FC 38 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	BMI $98			  ; 30 98 | Branch if negative

;------------------------------------------------------------------------------
; Bank66_DmaFunction_281
; Address: $F3FE7B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_281:
	JSR $2090			; 20 90 20 | Jump to subroutine
	BMI $40			  ; 30 40 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_282
; Address: $F3FEA0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_282:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	SBC $7E48,X		  ; FD 48 7E | Subtract with carry (absolute,X)
	JMP ($BBFF)		  ; 6C FF BB | Jump to address (absolute indirect)
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	ROR $8181,X		  ; 7E 81 81 | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank66_DmaFunction_283
; Address: $F3FEBF
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_283:
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $70			  ; 80 70 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	BPL $80			  ; 10 80 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BCS $E0			  ; B0 E0 | Game work RAM access
	BNE $60			  ; D0 60 | Branch if not equal
	INY				  ; C8 | Increment Y register
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $A4			  ; 70 A4 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	LDY $78			  ; A4 78 | Load from zero page into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank66_DmaFunction_284
; Address: $F3FF41
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_284:
	BVS $7F			  ; 70 7F | Branch if overflow set
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_285
; Address: $F3FF50
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_285:
	JSR $4050			; 20 50 40 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $4C00			; 8C 00 4C | Store Y register to absolute address
	BEQ $60			  ; F0 60 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $A8			  ; 70 A8 | Branch if overflow set
	BVS $A4			  ; 70 A4 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	LDY $78			  ; A4 78 | Load from zero page into Y register
	LDY $78			  ; A4 78 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank66_DmaFunction_286
; Address: $F3FF70
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_286:
	JSR $1040			; 20 40 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $3F			  ; 70 3F | Branch if overflow set
	BVS $3F			  ; 70 3F | Branch if overflow set
	BVS $3F			  ; 70 3F | Branch if overflow set
	BVS $7F			  ; 70 7F | Branch if overflow set
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank66_DmaFunction_287
; Address: $F3FF90
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_287:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $C8			  ; 70 C8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank66_DmaFunction_288
; Address: $F3FFAB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_288:
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BVS $48			  ; 70 48 | Branch if overflow set
	BEQ $30			  ; F0 30 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank66_DmaFunction_28A
; Address: $F3FFB7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank66_DmaFunction_28A:
	RTI				  ; 40 | Return from interrupt
	BRA $03			  ; 80 03 | Branch always
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $1C00,X		  ; 1D 00 1C | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	DEC $10			  ; C6 10 | Decrement (zero page)
	INC $0045,X		  ; FE 45 00 | Increment (absolute,X)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
