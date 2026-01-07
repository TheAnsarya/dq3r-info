;==============================================================================
; Dragon Quest III - Bank $64
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F20000-$F27FFF
; Instructions: 8244
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_64"

;------------------------------------------------------------------------------
; Bank64_DmaFunction_000
; Address: $F28007
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_000:
	ROR $E31C,X		  ; 7E 1C E3 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $6183,X		  ; 5E 83 61 | Logical shift right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEP #$E3			 ; E2 E3 | Set processor status bits

;------------------------------------------------------------------------------
; Bank64_DmaFunction_001
; Address: $F28075
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_001:
	JSR $DC00			; 20 00 DC | Jump to subroutine
	BRA $F8			  ; 80 F8 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $0014			; 4C 14 00 | Jump to address
	INX				  ; E8 | Increment X register
	BEQ $80			  ; F0 80 | Branch if equal
	CPX $F800			; EC 00 F8 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	JMP $B414			; 4C 14 B4 | Jump to address
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	BVS $33			  ; 70 33 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	DEC $F800,X		  ; DE 00 F8 | Decrement (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA ($33,X)		  ; A1 33 | Load from (zero page,X) into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	BRA $F0			  ; 80 F0 | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_002
; Address: $F28159
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_002:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $D8			  ; 80 D8 | Branch always
	LDY $7C3C,X		  ; BC 3C 7C | Load from absolute,X into Y register
	JMP $424C75		  ; 5C 75 4C 42 | Hardware register operation
	PHB				  ; 8B | Push data bank register to stack
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	PLA				  ; 68 | Pull accumulator from stack
	BVS $9A			  ; 70 9A | Branch if overflow set
	PLY				  ; 7A | Pull Y register from stack
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	LDA ($82),Y		  ; B1 82 | Load from (zero page),Y into accumulator
	ADC $30			  ; 65 30 | Add with carry (zero page)
	INC $8761			; EE 61 87 | Increment (absolute)
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_003
; Address: $F28187
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_003:
	STZ $004F			; 9C 4F 00 | Store zero to absolute
	BRA $0F			  ; 80 0F | Branch always
	BMI $A1			  ; 30 A1 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_004
; Address: $F28197
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_004:
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BMI $20			  ; 30 20 | Branch if negative
	WDM #$60			 ; 42 60 | Reserved instruction
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	STA				  ; 9F 00 78 2A | Store accumulator to absolute long,X
	PLX				  ; FA | Pull X register from stack
	STY $F06C			; 8C 6C F0 | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_005
; Address: $F281CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_005:
	JSR $D400			; 20 00 D4 | Jump to subroutine
	ASL $8400			; 0E 00 84 | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_006
; Address: $F281DB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_006:
	CLC				  ; 18 | Clear carry flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	JMP $9C44			; 4C 44 9C | Jump to address
	LDY $7B79,X		  ; BC 79 7B | Load from absolute,X into Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	CLI				  ; 58 | Clear interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BVC $48			  ; 50 48 | Branch if overflow clear
	BCS $83			  ; B0 83 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_008
; Address: $F281F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_008:
	CPX #$74			 ; E0 74 | Compare X register (immediate)
	STY $9500			; 8C 00 95 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_009
; Address: $F281FF
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_009:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY $7CBC,X		  ; BC BC 7C | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	PHY				  ; 5A | Push Y register to stack
	LSR $4C58,X		  ; 5E 58 4C | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BCC $88			  ; 90 88 | Branch if carry clear
	BVS $33			  ; 70 33 | Branch if overflow set
	LDY #$33			 ; A0 33 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	BEQ $20			  ; F0 20 | Branch if equal
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	LDY #$14			 ; A0 14 | Load immediate value into Y register
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY $787C,X		  ; BC 7C 78 | Load from absolute,X into Y register
	CPY $D9			  ; C4 D9 | Compare Y register (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $28			  ; 66 28 | Rotate right (zero page)
	BIT $28			  ; 24 28 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00A
; Address: $F2826B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00A:
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDY #$33			 ; A0 33 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	BEQ $20			  ; F0 20 | Branch if equal
	SBC $2A00,Y		  ; F9 00 2A | Subtract with carry (absolute,Y)
	CMP ($24),Y		  ; D1 24 | Compare accumulator ((zero page),Y)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	STZ $29			  ; 64 29 | Store zero to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0C08			; 2E 08 0C | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00B
; Address: $F282B0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00B:
	JSR $F803			; 20 03 F8 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BNE $21			  ; D0 21 | PPU graphics register access
	BNE $02			  ; D0 02 | Branch if not equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00C
; Address: $F282D4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00C:
	JSR $0010			; 20 10 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	LDY $7C3C,X		  ; BC 3C 7C | Load from absolute,X into Y register
	JMP $424C75		  ; 5C 75 4C 42 | Hardware register operation
	PHB				  ; 8B | Push data bank register to stack
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	PLA				  ; 68 | Pull accumulator from stack
	BVS $98			  ; 70 98 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	LDA ($82),Y		  ; B1 82 | Load from (zero page),Y into accumulator
	ADC $30			  ; 65 30 | Add with carry (zero page)
	INC $8460			; EE 60 84 | Increment (absolute)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00D
; Address: $F28307
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00D:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY $2CA4			; AC A4 2C | Load from absolute address into Y register
	STZ $D8			  ; 64 D8 | Store zero to zero page
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $B0			  ; F0 B0 | Branch if equal
	LDA $674D07		  ; AF 07 4D 67 | Load from absolute long address into accumulator
	EOR $53A7			; 4D A7 53 | Exclusive OR with accumulator (absolute)
	STA $E41F26		  ; 8F 26 1F E4 | Store accumulator to absolute long address
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00E
; Address: $F28346
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00E:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	STA $FF87FF		  ; 8F FF 87 FF | Store accumulator to absolute long address
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	JMP $F8E0			; 4C E0 F8 | Jump to address
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	STY $00			  ; 84 00 | Store Y register to zero page
	STX $8300			; 8E 00 83 | Store X register to absolute address
	BRA $4E			  ; 80 4E | Branch always
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)
	BVS $F8			  ; 70 F8 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BPL $3E			  ; 10 3E | Branch if positive
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BVC $58			  ; 50 58 | Branch if overflow clear
	BCC $90			  ; 90 90 | Branch if carry clear
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_00F
; Address: $F283AA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_00F:
	JSR $C060			; 20 60 C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_010
; Address: $F283C0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_010:
	BCC $88			  ; 90 88 | Branch if carry clear
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_011
; Address: $F283CE
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_011:
	JSR $1460			; 20 60 14 | Jump to subroutine
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BRA $88			  ; 80 88 | Branch always
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	BNE $D8			  ; D0 D8 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	PEA #$E400		   ; F4 00 E4 | Push effective address to stack
	CPX $08			  ; E4 08 | Compare X register (zero page)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	BNE $D8			  ; D0 D8 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	PEA #$E400		   ; F4 00 E4 | Push effective address to stack
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	BCS $F0			  ; B0 F0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_012
; Address: $F28425
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_012:
	BEQ $A0			  ; F0 A0 | Branch if equal
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_013
; Address: $F2842A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_013:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_014
; Address: $F28434
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_014:
	PHA				  ; 48 | Push accumulator to stack
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $7900,X		  ; FD 00 79 | Subtract with carry (absolute,X)
	BMI $18			  ; 30 18 | Branch if negative
	ROL $780E,X		  ; 3E 0E 78 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_015
; Address: $F28476
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_015:
	JSR $07F8			; 20 F8 07 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SBC ($7E),Y		  ; F1 7E | Subtract with carry ((zero page),Y)
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	BMI $58			  ; 30 58 | Branch if negative
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	BCS $44			  ; B0 44 | Branch if carry set
	LDY #$A4			 ; A0 A4 | Load immediate value into Y register
	BRA $C8			  ; 80 C8 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_016
; Address: $F28500
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_016:
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_017
; Address: $F28506
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_017:
	JSR $C060			; 20 60 C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_018
; Address: $F2852A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_018:
	JSR $C040			; 20 40 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_01B
; Address: $F28570
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_01B:
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_01D
; Address: $F28589
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_01D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_01E
; Address: $F285A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_01E:
	BEQ $60			  ; F0 60 | Branch if equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_020
; Address: $F285B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_020:
	BCS $D0			  ; B0 D0 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_021
; Address: $F285CD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_021:
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_022
; Address: $F285DC
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_022:
	JSR $2031			; 20 31 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F1			  ; F0 F1 | Branch if equal
	INC $FEEE,X		  ; FE EE FE | Increment (absolute,X)
	LDX $FE			  ; A6 FE | Load from zero page into X register
	INC $00			  ; E6 00 | Increment (zero page)
	BEQ $01			  ; F0 01 | Branch if equal
	SBC $FFE8,X		  ; FD E8 FF | Subtract with carry (absolute,X)
	PEA #$7E1F		   ; F4 1F 7E | Push effective address to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	BCC $4F			  ; 90 4F | Branch if carry clear
	STA $010100		  ; 8F 00 01 01 | Store accumulator to absolute long address
	ASL $780F			; 0E 0F 78 | Arithmetic shift left (absolute)
	BCC $E0			  ; 90 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_023
; Address: $F28639
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_023:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $07F8,X		  ; FE F8 07 | Increment (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_024
; Address: $F2864D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_024:
	JSR $6042			; 20 42 60 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $FF00,Y		  ; 19 00 FF | Logical OR with accumulator (absolute,Y)
	BMI $CE			  ; 30 CE | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	STY $9F			  ; 84 9F | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_026
; Address: $F28676
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_026:
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_027
; Address: $F2867A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_027:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0C10,X		  ; 1E 10 0C | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	BEQ $F2			  ; F0 F2 | Branch if equal
	BEQ $34			  ; F0 34 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_028
; Address: $F286D4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_028:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $30			  ; 10 30 | Branch if positive
	AND ($60,X)		  ; 21 60 | Logical AND with accumulator ((zero page,X))
	ROR $E31C,X		  ; 7E 1C E3 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LSR $6183,X		  ; 5E 83 61 | Logical shift right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_029
; Address: $F28727
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_029:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $78			  ; 80 78 | Branch always
	BPL $19			  ; 10 19 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_02A
; Address: $F28732
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_02A:
	JSR $4031			; 20 31 40 | Jump to subroutine
	BRA $C3			  ; 80 C3 | Branch always
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	STX $05			  ; 86 05 | Store X register to zero page
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_02B
; Address: $F28742
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_02B:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $1F			  ; 80 1F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_02D
; Address: $F28765
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_02D:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	STY $18E7			; 8C E7 18 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_02E
; Address: $F28774
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_02E:
	BRA $C7			  ; 80 C7 | Branch always
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	STY $1808			; 8C 08 18 | Store Y register to absolute address
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $BE			  ; 80 BE | Branch always
	INC $7E			  ; E6 7E | Increment (zero page)
	INC $FE			  ; E6 FE | Increment (zero page)
	DEC $FC			  ; C6 FC | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $B0			  ; F0 B0 | Branch if equal
	ADC $E51F,X		  ; 7D 1F E5 | Add with carry (absolute,X)
	INC $BF			  ; E6 BF | Increment (zero page)
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_030
; Address: $F287CB
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_030:
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CMP $FA			  ; C5 FA | Compare accumulator (zero page)
	STA $FF87FF		  ; 8F FF 87 FF | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	BVS $D8			  ; 70 D8 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $F8E0			; 4C E0 F8 | Jump to address
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCC $30			  ; 90 30 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	STY $00			  ; 84 00 | Store Y register to zero page
	STX $8300			; 8E 00 83 | Store X register to absolute address
	BRA $4E			  ; 80 4E | Branch always
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FEEE,X		  ; FE EE FE | Increment (absolute,X)
	LDX $FE			  ; A6 FE | Load from zero page into X register
	INC $BE			  ; E6 BE | Increment (zero page)
	INC $7E			  ; E6 7E | Increment (zero page)
	INC $00			  ; E6 00 | Increment (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	INX				  ; E8 | Increment X register
	PEA #$7E1F		   ; F4 1F 7E | Push effective address to stack
	ADC $001F,X		  ; 7D 1F 00 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $0F60			; 0E 60 0F | Arithmetic shift left (absolute)
	DEC $8F01			; CE 01 8F | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_031
; Address: $F28834
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_031:
	ROR $EDFE			; 6E FE ED | Rotate right (absolute)
	SBC ($F0,X)		  ; E1 F0 | Subtract with carry ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $0000FF		  ; 8F FF 00 00 | Store accumulator to absolute long address
	BRA $30			  ; 80 30 | Branch always
	LDY #$42			 ; A0 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_032
; Address: $F2884B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_032:
	JMP $F8E0			; 4C E0 F8 | Jump to address
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	PHY				  ; 5A | Push Y register to stack
	BRA $9F			  ; 80 9F | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	STX $0000			; 8E 00 00 | Store X register to absolute address
	BEQ $F1			  ; F0 F1 | Branch if equal
	INC $FEEE,X		  ; FE EE FE | Increment (absolute,X)
	LDX $FE			  ; A6 FE | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_033
; Address: $F2886B
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_033:
	INC $BE			  ; E6 BE | Increment (zero page)
	INC $7E			  ; E6 7E | Increment (zero page)
	INC $00			  ; E6 00 | Increment (zero page)
	BEQ $01			  ; F0 01 | Branch if equal
	SBC $FFE8,X		  ; FD E8 FF | Subtract with carry (absolute,X)
	PEA #$7E1F		   ; F4 1F 7E | Push effective address to stack
	ADC $3C1F,X		  ; 7D 1F 3C | Add with carry (absolute,X)
	STZ $004F			; 9C 4F 00 | Store zero to absolute
	BRA $0F			  ; 80 0F | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $9C			  ; 80 9C | Branch always
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	STA $F000FF		  ; 8F FF 00 F0 | Store accumulator to absolute long address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $20			  ; 30 20 | Branch if negative
	WDM #$60			 ; 42 60 | Reserved instruction
	JMP $F8E0			; 4C E0 F8 | Jump to address
	BCC $70			  ; 90 70 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	STA				  ; 9F 00 B2 00 | Store accumulator to absolute long,X
	STY $00			  ; 84 00 | Store Y register to zero page
	BEQ $F3			  ; F0 F3 | Branch if equal
	INC $FEEE,X		  ; FE EE FE | Increment (absolute,X)
	LDX $FE			  ; A6 FE | Load from zero page into X register
	INC $BE			  ; E6 BE | Increment (zero page)
	INC $7E			  ; E6 7E | Increment (zero page)
	INC $03			  ; E6 03 | Increment (zero page)
	INC $FFE8,X		  ; FE E8 FF | Increment (absolute,X)
	PEA #$7E1F		   ; F4 1F 7E | Push effective address to stack
	ADC $CF1F,X		  ; 7D 1F CF | Add with carry (absolute,X)
	BMI $9F			  ; 30 9F | Branch if negative
	JMP ($D303)		  ; 6C 03 D3 | Jump to address (absolute indirect)
	STA $0000			; 8D 00 00 | Store accumulator to absolute address
	BMI $21			  ; 30 21 | PPU graphics register access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_034
; Address: $F288F7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_034:
	PEA #$E0EC		   ; F4 EC E0 | Game work RAM access
	STX $FF			  ; 86 FF | Store X register to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $20			  ; B0 20 | Branch if carry set
	WDM #$E0			 ; 42 E0 | Game work RAM access
	JMP $F8E0			; 4C E0 F8 | Jump to address
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_035
; Address: $F28916
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_035:
	STA				  ; 9F 80 B2 00 | Store accumulator to absolute long,X
	STY $00			  ; 84 00 | Store Y register to zero page
	STX $8300			; 8E 00 83 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $0F30			; 0E 30 0F | Arithmetic shift left (absolute)
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_036
; Address: $F28930
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_036:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_037
; Address: $F2893A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_037:
	JSR $2030			; 20 30 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ROR $E0			  ; 66 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_038
; Address: $F28942
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_038:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $FCC6,X		  ; FE C6 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC $3F			  ; E5 3F | Subtract with carry (zero page)
	INC $BF			  ; E6 BF | Increment (zero page)
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_039
; Address: $F28983
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_039:
	JSR $3000			; 20 00 30 | Jump to subroutine
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	BRA $3E			  ; 80 3E | Branch always
	CPY #$87			 ; C0 87 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03A
; Address: $F28992
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03A:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	ASL $0283			; 0E 83 02 | Arithmetic shift left (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BCS $80			  ; B0 80 | Branch if carry set
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	BCC $31			  ; 90 31 | Branch if carry clear
	BPL $E7			  ; 10 E7 | Branch if positive
	BRA $B8			  ; 80 B8 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03B
; Address: $F289AC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03B:
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $4E			  ; 80 4E | Branch always
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	BRA $18			  ; 80 18 | Branch always
	INC $00			  ; E6 00 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03C
; Address: $F289BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03C:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03D
; Address: $F289CB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03D:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03E
; Address: $F289DA
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03E:
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_03F
; Address: $F289E2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_03F:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	STX $8300			; 8E 00 83 | Store X register to absolute address
	BRA $4E			  ; 80 4E | Branch always
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_040
; Address: $F28A22
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_040:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	INC $D030,X		  ; FE 30 D0 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	INC $FE3C,X		  ; FE 3C FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_041
; Address: $F28A50
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_041:
	LSR $2C80			; 4E 80 2C | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_042
; Address: $F28A63
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_042:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	ADC $7386,Y		  ; 79 86 73 | Add with carry (absolute,Y)
	STY $18E7			; 8C E7 18 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	ROR $80			  ; 66 80 | Rotate right (zero page)
	BRA $CF			  ; 80 CF | Branch always
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	STX $18			  ; 86 18 | Store X register to zero page
	STY $1808			; 8C 08 18 | Store Y register to absolute address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_043
; Address: $F28AB3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_043:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_047
; Address: $F28AF4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_047:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $7900,X		  ; FD 00 79 | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_048
; Address: $F28B1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_048:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROL $780E,X		  ; 3E 0E 78 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_04B
; Address: $F28B32
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_04B:
	JSR $07F8			; 20 F8 07 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SBC ($7E),Y		  ; F1 7E | Subtract with carry ((zero page),Y)
	LDX $98F8,Y		  ; BE F8 98 | Load from absolute,Y into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_04D
; Address: $F28B40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_04D:
	BRA $80			  ; 80 80 | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_04E
; Address: $F28B5D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_04E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	ROL $370F,X		  ; 3E 0F 37 | Rotate left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL $C301			; 0E 01 C3 | Arithmetic shift left (absolute)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_04F
; Address: $F28BC9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_04F:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $1E0E			; 0E 0E 1E | Arithmetic shift left (absolute)
	ASL $243C			; 0E 3C 24 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_050
; Address: $F28BED
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_050:
	JSR $3838			; 20 38 38 | Jump to subroutine
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ADC $F11F,Y		  ; 79 1F F1 | Add with carry (absolute,Y)
	SBC ($3E),Y		  ; F1 3E | Subtract with carry ((zero page),Y)
	PHX				  ; DA | Push X register to stack
	ROR $7CDE,X		  ; 7E DE 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_052
; Address: $F28C07
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_052:
	PHP				  ; 08 | Push processor status to stack
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_054
; Address: $F28C15
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_054:
	BEQ $E8			  ; F0 E8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $C5F6			; EE F6 C5 | Increment (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $0000FF		  ; 8F FF 00 00 | Store accumulator to absolute long address
	BMI $20			  ; 30 20 | Branch if negative
	WDM #$60			 ; 42 60 | Reserved instruction
	JMP $F8E0			; 4C E0 F8 | Jump to address
	BMI $00			  ; 30 00 | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	STA				  ; 9F 00 B2 00 | Store accumulator to absolute long,X
	STY $00			  ; 84 00 | Store Y register to zero page
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $36FF			; EC FF 36 | Compare X register (absolute)
	DEC $FE			  ; C6 FE | Decrement (zero page)
	ASL $0EFE			; 0E FE 0E | Arithmetic shift left (absolute)
	LDY $FFF8			; AC F8 FF | Load from absolute address into Y register
	ORA $89FF			; 0D FF 89 | Logical OR with accumulator (absolute)
	BRA $1C			  ; 80 1C | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	STY $0F03			; 8C 03 0F | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$F1			 ; E2 F1 | Set processor status bits
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $04			  ; E6 04 | Increment (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	BEQ $0C			  ; F0 0C | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_055
; Address: $F28C98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_055:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	STY $00FF			; 8C FF 00 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_057
; Address: $F28CA8
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_057:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	INC $FF8E,X		  ; FE 8E FF | Increment (absolute,X)
	ASL $9CFF,X		  ; 1E FF 9C | Arithmetic shift left (absolute,X)
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 7F 1D FF | Store accumulator to absolute long,X
	STA				  ; 9F FF 7F FF | Store accumulator to absolute long,X
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_058
; Address: $F28D23
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_058:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	SBC $7D02,X		  ; FD 02 7D | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_059
; Address: $F28D32
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_059:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BCC $04			  ; 90 04 | Branch if carry clear
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCC $30			  ; 90 30 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	STX $8300			; 8E 00 83 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank64_DmaFunction_05A
; Address: $F28D53
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_05A:
	BRA $4E			  ; 80 4E | Branch always
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $EC04			; CC 04 EC | Compare Y register (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	STX $9C7F			; 8E 7F 9C | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BVS $FB			  ; 70 FB | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	LDA $03FF,Y		  ; B9 FF 03 | Load from absolute,Y into accumulator
	INC $FC07,X		  ; FE 07 FC | Increment (absolute,X)
	LDY $D66F,X		  ; BC 6F D6 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	LDY #$82			 ; A0 82 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	INC $81			  ; E6 81 | Increment (zero page)
	REP #$42			 ; C2 42 | Hardware register operation
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BMI $0C			  ; 30 0C | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	LSR $DC			  ; 46 DC | Logical shift right (zero page)
	CPX $0013			; EC 13 00 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_05B
; Address: $F28DF9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_05B:
	CPY $42			  ; C4 42 | Hardware register operation
	ASL $21			  ; 06 21 | PPU graphics register access
	ORA ($8B),Y		  ; 11 8B | Logical OR with accumulator ((zero page),Y)
	ROL $1EC1,X		  ; 3E C1 1E | Rotate left (absolute,X)
	ADC ($12,X)		  ; 61 12 | Add with carry ((zero page,X))
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($98,X)		  ; C1 98 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_05D
; Address: $F28E17
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_05D:
	JSR $0101			; 20 01 01 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $8C			  ; 06 8C | Arithmetic shift left (zero page)
	INC $02			  ; E6 02 | Increment (zero page)
	STX $01			  ; 86 01 | Store X register to zero page
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $05			  ; 10 05 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $1B00			; 0E 00 1B | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_05F
; Address: $F28E9F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_05F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_060
; Address: $F28EAE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_060:
	JSR $0060			; 20 60 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_061
; Address: $F28EBC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_061:
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($B9,X)		  ; 01 B9 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_062
; Address: $F28EE0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_062:
	ROR $7691			; 6E 91 76 | Rotate right (absolute)
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $5D			  ; 80 5D | Branch always
	BRA $0D			  ; 80 0D | Branch always
	BCC $9A			  ; 90 9A | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_067
; Address: $F28F71
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_067:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BMI $78			  ; 30 78 | Branch if negative
	BVS $78			  ; 70 78 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEF8,X		  ; FE F8 FE | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	REP #$00			 ; C2 00 | Reset processor status bits
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	REP #$00			 ; C2 00 | Reset processor status bits
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CMP ($FC,X)		  ; C1 FC | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_068
; Address: $F28FB6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_068:
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $00FF			; EE FF 00 | Increment (absolute)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVC $58			  ; 50 58 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank64_DmaFunction_069
; Address: $F28FEF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_069:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BIT $DC00			; 2C 00 DC | Test bits in accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06A
; Address: $F29016
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06A:
	JSR $1878			; 20 78 18 | Jump to subroutine
	ROL $1F0E,X		  ; 3E 0E 1F | Rotate left (absolute,X)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0C1F			; 0E 1F 0C | Arithmetic shift left (absolute)
	ASL $3E0C,X		  ; 1E 0C 3E | Arithmetic shift left (absolute,X)
	ASL $1E04			; 0E 04 1E | Arithmetic shift left (absolute)
	ASL $1E0C,X		  ; 1E 0C 1E | Arithmetic shift left (absolute,X)
	ROL $3E1C,X		  ; 3E 1C 3E | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INC $FC08,X		  ; FE 08 FC | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06B
; Address: $F2909F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06B:
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ADC $7B86,Y		  ; 79 86 7B | Add with carry (absolute,Y)
	STY $F3			  ; 84 F3 | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	BMI $3F			  ; 30 3F | Branch if negative
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	CMP $85			  ; C5 85 | Compare accumulator (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $3804			; 9C 04 38 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	ADC ($10),Y		  ; 71 10 | Add with carry ((zero page),Y)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06C
; Address: $F290DC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06C:
	JSR $10A0			; 20 A0 10 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	PLX				  ; FA | Pull X register from stack
	LDY $F0FC,X		  ; BC FC F0 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06D
; Address: $F2914E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06D:
	JSR $5600			; 20 00 56 | Jump to subroutine
	ASL $8400			; 0E 00 84 | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1810,X		  ; 1E 10 18 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06E
; Address: $F29174
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06E:
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	ROR $7C0F,X		  ; 7E 0F 7C | Rotate right (absolute,X)
	ROL $1826,X		  ; 3E 26 18 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $10			  ; 30 10 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $10			  ; 30 10 | Branch if negative
	BVS $50			  ; 70 50 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FFC1,X		  ; FE C1 FF | Increment (absolute,X)
	INC $FCF0,X		  ; FE F0 FC | Increment (absolute,X)
	BEQ $FE			  ; F0 FE | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_06F
; Address: $F29241
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_06F:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BRA $0F			  ; 80 0F | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	LDA				  ; BF C0 BF 70 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_070
; Address: $F29260
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_070:
	JSR $F0C0			; 20 C0 F0 | Jump to subroutine
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $01			  ; 30 01 | Branch if negative
	INC $FC1C,X		  ; FE 1C FC | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	ROL $0E3E			; 2E 3E 0E | Rotate left (absolute)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC $5100			; EE 00 51 | Increment (absolute)
	BVS $01			  ; 70 01 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDX $0020,Y		  ; BE 20 00 | Load from absolute,Y into X register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BMI $F8			  ; 30 F8 | Branch if negative
	BMI $F8			  ; 30 F8 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_071
; Address: $F292D8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_071:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $78			  ; 70 78 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $040A			; 0E 0A 04 | Arithmetic shift left (absolute)
	BVS $10			  ; 70 10 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_072
; Address: $F29311
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_072:
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BCS $FE			  ; B0 FE | Branch if carry set
	INY				  ; C8 | Increment Y register
	INC $FEE0,X		  ; FE E0 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_073
; Address: $F29376
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_073:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_077
; Address: $F293B5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_077:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $78			  ; 30 78 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BVS $7F			  ; 70 7F | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $0E			  ; 30 0E | Branch if negative
	AND ($1D),Y		  ; 31 1D | Logical AND with accumulator ((zero page),Y)
	STZ $17			  ; 64 17 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_078
; Address: $F29434
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_078:
	JSR $2032			; 20 32 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ROR $6844			; 6E 44 68 | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$B3			 ; C0 B3 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_079
; Address: $F29447
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_079:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	EOR $DF59			; 4D 59 DF | Exclusive OR with accumulator (absolute)
	STA				  ; 9F FF 00 00 | Store accumulator to absolute long,X
	SBC $FCE1,Y		  ; F9 E1 FC | Subtract with carry (absolute,Y)
	CPY #$B2			 ; C0 B2 | Compare Y register (immediate)
	BRA $38			  ; 80 38 | Branch always
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	ROL $FCB0,X		  ; 3E B0 FC | Rotate left (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STY $90FF			; 8C FF 90 | Store Y register to absolute address
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BRA $87			  ; 80 87 | Branch always
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $FD			  ; 70 FD | Branch if overflow set
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	INC $F8E0,X		  ; FE E0 F8 | Increment (absolute,X)
	DEC $E7E9,X		  ; DE E9 E7 | Decrement (absolute,X)
	SBC $3EFF,Y		  ; F9 FF 3E | Subtract with carry (absolute,Y)
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $7F01,X		  ; FE 01 7F | Increment (absolute,X)
	BRA $1F			  ; 80 1F | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BVS $80			  ; 70 80 | Branch if overflow set
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CPX #$87			 ; E0 87 | Compare X register (immediate)
	BVS $E7			  ; 70 E7 | Branch if overflow set
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_07B
; Address: $F2950D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_07B:
	JSR $0080			; 20 80 00 | Jump to subroutine
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_07C
; Address: $F29519
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_07C:
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $1C1F,X		  ; 1E 1F 1C | Arithmetic shift left (absolute,X)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ADC $7B3F,X		  ; 7D 3F 7B | Add with carry (absolute,X)
	ADC $7C07,Y		  ; 79 07 7C | Add with carry (absolute,Y)
	NOP				  ; EA | No operation
	PEA #$F8F6		   ; F4 F6 F8 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $0EFE			; 0E FE 0E | Arithmetic shift left (absolute)
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	ASL $FEFF,X		  ; 1E FF FE | Arithmetic shift left (absolute,X)
	PEA #$F8E0		   ; F4 E0 F8 | Push effective address to stack
	BPL $FF			  ; 10 FF | Branch if positive
	SBC #$FE			 ; E9 FE | Subtract with carry (immediate)
	INC $FEF2,X		  ; FE F2 FE | Increment (absolute,X)
	SBC $001F,X		  ; FD 1F 00 | Subtract with carry (absolute,X)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_07D
; Address: $F29578
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_07D:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY $F0F3			; CC F3 F0 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $7E			  ; 80 7E | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	BEQ $08			  ; F0 08 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDX $6E61,Y		  ; BE 61 6E | Load from absolute,Y into X register
	ROL $2C27			; 2E 27 2C | Rotate left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	STX $CA			  ; 86 CA | Store X register to zero page
	DEC $C8			  ; C6 C8 | Decrement (zero page)
	DEC $9E			  ; C6 9E | Decrement (zero page)
	BPL $28			  ; 10 28 | Branch if positive
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $09			  ; D0 09 | Branch if not equal
	BEQ $09			  ; F0 09 | Branch if equal
	BEQ $09			  ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_07E
; Address: $F295DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_07E:
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_07F
; Address: $F295F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_07F:
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_081
; Address: $F2960C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_081:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $06FF,X		  ; 1E FF 06 | Arithmetic shift left (absolute,X)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	ASL $07C8			; 0E C8 07 | Arithmetic shift left (absolute)
	CMP $07			  ; C5 07 | Compare accumulator (zero page)
	STA $02			  ; 85 02 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank64_DmaFunction_082
; Address: $F29661
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_082:
	JSR $313F			; 20 3F 31 | Jump to subroutine
	ASL $0C1E,X		  ; 1E 1E 0C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 80 FF C0 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROL $70FF,X		  ; 3E FF 70 | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PEA #$F2F8		   ; F4 F8 F2 | Push effective address to stack
	SBC $F801,Y		  ; F9 01 F8 | Subtract with carry (absolute,Y)
	BPL $FC			  ; 10 FC | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BIT $44F8			; 2C F8 44 | Test bits in accumulator (absolute)
	PEA #$F080		   ; F4 80 F0 | Push effective address to stack
	INC $18			  ; E6 18 | Increment (zero page)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_087
; Address: $F296DC
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_087:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	CPX $ECE8			; EC E8 EC | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	CPX $ECE8			; EC E8 EC | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $30			  ; 10 30 | Branch if positive
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $14			  ; F0 14 | Branch if equal
	CPX #$24			 ; E0 24 | Compare X register (immediate)
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0003			; 0E 03 00 | Arithmetic shift left (absolute)
	ORA $233E,X		  ; 1D 3E 23 | Logical OR with accumulator (absolute,X)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $F3			  ; 80 F3 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$21			 ; E0 21 | PPU graphics register access
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_08B
; Address: $F29758
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_08B:
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	BRA $E3			  ; 80 E3 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_08C
; Address: $F29777
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_08C:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVS $1F			  ; 70 1F | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	AND ($50),Y		  ; 31 50 | Logical AND with accumulator ((zero page),Y)
	LDY #$C2			 ; A0 C2 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_08F
; Address: $F297E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_08F:
	JSR $70D8			; 20 D8 70 | Jump to subroutine
	BMI $0C			  ; 30 0C | Branch if negative
	SEC				  ; 38 | Set carry flag
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_090
; Address: $F297F2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_090:
	JSR $5020			; 20 20 50 | Jump to subroutine
	BVS $88			  ; 70 88 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $F8			  ; 10 F8 | Branch if positive
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $66			  ; 06 66 | Arithmetic shift left (zero page)
	JMP $DE58			; 4C 58 DE | Jump to address
	STZ $BEFE,X		  ; 9E FE BE | Store zero to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_092
; Address: $F2987B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_092:
	ORA $1910,Y		  ; 19 10 19 | Logical OR with accumulator (absolute,Y)
	STZ $0001,X		  ; 9E 01 00 | Store zero to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_094
; Address: $F29898
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_094:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	STX $80			  ; 86 80 | Store X register to zero page
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	STX $38			  ; 86 38 | Store X register to zero page
	ASL $B8			  ; 06 B8 | Arithmetic shift left (zero page)
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	DEC $98			  ; C6 98 | Decrement (zero page)
	ROR $08			  ; 66 08 | Rotate right (zero page)
	WDM #$57			 ; 42 57 | Reserved instruction
	REP #$D7			 ; C2 D7 | Reset processor status bits
	REP #$F7			 ; C2 F7 | Reset processor status bits
	INC $D3			  ; E6 D3 | Increment (zero page)
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_095
; Address: $F2995E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_095:
	BMI $BC			  ; 30 BC | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	AND $2A2F			; 2D 2F 2A | Logical AND with accumulator (absolute)
	ROL $C6CA			; 2E CA C6 | Rotate left (absolute)
	INY				  ; C8 | Increment Y register
	DEC $E8			  ; C6 E8 | Decrement (zero page)
	CPX $ECE8			; EC E8 EC | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	CPX $D028			; EC 28 D0 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_096
; Address: $F299B2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_096:
	JSR $21D0			; 20 D0 21 | PPU graphics register access
	BNE $09			  ; D0 09 | Branch if not equal
	BEQ $09			  ; F0 09 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	INC $FF			  ; E6 FF | Increment (zero page)
	SEC				  ; 38 | Set carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $0E			  ; 30 0E | Branch if negative
	ADC ($1C),Y		  ; 71 1C | Add with carry ((zero page),Y)
	ORA ($60),Y		  ; 11 60 | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_097
; Address: $F29A13
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_097:
	JSR $2030			; 20 30 20 | Jump to subroutine
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	WDM #$63			 ; 42 63 | Reserved instruction
	WDM #$60			 ; 42 60 | Reserved instruction
	LSR $FF0E			; 4E 0E FF | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 60 7F 80 | Store accumulator to absolute long,X
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BMI $0C			  ; 30 0C | Branch if negative
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_098
; Address: $F29A35
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_098:
	JSR $0280			; 20 80 02 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_09B
; Address: $F29A5E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_09B:
	BEQ $00			  ; F0 00 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_09C
; Address: $F29A84
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_09C:
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BMI $0F			  ; 30 0F | Branch if negative
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	STA $E49EA2		  ; 8F A2 9E E4 | Store accumulator to absolute long address
	LSR $5ECC,X		  ; 5E CC 5E | Logical shift right (absolute,X)
	CPY $F00F			; CC 0F F0 | Compare Y register (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BNE $C0			  ; D0 C0 | Branch if not equal
	BCC $60			  ; 90 60 | Branch if carry clear
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BMI $0F			  ; 30 0F | Branch if negative
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $0E			  ; F0 0E | Branch if equal
	BRA $06			  ; 80 06 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STX $0606			; 8E 06 06 | Store X register to absolute address
	BRA $60			  ; 80 60 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_09E
; Address: $F29B00
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_09E:
	INX				  ; E8 | Increment X register
	CPX $E8E8			; EC E8 E8 | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	BPL $30			  ; 10 30 | Branch if positive
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $F9EF,Y		  ; F9 EF F9 | Subtract with carry (absolute,Y)
	SBC $F9EF,Y		  ; F9 EF F9 | Subtract with carry (absolute,Y)
	SBC $F11F,Y		  ; F9 1F F1 | Subtract with carry (absolute,Y)
	AND $1F0F,X		  ; 3D 0F 1F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_09F
; Address: $F29B40
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_09F:
	STY $CE80			; 8C 80 CE | Store Y register to absolute address
	CPY #$DD			 ; C0 DD | Compare Y register (immediate)
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	LDX $BEFF,Y		  ; BE FF BE | Load from absolute,Y into X register
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $FCFF,X		  ; FD FF FC | Subtract with carry (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	INC $C100,X		  ; FE 00 C1 | Increment (absolute,X)
	ORA $7DE1,X		  ; 1D E1 7D | Logical OR with accumulator (absolute,X)
	STA ($F7,X)		  ; 81 F7 | Store accumulator to (zero page,X)
	ROR $1A03			; 6E 03 1A | Rotate right (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $0E			  ; 30 0E | Branch if negative
	SEP #$00			 ; E2 00 | Set processor status bits
	ASL $1E0C			; 0E 0C 1E | Arithmetic shift left (absolute)
	STZ $FCFE			; 9C FE FC | Store zero to absolute
	ROR $60FE,X		  ; 7E FE 60 | Rotate right (absolute,X)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SEP #$00			 ; E2 00 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	DEC $FE7F,X		  ; DE 7F FE | Decrement (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $BEFF,X		  ; FE FF BE | Increment (absolute,X)
	LDY $F7FE,X		  ; BC FE F7 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $01			  ; 86 01 | Store X register to zero page
	SEP #$00			 ; E2 00 | Set processor status bits
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A0
; Address: $F29C01
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A0:
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE2A,X		  ; FE 2A FE | Increment (absolute,X)
	DEC $0F3F,X		  ; DE 3F 0F | Decrement (absolute,X)
	SBC $211F,Y		  ; F9 1F 21 | PPU graphics register access
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A1
; Address: $F29C18
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A1:
	JSR $F0FF			; 20 FF F0 | Jump to subroutine
	SBC ($DF),Y		  ; F1 DF | Subtract with carry ((zero page),Y)
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $FF			  ; B0 FF | Branch if carry set
	BCS $FF			  ; B0 FF | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A3
; Address: $F29C39
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A3:
	SBC $FCCC,X		  ; FD CC FC | Subtract with carry (absolute,X)
	BRA $F1			  ; 80 F1 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $42			  ; F0 42 | Hardware register operation
	CPY $E020			; CC 20 E0 | Game work RAM access
	BMI $60			  ; 30 60 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	ASL $9800,X		  ; 1E 00 98 | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	STZ $18FE			; 9C FE 18 | Store zero to absolute
	LDY $9C08,X		  ; BC 08 9C | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	STZ $0C00			; 9C 00 0C | Store zero to absolute
	STZ $38F8			; 9C F8 38 | Store zero to absolute
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A4
; Address: $F29CD4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A4:
	BRA $FF			  ; 80 FF | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A5
; Address: $F29D10
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A5:
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $7804,X		  ; 3E 04 78 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	ROL $7048,X		  ; 3E 48 70 | Rotate left (absolute,X)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A6
; Address: $F29DDD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A6:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BVS $1F			  ; 70 1F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A7
; Address: $F29DED
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A7:
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$14			 ; C0 14 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BMI $30			  ; 30 30 | Branch if negative
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	ADC ($60,X)		  ; 61 60 | Add with carry ((zero page,X))
	LDY #$C3			 ; A0 C3 | Load immediate value into Y register
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A8
; Address: $F29E13
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A8:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $4080,X		  ; FE 80 40 | Increment (absolute,X)
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FF1E,X		  ; FE 1E FF | Increment (absolute,X)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	STY $77			  ; 84 77 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	TSX				  ; BA | Transfer stack pointer to X register
	STA ($F1,X)		  ; 81 F1 | Store accumulator to (zero page,X)
	BRA $C3			  ; 80 C3 | Branch always
	STY $84			  ; 84 84 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ADC $7AFC,Y		  ; 79 FC 7A | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $1800			; EC 00 18 | Compare X register (absolute)
	BNE $18			  ; D0 18 | Branch if not equal
	CMP ($11),Y		  ; D1 11 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0A9
; Address: $F29E71
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0A9:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$A3			 ; C0 A3 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	INC $0F02,X		  ; FE 02 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0AA
; Address: $F29EBA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0AA:
	JSL $FF02FF		  ; 22 FF 02 FF | Jump to subroutine long
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BRA $C1			  ; 80 C1 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $FC			  ; F0 FC | Branch if equal
	PEA #$F3FE		   ; F4 FE F3 | Push effective address to stack
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0AB
; Address: $F29EDA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0AB:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BEQ $BC			  ; F0 BC | Branch if equal
	JMP ($EC3E)		  ; 6C 3E EC | Jump to address (absolute indirect)
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0AC
; Address: $F29EF1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0AC:
	RTI				  ; 40 | Return from interrupt
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0AE
; Address: $F29F1C
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0AE:
	BRA $00			  ; 80 00 | Branch always
	BIT $D8F8			; 2C F8 D8 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	INC $3F			  ; E6 3F | Increment (zero page)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $38			  ; 80 38 | Branch always
	CLV				  ; B8 | Clear overflow flag
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $1807,Y		  ; 19 07 18 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $70			  ; F0 70 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0AF
; Address: $F2A006
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0AF:
	ASL $42			  ; 06 42 | Hardware register operation
	ASL $42			  ; 06 42 | Hardware register operation
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	BRA $42			  ; 80 42 | Hardware register operation
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $7C			  ; 10 7C | Branch if positive
	BPL $7E			  ; 10 7E | Branch if positive
	BPL $7E			  ; 10 7E | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $1E04,X		  ; 1E 04 1E | Arithmetic shift left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $AF			  ; 80 AF | Branch always
	LDA				  ; BF 23 BF 10 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	STY $86EF			; 8C EF 86 | Store Y register to absolute address
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B1
; Address: $F2A0F8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B1:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $03			  ; 10 03 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B2
; Address: $F2A1AC
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B2:
	JSR $90FC			; 20 FC 90 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BRA $02			  ; 80 02 | Branch always
	CPY #$42			 ; C0 42 | Hardware register operation
	WDM #$66			 ; 42 66 | Reserved instruction
	WDM #$18			 ; 42 18 | Reserved instruction
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $7E18,X		  ; 7E 18 7E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $0B			  ; 10 0B | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $A2			  ; 80 A2 | Branch always
	INC $E71C			; EE 1C E7 | Increment (absolute)
	ORA $3EC3,X		  ; 1D C3 3E | Logical OR with accumulator (absolute,X)
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B3
; Address: $F2A21D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B3:
	ASL $F1			  ; 06 F1 | Arithmetic shift left (zero page)
	ASL $1018			; 0E 18 10 | Arithmetic shift left (absolute)
	ORA ($20),Y		  ; 11 20 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	STZ $98			  ; 64 98 | Store zero to zero page
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	STA $E858,Y		  ; 99 58 E8 | Store accumulator to absolute,Y
	CMP ($AC),Y		  ; D1 AC | Compare accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BVC $88			  ; 50 88 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	CPY #$0B			 ; C0 0B | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	BMI $FC			  ; 30 FC | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B4
; Address: $F2A254
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B4:
	JSR $01FE			; 20 FE 01 | Jump to subroutine
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B5
; Address: $F2A263
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B5:
	JSR $403F			; 20 3F 40 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 40 DF 21 | Load from absolute long,X into accumulator
	LDA ($1F),Y		  ; B1 1F | Load from (zero page),Y into accumulator
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	INY				  ; C8 | Increment Y register
	BRA $84			  ; 80 84 | Branch always
	DEY				  ; 88 | Decrement Y register
	ROR $E0C2,X		  ; 7E C2 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	STA ($13,X)		  ; 81 13 | Store accumulator to (zero page,X)
	BRA $0B			  ; 80 0B | Branch always
	BCS $07			  ; B0 07 | Branch if carry set
	ORA $0B0B			; 0D 0B 0B | Logical OR with accumulator (absolute)
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	CMP $24EB,Y		  ; D9 EB 24 | Compare accumulator (absolute,Y)
	BRA $F9			  ; 80 F9 | Branch always
	REP #$F9			 ; C2 F9 | Reset processor status bits
	INC $00			  ; E6 00 | Increment (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $84			  ; 24 84 | Test bits in accumulator (zero page)
	REP #$3E			 ; C2 3E | Reset processor status bits
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ROL $40C0,X		  ; 3E C0 40 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B6
; Address: $F2A2D6
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B6:
	BPL $3C			  ; 10 3C | Branch if positive
	BPL $FA			  ; 10 FA | Branch if positive
	SBC $FE00,Y		  ; F9 00 FE | Subtract with carry (absolute,Y)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	ORA $31CF			; 0D CF 31 | Logical OR with accumulator (absolute)
	ORA $5C			  ; 05 5C | Logical OR with accumulator (zero page)
	BIT $30F0			; 2C F0 30 | Test bits in accumulator (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$FC03		   ; F4 03 FC | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $3FFF,X		  ; FE FF 3F | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	STA $4E8107		  ; 8F 07 81 4E | Store accumulator to absolute long address
	ORA $0720			; 0D 20 07 | Logical OR with accumulator (absolute)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ASL $FF00			; 0E 00 FF | Arithmetic shift left (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FD			  ; 30 FD | Branch if negative
	ASL $7CD0			; 0E D0 7C | Arithmetic shift left (absolute)
	JMP ($5CEC)		  ; 6C EC 5C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BRA $44			  ; 80 44 | Branch always
	BRA $18			  ; 80 18 | Branch always
	BRA $60			  ; 80 60 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ASL $1706			; 0E 06 17 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $3521,X		  ; 1E 21 35 | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $51			  ; 24 51 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B7
; Address: $F2A3CE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B7:
	LDA ($D1,X)		  ; A1 D1 | Load from (zero page,X) into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($0A),Y		  ; 71 0A | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B8
; Address: $F2A3DE
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B8:
	PLA				  ; 68 | Pull accumulator from stack
	STA				  ; 9F C0 BE C0 | Store accumulator to absolute long,X
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	CMP $83			  ; C5 83 | Compare accumulator (zero page)
	EOR $23FF			; 4D FF 23 | Exclusive OR with accumulator (absolute)
	SBC $7BA7,X		  ; FD A7 7B | Subtract with carry (absolute,X)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	DEC $B03F,X		  ; DE 3F B0 | Decrement (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY $72			  ; A4 72 | Load from zero page into Y register
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	SBC ($F0,X)		  ; E1 F0 | Subtract with carry ((zero page,X))
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	BRA $C1			  ; 80 C1 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	INX				  ; E8 | Increment X register
	BNE $FF			  ; D0 FF | Branch if not equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($25),Y		  ; 11 25 | Logical OR with accumulator ((zero page),Y)
	ORA ($5B),Y		  ; 11 5B | Logical OR with accumulator ((zero page),Y)
	AND $D7			  ; 25 D7 | Logical AND with accumulator (zero page)
	ADC #$AE			 ; 69 AE | Add with carry (immediate)
	DEY				  ; 88 | Decrement Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC ($AE),Y		  ; F1 AE | Subtract with carry ((zero page),Y)
	LDX $6EF3			; AE F3 6E | Load from absolute address into X register
	JMP $E65DE7		  ; 5C E7 5D E6 | Jump to address long
	LDA $BBC6,X		  ; BD C6 BB | Load from absolute,X into accumulator
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0B9
; Address: $F2A45F
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0B9:
	BRA $3C			  ; 80 3C | Branch always
	CMP $9B78			; CD 78 9B | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $37			  ; F0 37 | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $43FE,X		  ; 5D FE 43 | Exclusive OR with accumulator (absolute,X)
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA $0CFD			; 8D FD 0C | Store accumulator to absolute address
	SBC $1F00,X		  ; FD 00 1F | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROR $007E			; 6E 7E 00 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7900,X		  ; 1E 00 79 | Arithmetic shift left (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ADC ($FE),Y		  ; 71 FE | Add with carry ((zero page),Y)
	INC $7FFD,X		  ; FE FD 7F | Increment (absolute,X)
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	STA $008300		  ; 8F 00 83 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BA
; Address: $F2A50B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BA:
	STA				  ; 9F BF 5F DF | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BPL $03			  ; 10 03 | Branch if positive
	BVS $52			  ; 70 52 | Branch if overflow set
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	ASL $1F0C			; 0E 0C 1F | Arithmetic shift left (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	BNE $7E			  ; D0 7E | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $02			  ; 80 02 | Branch always
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ADC ($B7),Y		  ; 71 B7 | Add with carry ((zero page),Y)
	DEC $CF22			; CE 22 CF | Decrement (absolute)
	INC $1F			  ; E6 1F | Increment (zero page)
	LDY $FF4F,X		  ; BC 4F FF | Load from absolute,X into Y register
	ROR $00FE,X		  ; 7E FE 00 | Rotate right (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BEQ $6F			  ; F0 6F | Branch if equal
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	CPY $CFEF			; CC EF CF | Compare Y register (absolute)
	ADC $F0EE			; 6D EE F0 | Add with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BB
; Address: $F2A5D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BB:
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	BCS $0F			  ; B0 0F | Branch if carry set
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BC
; Address: $F2A5E0
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BC:
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	INC $DA01,X		  ; FE 01 DA | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PEA #$EB0F		   ; F4 0F EB | Push effective address to stack
	ORA $3D27,X		  ; 1D 27 3D | Logical OR with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	STA				  ; 9F 95 7E EB | Store accumulator to absolute long,X
	SBC $D7FE,X		  ; FD FE D7 | Subtract with carry (absolute,X)
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	CPX $007F			; EC 7F 00 | Compare X register (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $97			  ; F0 97 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA $9B77			; 8D 77 9B | Store accumulator to absolute address
	LDX $7CDF,Y		  ; BE DF 7C | Load from absolute,Y into X register
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	ASL $9CFF,X		  ; 1E FF 9C | Arithmetic shift left (absolute,X)
	INC $FCBC,X		  ; FE BC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BD
; Address: $F2A66C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BD:
	JSR $B060			; 20 60 B0 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BE
; Address: $F2A67C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BE:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0BF
; Address: $F2A6BB
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0BF:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDY $78DF,X		  ; BC DF 78 | Load from absolute,X into Y register
	LDA				  ; BF F9 7F FE | Load from absolute long,X into accumulator
	INC $7D7D,X		  ; FE 7D 7D | Increment (absolute,X)
	ADC $B97D,X		  ; 7D 7D B9 | Add with carry (absolute,X)
	CMP $C7			  ; C5 C7 | Compare accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY $80			  ; C4 80 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPY #$7A			 ; C0 7A | Compare Y register (immediate)
	SBC $CEC9,X		  ; FD C9 CE | Subtract with carry (absolute,X)
	PEA #$F3FB		   ; F4 FB F3 | Push effective address to stack
	SBC $FBF4,X		  ; FD F4 FB | Subtract with carry (absolute,X)
	SBC $FEF9,X		  ; FD F9 FE | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $0501,X		  ; FD 01 05 | Subtract with carry (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F F7 CF F7 | Store accumulator to absolute long,X
	XBA				  ; EB | Exchange accumulator bytes
	PEA #$FFFB		   ; F4 FB FF | Push effective address to stack
	SBC $F77F,Y		  ; F9 7F F7 | Subtract with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	STX $9F08			; 8E 08 9F | Store X register to absolute address
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	STA ($4E,X)		  ; 81 4E | Store accumulator to (zero page,X)
	ORA $0720			; 0D 20 07 | Logical OR with accumulator (absolute)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BMI $FD			  ; 30 FD | Branch if negative
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	INC $FE6A,X		  ; FE 6A FE | Increment (absolute,X)
	INC $9CEE			; EE EE 9C | Increment (absolute)
	STZ $F0F0			; 9C F0 F0 | Store zero to absolute
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C0
; Address: $F2A776
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C0:
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0002,X		  ; 1E 02 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ADC $8785,Y		  ; 79 85 87 | Add with carry (absolute,Y)
	LDY $9EBF,X		  ; BC BF 9E | Load from absolute,X into Y register
	LDA				  ; BF 5F FF 3F | Load from absolute long,X into accumulator
	STX $00			  ; 86 00 | Store X register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $2EEE			; 2D EE 2E | Logical AND with accumulator (absolute)
	ROL $5DED			; 2E ED 5D | Rotate left (absolute)
	DEC $9E9F,X		  ; DE 9F 9E | Decrement (absolute,X)
	LSR $DF5F,X		  ; 5E 5F DF | Logical shift right (absolute,X)
	CMP $11DD,X		  ; DD DD 11 | Compare accumulator (absolute,X)
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C2
; Address: $F2A7DE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C2:
	JSL $7FAF00		  ; 22 00 AF 7F | Jump to subroutine long
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	STA				  ; 9F 7F 8F 7F | Store accumulator to absolute long,X
	STY $D22D			; 8C 2D D2 | Store Y register to absolute address
	LDA $FF90			; AD 90 FF | Load from absolute address into accumulator
	BRA $CF			  ; 80 CF | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C3
; Address: $F2A7FA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C3:
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	DEC $7E37,X		  ; DE 37 7E | Decrement (absolute,X)
	SBC ($D6),Y		  ; F1 D6 | Subtract with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	SEP #$ED			 ; E2 ED | Set processor status bits
	DEC $D9D1			; CE D1 D9 | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C4
; Address: $F2A80E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C4:
	DEX				  ; CA | Decrement X register
	AND #$F3			 ; 29 F3 | Logical AND with accumulator (immediate)
	ORA $26			  ; 05 26 | Logical OR with accumulator (zero page)
	JMP $7CE87E		  ; 5C 7E E8 7C | Jump to address long
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C5
; Address: $F2A822
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C5:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STY $30FC			; 8C FC 30 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP $DD			  ; C5 DD | Compare accumulator (zero page)
	CMP $DD			  ; C5 DD | Compare accumulator (zero page)
	CMP $DD			  ; C5 DD | Compare accumulator (zero page)
	STA $BD			  ; 85 BD | Store accumulator to zero page
	STA $0DBD			; 8D BD 0D | Store accumulator to absolute address
	AND $DA5B,X		  ; 3D 5B DA | Logical AND with accumulator (absolute,X)
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	CPX $F4F4			; EC F4 F4 | Compare X register (absolute)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C6
; Address: $F2A875
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C6:
	BCS $FF			  ; B0 FF | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	DEC $DFFF,X		  ; DE FF DF | Decrement (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C7
; Address: $F2A889
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C7:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BVS $88			  ; 70 88 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0CFF			; 0E FF 0C | Arithmetic shift left (absolute)
	INC $F61C,X		  ; FE 1C F6 | Increment (absolute,X)
	INC $24			  ; E6 24 | Increment (zero page)
	SEP #$22			 ; E2 22 | Set processor status bits
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	ASL $F7			  ; 06 F7 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($97),Y		  ; 91 97 | Store accumulator to (zero page),Y
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $B4EF			; 2C EF B4 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C8
; Address: $F2A8CC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C8:
	DEC $3FFF,X		  ; DE FF 3F | Decrement (absolute,X)
	INX				  ; E8 | Increment X register
	BRA $90			  ; 80 90 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	SBC $FE			  ; E5 FE | Subtract with carry (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ORA $05FF,Y		  ; 19 FF 05 | Logical OR with accumulator (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $3FED,X		  ; FE ED 3F | Increment (absolute,X)
	CPX $77FF			; EC FF 77 | Compare X register (absolute)
	CLV				  ; B8 | Clear overflow flag
	STA				  ; 9F FE E5 13 | Store accumulator to absolute long,X
	DEY				  ; 88 | Decrement Y register
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0C9
; Address: $F2A91B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0C9:
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CA
; Address: $F2A92E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CA:
	STA				  ; 9F 60 03 03 | Store accumulator to absolute long,X
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	ORA ($27),Y		  ; 11 27 | Logical OR with accumulator ((zero page),Y)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	AND #$6E			 ; 29 6E | Logical AND with accumulator (immediate)
	ASL $1F0C			; 0E 0C 1F | Arithmetic shift left (absolute)
	BIT $401F			; 2C 1F 40 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $9C			  ; 80 9C | Branch always
	STZ $0E			  ; 64 0E | Store zero to zero page
	INC $009E,X		  ; FE 9E 00 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $60			  ; 84 60 | Store Y register to zero page
	BEQ $62			  ; F0 62 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CB
; Address: $F2A97C
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CB:
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $1917			; 0D 17 19 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($7B,X)		  ; 01 7B | Logical OR with accumulator ((zero page,X))
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	LDA $BAFA,X		  ; BD FA BA | Load from absolute,X into accumulator
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	INC $FE5C,X		  ; FE 5C FE | Increment (absolute,X)
	SBC $F8D8,X		  ; FD D8 F8 | Subtract with carry (absolute,X)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $ED			  ; F0 ED | Branch if equal
	SBC $EEEC			; ED EC EE | Subtract with carry (absolute)
	STX $F7			  ; 86 F7 | Store X register to zero page
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	ROR $FF60,X		  ; 7E 60 FF | Rotate right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	NOP				  ; EA | No operation
	INC $1F07,X		  ; FE 07 1F | Increment (absolute,X)
	SBC $FE0F,Y		  ; F9 0F FE | Subtract with carry (absolute,Y)
	ASL $0E3C,X		  ; 1E 3C 0E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $0E07,X		  ; 1D 07 0E | Logical OR with accumulator (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $5F			  ; E6 5F | Increment (zero page)
	CPX $7E			  ; E4 7E | Compare X register (zero page)
	PEA #$F4ED		   ; F4 ED F4 | Push effective address to stack
	CMP $9BF8			; CD F8 9B | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F7			  ; F0 F7 | Branch if equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	BVS $38			  ; 70 38 | Branch if overflow set
	ADC ($58),Y		  ; 71 58 | Add with carry ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPX $70			  ; E4 70 | Compare X register (zero page)
	STY $E0			  ; 84 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	BRA $08			  ; 80 08 | Branch always
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CC
; Address: $F2AA2A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CC:
	BMI $BF			  ; 30 BF | Branch if negative
	AND ($BE,X)		  ; 21 BE | Logical AND with accumulator ((zero page,X))
	WDM #$7C			 ; 42 7C | Reserved instruction
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CD
; Address: $F2AA38
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CD:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BEQ $1B			  ; F0 1B | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA $0DFC			; 0D FC 0D | Logical OR with accumulator (absolute)
	CMP $3C			  ; C5 3C | Compare accumulator (zero page)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CMP ($83,X)		  ; C1 83 | Compare accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $FC76,X		  ; FE 76 FC | Increment (absolute,X)
	STZ $FC			  ; 64 FC | Store zero to zero page
	CPX $C8F8			; EC F8 C8 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	INC $DCFE			; EE FE DC | Increment (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $B8			  ; F0 B8 | Branch if equal
	CPY $BC			  ; C4 BC | Compare Y register (zero page)
	REP #$FC			 ; C2 FC | Reset processor status bits
	REP #$5C			 ; C2 5C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CE
; Address: $F2AA89
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CE:
	JSL $38223C		  ; 22 3C 22 38 | Jump to subroutine long
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	BRA $FE			  ; 80 FE | Branch always
	BRA $FE			  ; 80 FE | Branch always
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BVS $51			  ; 70 51 | Branch if overflow set
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0CF
; Address: $F2AAAD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0CF:
	JSL $E11D04		  ; 22 04 1D E1 | Jump to subroutine long
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ORA $4747,X		  ; 1D 47 47 | Logical OR with accumulator (absolute,X)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D0
; Address: $F2AAC5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D0:
	INC $FF33,X		  ; FE 33 FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D1
; Address: $F2AAD0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D1:
	CLV				  ; B8 | Clear overflow flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $719F,X		  ; 9E 9F 71 | Store zero to absolute,X
	BIT #$5C			 ; 89 5C | Test bits in accumulator (immediate)
	BIT $30F0			; 2C F0 30 | Test bits in accumulator (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D2
; Address: $F2AAF8
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D2:
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	ASL $1F2B,X		  ; 1E 2B 1F | Arithmetic shift left (absolute,X)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BRA $07			  ; 80 07 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))
	ROR $7F57,X		  ; 7E 57 7F | Rotate right (absolute,X)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $3F			  ; 90 3F | Branch if carry clear
	BRA $1F			  ; 80 1F | Branch always
	BRA $07			  ; 80 07 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	INC $3CDC,X		  ; FE DC 3C | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BNE $D0			  ; D0 D0 | Branch if not equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BEQ $04			  ; F0 04 | Branch if equal
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D3
; Address: $F2AB5A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D3:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF C6 FF 86 | Load from absolute long,X into accumulator
	STX $89F9			; 8E F9 89 | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	INC $EF0F			; EE 0F EF | Increment (absolute)
	DEC $DC1E,X		  ; DE 1E DC | Decrement (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CMP ($DF,X)		  ; C1 DF | Compare accumulator ((zero page,X))
	LDA				  ; BF 82 FF 04 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D4
; Address: $F2ABF4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D4:
	JSR $4000			; 20 00 40 | Jump to subroutine
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PEA #$EC27		   ; F4 27 EC | Push effective address to stack
	CMP $F295,Y		  ; D9 95 F2 | Compare accumulator (absolute,Y)
	STY $3403			; 8C 03 34 | Store Y register to absolute address
	ORA #$81			 ; 09 81 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D5
; Address: $F2AC16
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D5:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	STA $1C			  ; 85 1C | Store accumulator to zero page
	CMP $F51C			; CD 1C F5 | Compare accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDX $39D8			; AE D8 39 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D6
; Address: $F2AC2E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D6:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SBC ($03),Y		  ; F1 03 | Subtract with carry ((zero page),Y)
	SBC ($03),Y		  ; F1 03 | Subtract with carry ((zero page),Y)
	ADC ($0B),Y		  ; 71 0B | Add with carry ((zero page),Y)
	BMI $06			  ; 30 06 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	INC $FF02,X		  ; FE 02 FF | Increment (absolute,X)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BVS $48			  ; 70 48 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $83E1,X		  ; 1E E1 83 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D7
; Address: $F2ACAC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D7:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BRA $BF			  ; 80 BF | Branch always
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D8
; Address: $F2ACC8
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D8:
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	STY $3E			  ; 84 3E | Store Y register to zero page
	REP #$00			 ; C2 00 | Reset processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $1F22,X		  ; 3E 22 1F | Rotate left (absolute,X)
	ORA $0606,Y		  ; 19 06 06 | Logical OR with accumulator (absolute,Y)
	ROL $1F00,X		  ; 3E 00 1F | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1F1C,Y		  ; 19 1C 1F | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	ORA ($77),Y		  ; 11 77 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ROL $01			  ; 26 01 | Rotate left (zero page)
	ADC $9900,X		  ; 7D 00 99 | Add with carry (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	BVS $08			  ; 70 08 | Branch if overflow set
	LDA $FF58			; AD 58 FF | Load from absolute address into accumulator
	BVS $83			  ; 70 83 | Branch if overflow set
	STA $E00000		  ; 8F 00 00 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	STA $03FF00		  ; 8F 00 FF 03 | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BVS $B0			  ; 70 B0 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0D9
; Address: $F2ADA6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0D9:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DA
; Address: $F2ADB8
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DA:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	ADC $02AE			; 6D AE 02 | Add with carry (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $AF			  ; 10 AF | Branch if positive
	BRA $43			  ; 80 43 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL $C0ED			; 2E ED C0 | Rotate left (absolute)
	REP #$00			 ; C2 00 | Reset processor status bits
	SBC $C200			; ED 00 C2 | Subtract with carry (absolute)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $D100			; 0E 00 D1 | Arithmetic shift left (absolute)
	ASL $DF06			; 0E 06 DF | Arithmetic shift left (absolute)
	ORA ($63,X)		  ; 01 63 | Logical OR with accumulator ((zero page,X))
	INC $7D01			; EE 01 7D | Increment (absolute)
	STY $1E			  ; 84 1E | Store Y register to zero page
	SBC ($0E,X)		  ; E1 0E | Subtract with carry ((zero page,X))
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC ($2F,X)		  ; E1 2F | Subtract with carry ((zero page,X))
	BEQ $1F			  ; F0 1F | Branch if equal
	BEQ $97			  ; F0 97 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	INC $0002,X		  ; FE 02 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DB
; Address: $F2AECD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DB:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF E0 7F C0 | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DC
; Address: $F2AF05
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DC:
	JSL $3C243C		  ; 22 3C 24 3C | Jump to subroutine long
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DD
; Address: $F2AF2D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DD:
	JSR $3010			; 20 10 30 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DE
; Address: $F2AF4B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DE:
	JSR $0070			; 20 70 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0DF
; Address: $F2AF6B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0DF:
	STZ $E0			  ; 64 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	BVS $87			  ; 70 87 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E0
; Address: $F2AFA8
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E0:
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $C1BFF0		  ; 8F F0 BF C1 | Store accumulator to absolute long address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INC $7F06,X		  ; FE 06 7F | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BVS $0F			  ; 70 0F | Branch if overflow set
	STA $609F70		  ; 8F 70 9F 60 | Store accumulator to absolute long address
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	INC $FC77,X		  ; FE 77 FC | Increment (absolute,X)
	SBC $F6FB			; ED FB F6 | Subtract with carry (absolute)
	INC $F8E8,X		  ; FE E8 F8 | Increment (absolute,X)
	BNE $F0			  ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E2
; Address: $F2B02F
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E2:
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	REP #$3E			 ; C2 3E | Reset processor status bits
	ASL $040A			; 0E 0A 04 | Arithmetic shift left (absolute)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ROL $0E00,X		  ; 3E 00 0E | Rotate left (absolute,X)
	ORA $0D09			; 0D 09 0D | Logical OR with accumulator (absolute)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F0A			; 0E 0A 1F | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E3
; Address: $F2B0AE
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E3:
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $671E,X		  ; 1D 1E 67 | Logical OR with accumulator (absolute,X)
	ADC $C7BF,Y		  ; 79 BF C7 | Add with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $02			  ; 80 02 | Branch always
	BVS $81			  ; 70 81 | Branch if overflow set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $02			  ; 80 02 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BRA $F8			  ; 80 F8 | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E4
; Address: $F2B0FE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E4:
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E5
; Address: $F2B10F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E5:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STZ $E0			  ; 64 E0 | Game work RAM access
	STA $8670,Y		  ; 99 70 86 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E6
; Address: $F2B12A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E6:
	STX $8C8C			; 8E 8C 8C | Store X register to absolute address
	CPY $3C18			; CC 18 3C | Compare Y register (absolute)
	BCC $FC			  ; 90 FC | Branch if carry clear
	STA $9F41,Y		  ; 99 41 9F | Store accumulator to absolute,Y
	PHB				  ; 8B | Push data bank register to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BVS $FF			  ; 70 FF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E8
; Address: $F2B145
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E8:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0E9
; Address: $F2B166
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0E9:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0EA
; Address: $F2B174
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0EA:
	BMI $FF			  ; 30 FF | Branch if negative
	ORA $02FF,Y		  ; 19 FF 02 | Logical OR with accumulator (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0EB
; Address: $F2B181
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0EB:
	JSR $1000			; 20 00 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0EC
; Address: $F2B186
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0EC:
	JSR $0048			; 20 48 00 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $04			  ; 80 04 | Branch always
	CPY $8004			; CC 04 80 | Compare Y register (absolute)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0ED
; Address: $F2B195
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0ED:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	BMI $FC			  ; 30 FC | Branch if negative
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	SBC $FBFE,X		  ; FD FE FB | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F2FF,Y		  ; F9 FF F2 | Subtract with carry (absolute,Y)
	CPX $FFF5			; EC F5 FF | Compare X register (absolute)
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	AND ($7E,X)		  ; 21 7E | Logical AND with accumulator ((zero page,X))
	STX $F8			  ; 86 F8 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0EE
; Address: $F2B1CF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0EE:
	BRA $FE			  ; 80 FE | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	STY $78			  ; 84 78 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0EF
; Address: $F2B1F5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0EF:
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	BPL $00			  ; 10 00 | Branch if positive
	ROR $3C42,X		  ; 7E 42 3C | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ASL $0112,X		  ; 1E 12 01 | Arithmetic shift left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	STA $FF0FFF		  ; 8F FF 0F FF | Store accumulator to absolute long address
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0F0
; Address: $F2B25D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0F0:
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ROR $BF7F,X		  ; 7E 7F BF | Rotate right (absolute,X)
	LDA				  ; BF BF BF BF | Load from absolute long,X into accumulator
	LDA				  ; BF DF DF CF | Load from absolute long,X into accumulator
	CMP $80CD			; CD CD 80 | Compare accumulator (absolute)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX $F2C0			; EC C0 F2 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	LDX #$D8			 ; A2 D8 | Load immediate value into X register
	BRA $61			  ; 80 61 | Branch always
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	STA $CECE8F		  ; 8F 8F CE CE | Store accumulator to absolute long address
	SBC $00F8,Y		  ; F9 F8 00 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 88 FF B0 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0F5
; Address: $F2B2CB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0F5:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CMP $9F20,Y		  ; D9 20 9F | Compare accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0F6
; Address: $F2B2EC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0F6:
	ASL $3EE1,X		  ; 1E E1 3E | Arithmetic shift left (absolute,X)
	CMP ($10,X)		  ; C1 10 | Compare accumulator ((zero page,X))
	BCC $08			  ; 90 08 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0F7
; Address: $F2B303
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0F7:
	BPL $70			  ; 10 70 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $90			  ; 30 90 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0F9
; Address: $F2B30D
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0F9:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	CMP $E9F8,X		  ; DD F8 E9 | Compare accumulator (absolute,X)
	ADC $FCB5,X		  ; 7D B5 FC | Add with carry (absolute,X)
	SBC $F8F5,X		  ; FD F5 F8 | Subtract with carry (absolute,X)
	CMP ($DF,X)		  ; C1 DF | Compare accumulator ((zero page,X))
	CPX $10F1			; EC F1 10 | Compare X register (absolute)
	SBC $FDC8,Y		  ; F9 C8 FD | Subtract with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	SBC $FD08,X		  ; FD 08 FD | Subtract with carry (absolute,X)
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	ASL $DF			  ; 06 DF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0FD
; Address: $F2B389
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0FD:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_0FE
; Address: $F2B3AF
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_0FE:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	AND $78FF,Y		  ; 39 FF 78 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF B8 1F 1C | Load from absolute long,X into accumulator
	ASL $FF0E			; 0E 0E FF | Arithmetic shift left (absolute)
	LDA				  ; BF 1F 1F 0F | Load from absolute long,X into accumulator
	LDA $B7B7AF		  ; AF AF B7 B7 | Load from absolute long address into accumulator
	STA $7F1D,X		  ; 9D 1D 7F | Store accumulator to absolute,X
	BNE $00			  ; D0 00 | Branch if not equal
	INY				  ; C8 | Increment Y register
	BRA $C8			  ; 80 C8 | Branch always
	BRA $C4			  ; 80 C4 | Branch always
	BRA $C4			  ; 80 C4 | Branch always
	BRA $E2			  ; 80 E2 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $F0F8,Y		  ; F9 F8 F0 | Subtract with carry (absolute,Y)
	BEQ $F7			  ; F0 F7 | Branch if equal
	CPX $E8E4			; EC E4 E8 | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	BNE $D0			  ; D0 D0 | Branch if not equal
	BCS $90			  ; B0 90 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_100
; Address: $F2B472
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_100:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $FB			  ; 80 FB | Branch always
	ORA #$E6			 ; 09 E6 | Logical OR with accumulator (immediate)
	ASL $F818,X		  ; 1E 18 F8 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_101
; Address: $F2B4AB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_101:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $FB			  ; 80 FB | Branch always
	ORA #$C2			 ; 09 C2 | Logical OR with accumulator (immediate)
	ROL $FC1C,X		  ; 3E 1C FC | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_102
; Address: $F2B4EB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_102:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC #$CC			 ; E9 CC | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_103
; Address: $F2B50D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_103:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPY #$DE			 ; C0 DE | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $7850,X		  ; FE 50 78 | Increment (absolute,X)
	BNE $F8			  ; D0 F8 | Branch if not equal
	BCC $F8			  ; 90 F8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank64_DmaFunction_105
; Address: $F2B51D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_105:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	STZ $20			  ; 64 20 | Store zero to zero page
	STA				  ; 9F FF 3F F3 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_106
; Address: $F2B54C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_106:
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$F6F7		   ; F4 F7 F6 | Push effective address to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $FC			  ; 80 FC | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_107
; Address: $F2B5AD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_107:
	JSL $021D04		  ; 22 04 1D 02 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ORA $FF00,X		  ; 1D 00 FF | Logical OR with accumulator (absolute,X)
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	BEQ $1C			  ; F0 1C | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_108
; Address: $F2B5D2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_108:
	SEC				  ; 38 | Set carry flag
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10A
; Address: $F2B606
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10A:
	JSR $9000			; 20 00 90 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	REP #$04			 ; C2 04 | Reset processor status bits
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $FE			  ; 10 FE | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	JMP $8407			; 4C 07 84 | Jump to address
	STY $7B			  ; 84 7B | Store Y register to zero page
	LSR $3E64,X		  ; 5E 64 3E | Logical shift right (absolute,X)
	AND ($7F),Y		  ; 31 7F | Logical AND with accumulator ((zero page),Y)
	BMI $FF			  ; 30 FF | Branch if negative
	BRA $3F			  ; 80 3F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BCS $10			  ; B0 10 | Branch if carry set
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10B
; Address: $F2B66B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10B:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BRA $C4			  ; 80 C4 | Branch always
	BVS $44			  ; 70 44 | Branch if overflow set
	ROR $BB4A,X		  ; 7E 4A BB | Rotate right (absolute,X)
	SBC ($43),Y		  ; F1 43 | Subtract with carry ((zero page),Y)
	CMP ($E0,X)		  ; C1 E0 | Game work RAM access
	WDM #$00			 ; 42 00 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $0407,X		  ; FE 07 04 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10C
; Address: $F2B6C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ASL $0712,X		  ; 1E 12 07 | Arithmetic shift left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10D
; Address: $F2B6E7
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10D:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BEQ $08			  ; F0 08 | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1E0A			; 0E 0A 1E | Arithmetic shift left (absolute)
	ASL $0716,X		  ; 1E 16 07 | Arithmetic shift left (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA $08FB,Y		  ; 19 FB 08 | Logical OR with accumulator (absolute,Y)
	SBC $FF01,X		  ; FD 01 FF | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF B0 CF C8 | Load from absolute long,X into accumulator
	ADC $07FD,X		  ; 7D FD 07 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $1C1E,X		  ; 1E 1E 1C | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDX $BEC1,Y		  ; BE C1 BE | Load from absolute,Y into X register
	CMP ($BE,X)		  ; C1 BE | Compare accumulator ((zero page,X))
	CMP ($1E,X)		  ; C1 1E | Compare accumulator ((zero page,X))
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10E
; Address: $F2B7CD
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10E:
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BRA $02			  ; 80 02 | Branch always
	BRA $01			  ; 80 01 | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	INC $FE3C,X		  ; FE 3C FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F BF 1F BF | Store accumulator to absolute long,X
	ASL $21DF,X		  ; 1E DF 21 | PPU graphics register access
	INC $67			  ; E6 67 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $50			  ; F0 50 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	BCC $EF			  ; 90 EF | Branch if carry clear
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $091E			; 0E 1E 09 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_10F
; Address: $F2B896
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_10F:
	JSR $2100			; 20 00 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1F16,X		  ; 1E 16 1F | Arithmetic shift left (absolute,X)
	STA $FF0FFF		  ; 8F FF 0F FF | Store accumulator to absolute long address
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF BF DF DF | Load from absolute long,X into accumulator
	CMP $00D9,Y		  ; D9 D9 00 | Compare accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_110
; Address: $F2B946
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_110:
	SEI				  ; 78 | Set interrupt disable flag
	LDY $FFFF,X		  ; BC FF FF | Load from absolute,X into Y register
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_111
; Address: $F2B96E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_111:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_112
; Address: $F2B98C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_112:
	STA				  ; 9F 60 9F 60 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ROL $3C42,X		  ; 3E 42 3C | Rotate left (absolute,X)
	JMP $4838			; 4C 38 48 | Jump to address
	BMI $50			  ; 30 50 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_113
; Address: $F2B9A9
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_113:
	JSR $E000			; 20 00 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	BPL $7E			  ; 10 7E | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0D			  ; F0 0D | Branch if equal
	ORA $00E2,X		  ; 1D E2 00 | Logical OR with accumulator (absolute,X)
	SEP #$01			 ; E2 01 | Set processor status bits
	SBC $E003,X		  ; FD 03 E0 | Game work RAM access
	ASL $0E72,X		  ; 1E 72 0E | Arithmetic shift left (absolute,X)
	STY $DC04			; 8C 04 DC | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $70			  ; F0 70 | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $01			  ; F0 01 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_114
; Address: $F2BA26
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_114:
	LDA				  ; BF FF 17 7F | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCS $BF			  ; B0 BF | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 9C 9F DC | Load from absolute long,X into accumulator
	CPY $E4CF			; CC CF E4 | Compare Y register (absolute)
	LDY $5FFF,X		  ; BC FF 5F | Load from absolute,X into Y register
	ROL $807E,X		  ; 3E 7E 80 | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	AND $79FF,Y		  ; 39 FF 79 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF B8 1F 1C | Load from absolute long,X into accumulator
	ASL $FF0E			; 0E 0E FF | Arithmetic shift left (absolute)
	LDA				  ; BF 1F 1F 0F | Load from absolute long,X into accumulator
	PLY				  ; 7A | Pull Y register from stack
	EOR $3F4D			; 4D 4D 3F | Exclusive OR with accumulator (absolute)
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_115
; Address: $F2BB15
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_115:
	BRA $C8			  ; 80 C8 | Branch always
	BRA $84			  ; 80 84 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA				  ; BF FF CF FF | Load from absolute long,X into accumulator
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	BMI $BF			  ; 30 BF | Branch if negative
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_116
; Address: $F2BB3A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_116:
	JSR $1800			; 20 00 18 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BMI $6F			  ; 30 6F | Branch if negative
	INX				  ; E8 | Increment X register
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	ADC $E286,Y		  ; 79 86 E2 | Add with carry (absolute,Y)
	ORA $7987,X		  ; 1D 87 79 | Logical OR with accumulator (absolute,X)
	INC $FC1C,X		  ; FE 1C FC | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_117
; Address: $F2BBCB
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_117:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $0C1F,Y		  ; 19 1F 0C | Logical OR with accumulator (absolute,Y)
	AND $DE3D			; 2D 3D DE | Logical AND with accumulator (absolute)
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	INC $207E,X		  ; FE 7E 20 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL $FF04,X		  ; 3E 04 FF | Rotate left (absolute,X)
	ASL $1CFF			; 0E FF 1C | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	DEC $CEFF,X		  ; DE FF CE | Decrement (absolute,X)
	ADC $DDFD			; 6D FD DD | Add with carry (absolute)
	CMP $DDDD,X		  ; DD DD DD | Compare accumulator (absolute,X)
	CMP $9FDD,X		  ; DD DD 9F | Compare accumulator (absolute,X)
	LDX $03EF			; AE EF 03 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_119
; Address: $F2BC3C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_119:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BIT $6C7C			; 2C 7C 6C | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_11B
; Address: $F2BC47
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_11B:
	SEI				  ; 78 | Set interrupt disable flag
	BMI $38			  ; 30 38 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $1306,Y		  ; 19 06 13 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $1E0E			; 0E 0E 1E | Arithmetic shift left (absolute)
	ASL $1C1C,X		  ; 1E 1C 1C | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $FE			  ; 30 FE | Branch if negative
	ORA $31CF			; 0D CF 31 | Logical OR with accumulator (absolute)
	ORA $5C			  ; 05 5C | Logical OR with accumulator (zero page)
	BIT $30F0			; 2C F0 30 | Test bits in accumulator (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $C0			  ; 30 C0 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$FC03		   ; F4 03 FC | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STA				  ; 9F 03 F3 C0 | Store accumulator to absolute long,X
	INC $3FFF,X		  ; FE FF 3F | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_11D
; Address: $F2BCC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_11D:
	JSR $F8FF			; 20 FF F8 | Jump to subroutine
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	BMI $3F			  ; 30 3F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_11E
; Address: $F2BD27
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_11E:
	CPY $E2			  ; C4 E2 | Compare Y register (zero page)
	ORA $30C3,X		  ; 1D C3 30 | Logical OR with accumulator (absolute,X)
	LDY $62			  ; A4 62 | Load from zero page into Y register
	BMI $E4			  ; 30 E4 | Branch if negative
	BMI $0F			  ; 30 0F | Branch if negative
	SBC $F007,Y		  ; F9 07 F0 | Subtract with carry (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BMI $02			  ; 30 02 | Branch if negative
	CPY $7BB4			; CC B4 7B | Compare Y register (absolute)
	BMI $CC			  ; 30 CC | Branch if negative
	BCC $90			  ; 90 90 | Branch if carry clear
	DEC $31FF			; CE FF 31 | Decrement (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BIT $06D1			; 2C D1 06 | Test bits in accumulator (absolute)
	BVC $81			  ; 50 81 | Branch if overflow clear
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	BEQ $0A			  ; F0 0A | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ADC $00FF,X		  ; 7D FF 00 | Add with carry (absolute,X)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	SBC ($03),Y		  ; F1 03 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_120
; Address: $F2BDCE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_120:
	CPX $0023			; EC 23 00 | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	STA				  ; 9F 00 DF 00 | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $C0			  ; 10 C0 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_121
; Address: $F2BDEA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_121:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_122
; Address: $F2BE58
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_122:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ASL $7F00			; 0E 00 7F | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_123
; Address: $F2BE60
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_123:
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STY $FC			  ; 84 FC | Store Y register to zero page
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	ASL $0EDE,X		  ; 1E DE 0E | Arithmetic shift left (absolute,X)
	INC $F636			; EE 36 F6 | Increment (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ORA $00C0			; 0D C0 00 | Logical OR with accumulator (absolute)
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	BPL $01			  ; 10 01 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	ASL $131C			; 0E 1C 13 | Arithmetic shift left (absolute)
	ASL $0631			; 0E 31 06 | Arithmetic shift left (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ASL $1E07			; 0E 07 1E | Arithmetic shift left (absolute)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_124
; Address: $F2BE9E
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_124:
	BMI $7F			  ; 30 7F | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	BEQ $4F			  ; F0 4F | Branch if equal
	CPY $C667			; CC 67 C6 | Compare Y register (absolute)
	BEQ $0B			  ; F0 0B | Branch if equal
	ORA ($9C,X)		  ; 01 9C | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PEA #$F31B		   ; F4 1B F3 | Push effective address to stack
	SBC $F90B,Y		  ; F9 0B F9 | Subtract with carry (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	ADC $F88F,Y		  ; 79 8F F8 | Add with carry (absolute,Y)
	REP #$3F			 ; C2 3F | Reset processor status bits
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	INC $E0FE,X		  ; FE FE E0 | Game work RAM access
	ASL $3EFF,X		  ; 1E FF 3E | Arithmetic shift left (absolute,X)
	ROL $3CFF,X		  ; 3E FF 3C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC ($73),Y		  ; F1 73 | Subtract with carry ((zero page),Y)
	SBC ($CE,X)		  ; E1 CE | Subtract with carry ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ROR $FA07,X		  ; 7E 07 FA | Rotate right (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_125
; Address: $F2BF14
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_125:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR $5AE3,X		  ; 5D E3 5A | Exclusive OR with accumulator (absolute,X)
	STA $ABEE,Y		  ; 99 EE AB | Store accumulator to absolute,Y
	CMP $9977,Y		  ; D9 77 99 | Compare accumulator (absolute,Y)
	LDA				  ; BF 40 7F 80 | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	INC $BD00,X		  ; FE 00 BD | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	BEQ $7F			  ; F0 7F | Branch if equal
	LDX $AF			  ; A6 AF | Load from zero page into X register
	LDY #$AF			 ; A0 AF | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	BNE $D7			  ; D0 D7 | Branch if not equal
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank64_DmaFunction_126
; Address: $F2BF58
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_126:
	BNE $00			  ; D0 00 | Branch if not equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	INC $89			  ; E6 89 | Increment (zero page)
	INC $FF89,X		  ; FE 89 FF | Increment (absolute,X)
	DEC $BEFE			; CE FE BE | Decrement (absolute)
	LDX $C644,Y		  ; BE 44 C6 | Load from absolute,Y into X register
	ROR $0F00,X		  ; 7E 00 0F | Rotate right (absolute,X)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND $0200,Y		  ; 39 00 02 | Logical AND with accumulator (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BRA $08			  ; 80 08 | Branch always
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_129
; Address: $F2BF94
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_129:
	JSR $0078			; 20 78 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12A
; Address: $F2BFA7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12A:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12B
; Address: $F2BFC3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12B:
	BRA $FF			  ; 80 FF | Branch always
	INC $3CC1,X		  ; FE C1 3C | Increment (absolute,X)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CPX $0E			  ; E4 0E | Compare X register (zero page)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $D1			  ; 80 D1 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12C
; Address: $F2C043
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12C:
	BRA $E1			  ; 80 E1 | Branch always
	BCC $C0			  ; 90 C0 | Branch if carry clear
	LDY #$63			 ; A0 63 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12D
; Address: $F2C04A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12D:
	AND $3F23,Y		  ; 39 23 3F | Logical AND with accumulator (absolute,Y)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ORA $FF60,Y		  ; 19 60 FF | Logical OR with accumulator (absolute,Y)
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	ORA $3616,Y		  ; 19 16 36 | Logical OR with accumulator (absolute,Y)
	LDY $16			  ; A4 16 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BCC $10			  ; 90 10 | Branch if carry clear
	BPL $90			  ; 10 90 | Branch if positive
	BNE $10			  ; D0 10 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA #$E0			 ; 09 E0 | Game work RAM access
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	BEQ $26			  ; F0 26 | Branch if equal
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	INC				  ; 1A | Increment accumulator
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $0701			; 0D 01 07 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12E
; Address: $F2C090
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12E:
	JSR $047F			; 20 7F 04 | Jump to subroutine
	AND $0012,Y		  ; 39 12 00 | Logical AND with accumulator (absolute,Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	BEQ $FE			  ; F0 FE | Branch if equal
	PLX				  ; FA | Pull X register from stack
	INC $FDFD,X		  ; FE FD FD | Increment (absolute,X)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FFC1,X		  ; FE C1 FF | Increment (absolute,X)
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	EOR $DE5F,Y		  ; 59 5F DE | Exclusive OR with accumulator (absolute,Y)
	CMP $FDFA,X		  ; DD FA FD | Compare accumulator (absolute,X)
	ROR $BE01,X		  ; 7E 01 BE | Rotate right (absolute,X)
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_12F
; Address: $F2C0D7
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_12F:
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC $F97C,X		  ; FD 7C F9 | Subtract with carry (absolute,X)
	ADC $7173,Y		  ; 79 73 71 | Add with carry (absolute,Y)
	LDX #$8F			 ; A2 8F | Load immediate value into X register
	STY $5F			  ; 84 5F | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	INC $FCAB,X		  ; FE AB FC | Increment (absolute,X)
	LDA $DCFFD3		  ; AF D3 FF DC | Load from absolute long address into accumulator
	SBC $BDF2,Y		  ; F9 F2 BD | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $5F			  ; F0 5F | Branch if equal
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	SBC $67DF			; ED DF 67 | Subtract with carry (absolute)
	LDX $7DCE,Y		  ; BE CE 7D | Load from absolute,Y into X register
	LDA				  ; BF F8 FF E0 | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	SBC $F000,Y		  ; F9 00 F0 | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	NOP				  ; EA | No operation
	XBA				  ; EB | Exchange accumulator bytes
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	PLB				  ; AB | Pull data bank register from stack
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $28			  ; 10 28 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	INC $F7F1			; EE F1 F7 | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INC $FFA0,X		  ; FE A0 FF | Increment (absolute,X)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_130
; Address: $F2C1A1
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_130:
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	ORA $1D1F,X		  ; 1D 1F 1D | Logical OR with accumulator (absolute,X)
	AND $2D3F,X		  ; 3D 3F 2D | Logical AND with accumulator (absolute,X)
	BIT $132F			; 2C 2F 13 | Test bits in accumulator (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STX $78			  ; 86 78 | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	BVS $81			  ; 70 81 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPY $FFB0			; CC B0 FF | Compare Y register (absolute)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	LDY #$41			 ; A0 41 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_131
; Address: $F2C1E6
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_131:
	JSL $023D01		  ; 22 01 3D 02 | Jump to subroutine long
	STZ $D200,X		  ; 9E 00 D2 | Store zero to absolute,X
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR ($3F),Y		  ; 51 3F | Exclusive OR with accumulator ((zero page),Y)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $FF37			; CC 37 FF | Compare Y register (absolute)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	STY $BC			  ; 84 BC | Store Y register to zero page
	DEC $80			  ; C6 80 | Decrement (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $0A00,X		  ; FE 00 0A | Increment (absolute,X)
	ORA $090E			; 0D 0E 09 | Logical OR with accumulator (absolute)
	ORA $332D,Y		  ; 19 2D 33 | Logical OR with accumulator (absolute,Y)
	STX $0F			  ; 86 0F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank64_DmaFunction_132
; Address: $F2C259
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_132:
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	SBC $F46F			; ED 6F F4 | Subtract with carry (absolute)
	SEP #$63			 ; E2 63 | Set processor status bits
	CMP $F819,Y		  ; D9 19 F8 | Compare accumulator (absolute,Y)
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BCS $FC			  ; B0 FC | Branch if carry set
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	LDY $B6BF,X		  ; BC BF B6 | Load from absolute,X into Y register
	LDA				  ; BF DB DF 59 | Load from absolute long,X into accumulator
	BIT $03EF			; 2C EF 03 | Test bits in accumulator (absolute)
	BRA $02			  ; 80 02 | Branch always
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_133
; Address: $F2C29C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_133:
	JSR $1000			; 20 00 10 | Jump to subroutine
	LDA				  ; BF E7 18 5B | Load from absolute long,X into accumulator
	LDY $A7			  ; A4 A7 | Load from zero page into Y register
	LDA $FCCFD4		  ; AF D4 CF FC | Load from absolute long address into accumulator
	LDA				  ; BF 00 9F 80 | Load from absolute long,X into accumulator
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BIT $BC			  ; 24 BC | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $7B			  ; E4 7B | Compare X register (zero page)
	SBC $FB			  ; E5 FB | Subtract with carry (zero page)
	CMP $B3E3,X		  ; DD E3 B3 | Compare accumulator (absolute,X)
	LDA				  ; BF CF FF 86 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $AC08,X		  ; 1E 08 AC | Arithmetic shift left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BNE $F8			  ; D0 F8 | Branch if not equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $FAFE,X		  ; 7E FE FA | Rotate right (absolute,X)
	BEQ $F7			  ; F0 F7 | Branch if equal
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_135
; Address: $F2C2FC
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_135:
	JSR $2000			; 20 00 20 | Jump to subroutine
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	INC $FF0E,X		  ; FE 0E FF | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $EEFD			; EC FD EE | Compare X register (absolute)
	SBC $FEEE,X		  ; FD EE FE | Subtract with carry (absolute,X)
	ROR $7E47,X		  ; 7E 47 7E | Rotate right (absolute,X)
	LDA				  ; BF 8F BD 8D | Load from absolute long,X into accumulator
	CLD				  ; D8 | Clear decimal mode flag
	DEC $7EFF,X		  ; DE FF 7E | Decrement (absolute,X)
	ROR $3C7F,X		  ; 7E 7F 3C | Rotate right (absolute,X)
	ADC $8038,X		  ; 7D 38 80 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $6E			  ; E6 6E | Increment (zero page)
	ADC $6D4E			; 6D 4E 6D | Add with carry (absolute)
	EOR $0F6E			; 4D 6E 0F | Exclusive OR with accumulator (absolute)
	ROR $6F0E			; 6E 0E 6F | Rotate right (absolute)
	ORA $8C6D			; 0D 6D 8C | Logical OR with accumulator (absolute)
	SBC $F796			; ED 96 F7 | Subtract with carry (absolute)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	BCS $D3			  ; B0 D3 | Branch if carry set
	LDY $BFD0,X		  ; BC D0 BF | Load from absolute,X into Y register
	CLD				  ; D8 | Clear decimal mode flag
	LDA				  ; BF DC BF DE | Load from absolute long,X into accumulator
	LDA				  ; BF FF 5F FF | Load from absolute long,X into accumulator
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_136
; Address: $F2C3B8
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_136:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BIT $DF			  ; 24 DF | Test bits in accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $1EFF			; 0D FF 1E | Logical OR with accumulator (absolute)
	ADC $FBFE,X		  ; 7D FE FB | Add with carry (absolute,X)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $BE			  ; 80 BE | Branch always
	REP #$BE			 ; C2 BE | Reset processor status bits
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BCC $B0			  ; 90 B0 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	SBC ($91),Y		  ; F1 91 | Subtract with carry ((zero page),Y)
	BEQ $90			  ; F0 90 | Branch if equal
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	LDX $AF3E,Y		  ; BE 3E AF | Load from absolute,Y into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_138
; Address: $F2C46A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_138:
	BVS $7F			  ; 70 7F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_139
; Address: $F2C47C
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_139:
	BRA $00			  ; 80 00 | Branch always
	STX $9700			; 8E 00 97 | Store X register to absolute address
	XBA				  ; EB | Exchange accumulator bytes
	STA $FD			  ; 85 FD | Store accumulator to zero page
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F0F08F		  ; 8F 8F F0 F0 | Store accumulator to absolute long address
	INC $1FFE,X		  ; FE FE 1F | Increment (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 3F FE | Store accumulator to absolute long,X
	INC $FDFD,X		  ; FE FD FD | Increment (absolute,X)
	CMP #$CF			 ; C9 CF | Compare accumulator (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	STY $3000			; 8C 00 30 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $BF			  ; 80 BF | Branch always
	BRA $BF			  ; 80 BF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BMI $FF			  ; 30 FF | Branch if negative
	STA $B95EFF		  ; 8F FF 5E B9 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	STX $0F			  ; 86 0F | Store X register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_13A
; Address: $F2C520
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_13A:
	LDA $B999,Y		  ; B9 99 B9 | Load from absolute,Y into accumulator
	LDA $7171,Y		  ; B9 71 71 | Load from absolute,Y into accumulator
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $7930,Y		  ; 79 30 79 | Add with carry (absolute,Y)
	BMI $F1			  ; 30 F1 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_13B
; Address: $F2C536
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_13B:
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_13C
; Address: $F2C548
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_13C:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	INC $FEE2,X		  ; FE E2 FE | Increment (absolute,X)
	DEC $F0			  ; C6 F0 | Decrement (zero page)
	BRA $EE			  ; 80 EE | Branch always
	STX $1EDE			; 8E DE 1E | Store X register to absolute address
	DEC $BEFF,X		  ; DE FF BE | Decrement (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	STA $F7			  ; 85 F7 | Store accumulator to zero page
	BIT #$FB			 ; 89 FB | Test bits in accumulator (immediate)
	BIT #$FB			 ; 89 FB | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	CMP $FD			  ; C5 FD | Compare accumulator (zero page)
	CPY $FD			  ; C4 FD | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LDA $899FF3		  ; AF F3 9F 89 | Load from absolute long address into accumulator
	INC $D4C7,X		  ; FE C7 D4 | Increment (absolute,X)
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $6F			  ; 80 6F | Branch always
	BEQ $37			  ; F0 37 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BMI $77			  ; 30 77 | Branch if negative
	ORA $FF3F			; 0D 3F FF | Logical OR with accumulator (absolute)
	SBC $EFFE,X		  ; FD FE EF | Subtract with carry (absolute,X)
	SBC ($DD),Y		  ; F1 DD | Subtract with carry ((zero page),Y)
	INC $FEB1			; EE B1 FE | Increment (absolute)
	SEP #$FD			 ; E2 FD | Set processor status bits
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_13E
; Address: $F2C5D6
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_13E:
	SBC $FD03,X		  ; FD 03 FD | Subtract with carry (absolute,X)
	SBC $F305,Y		  ; F9 05 F3 | Subtract with carry (absolute,Y)
	STA $F987FF		  ; 8F FF 87 F9 | Store accumulator to absolute long address
	STA $7BFB7F		  ; 8F 7F FB 7B | Store accumulator to absolute long address
	INC $BC00,X		  ; FE 00 BC | Increment (absolute,X)
	CPY #$B4			 ; C0 B4 | Compare Y register (immediate)
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA				  ; BF FF FF 00 | Load from absolute long,X into accumulator
	INC $F771			; EE 71 F7 | Increment (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F 40 CF 00 | Store accumulator to absolute long,X
	STA $040F04		  ; 8F 04 0F 04 | Store accumulator to absolute long address
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ORA $0800,X		  ; 1D 00 08 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($CF,X)		  ; 41 CF | Exclusive OR with accumulator ((zero page,X))
	SBC $FE			  ; E5 FE | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_13F
; Address: $F2C669
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_13F:
	JSR $2255			; 20 55 22 | Jump to subroutine
	STY $70BC			; 8C BC 70 | Store Y register to absolute address
	BMI $0F			  ; 30 0F | Branch if negative
	LDY $FF00,X		  ; BC 00 FF | Load from absolute,X into Y register
	BRA $FF			  ; 80 FF | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F C0 38 87 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank64_DmaFunction_140
; Address: $F2C68B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_140:
	CMP $FE			  ; C5 FE | Compare accumulator (zero page)
	STX $18			  ; 86 18 | Store X register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_142
; Address: $F2C69D
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_142:
	STZ $7800,X		  ; 9E 00 78 | Store zero to absolute,X
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STZ $03FF			; 9C FF 03 | Store zero to absolute
	INC $F978,X		  ; FE 78 F9 | Increment (absolute,X)
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	STX $3701			; 8E 01 37 | Store X register to absolute address
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	BEQ $1C			  ; F0 1C | Branch if equal
	JMP ($03AF)		  ; 6C AF 03 | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BPL $AF			  ; 10 AF | Branch if positive
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	BEQ $04			  ; F0 04 | Branch if equal
	INC $EB8C,X		  ; FE 8C EB | Increment (absolute,X)
	JMP $170EFB		  ; 5C FB 0E 17 | Jump to address long
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LDA ($3F),Y		  ; B1 3F | Load from (zero page),Y into accumulator
	LDA ($3F,X)		  ; A1 3F | Load from (zero page,X) into accumulator
	LDA ($3F,X)		  ; A1 3F | Load from (zero page,X) into accumulator
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	BNE $DF			  ; D0 DF | Branch if not equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_144
; Address: $F2C77A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_144:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ROR $FEE2,X		  ; 7E E2 FE | Rotate right (absolute,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $BFFE,X		  ; 7D FE BF | Add with carry (absolute,X)
	INC $7F7E,X		  ; FE 7E 7F | Increment (absolute,X)
	LDA				  ; BF BE CF CF | Load from absolute long,X into accumulator
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	INC $FFC9,X		  ; FE C9 FF | Increment (absolute,X)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	SBC $7DFF,X		  ; FD FF 7D | Subtract with carry (absolute,X)
	DEC $E647			; CE 47 E6 | Decrement (absolute)
	INC $FE7B,X		  ; FE 7B FE | Increment (absolute,X)
	DEC $38			  ; C6 38 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY $70FF			; CC FF 70 | Compare Y register (absolute)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_145
; Address: $F2C806
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_145:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $EF6F8F		  ; 8F 8F 6F EF | Store accumulator to absolute long address
	BPL $F0			  ; 10 F0 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 0F 7F 0F | Store accumulator to absolute long,X
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_146
; Address: $F2C857
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_146:
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR $F57F,X		  ; 5E 7F F5 | Logical shift right (absolute,X)
	LDA				  ; BF F9 FE 77 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $10			  ; F0 10 | Branch if equal
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDX $C03F,Y		  ; BE 3F C0 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	BPL $6F			  ; 10 6F | Branch if positive
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	STX $1E			  ; 86 1E | Store X register to zero page
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_147
; Address: $F2C90C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_147:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_148
; Address: $F2C928
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_148:
	JSR $C064			; 20 64 C0 | Jump to subroutine
	WDM #$D8			 ; 42 D8 | Reserved instruction
	WDM #$BC			 ; 42 BC | Reserved instruction
	INC $00			  ; E6 00 | Increment (zero page)
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_149
; Address: $F2C946
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_149:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $9E			  ; E6 9E | Increment (zero page)
	SBC $FFE3,X		  ; FD E3 FF | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D04			; 0E 04 0D | Arithmetic shift left (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BVC $5F			  ; 50 5F | Branch if overflow clear
	STA ($26,X)		  ; 81 26 | Store accumulator to (zero page,X)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FC04,X		  ; 7E 04 FC | Rotate right (absolute,X)
	BMI $3F			  ; 30 3F | Branch if negative
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	STA ($40,X)		  ; 81 40 | Store accumulator to (zero page,X)
	INC $FF41			; EE 41 FF | Increment (absolute)
	STA ($1E,X)		  ; 81 1E | Store accumulator to (zero page,X)
	ROR $0003,X		  ; 7E 03 00 | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $01			  ; F0 01 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STA				  ; 9F 00 7E FF | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14A
; Address: $F2C9A8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14A:
	BRA $78			  ; 80 78 | Branch always
	CPY $F0F0			; CC F0 F0 | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BMI $FF			  ; 30 FF | Branch if negative
	STX $FE			  ; 86 FE | Store X register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14B
; Address: $F2CA04
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14B:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	AND $E7			  ; 25 E7 | Logical AND with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $0897,X		  ; 1D 97 08 | Logical OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14C
; Address: $F2CA20
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14C:
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FF06,X		  ; FE 06 FF | Increment (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	INC $9FFE,X		  ; FE FE 9F | Increment (absolute,X)
	WDM #$87			 ; 42 87 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 00 00 | Store accumulator to absolute long,X
	BVS $7F			  ; 70 7F | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $847F			; 4C 7F 84 | Jump to address
	LDA				  ; BF A4 BF AC | Load from absolute long,X into accumulator
	LDA				  ; BF DC DF 6C | Load from absolute long,X into accumulator
	STA				  ; 9F 00 8F 00 | Store accumulator to absolute long,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDX $BFC1,Y		  ; BE C1 BF | Load from absolute,Y into X register
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14D
; Address: $F2CB38
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14D:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14E
; Address: $F2CB5A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14E:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BIT $166F			; 2C 6F 16 | Test bits in accumulator (absolute)
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_14F
; Address: $F2CB96
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_14F:
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $3F21,X		  ; 1E 21 3F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND ($4E),Y		  ; 31 4E | Logical AND with accumulator ((zero page),Y)
	ROL $015F			; 2E 5F 01 | Rotate left (absolute)
	ORA ($13),Y		  ; 11 13 | Logical OR with accumulator ((zero page),Y)
	BIT $DF3C			; 2C 3C DF | Test bits in accumulator (absolute)
	ROL $FEFE,X		  ; 3E FE FE | Rotate left (absolute,X)
	ROR $0080,X		  ; 7E 80 00 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	ASL $1CFF			; 0E FF 1C | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_150
; Address: $F2CBE0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_150:
	LDX $CEFF,Y		  ; BE FF CE | Load from absolute,Y into X register
	SBC $FD			  ; E5 FD | Subtract with carry (zero page)
	CMP $DDDD,X		  ; DD DD DD | Compare accumulator (absolute,X)
	CMP $5D5D,X		  ; DD 5D 5D | Compare accumulator (absolute,X)
	STA				  ; 9F DF AE EF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank64_DmaFunction_152
; Address: $F2CBFC
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_152:
	JSR $1000			; 20 00 10 | Jump to subroutine
	STA $CFBFFF		  ; 8F FF BF CF | Store accumulator to absolute long address
	LDA				  ; BF CF C7 FF | Load from absolute long,X into accumulator
	LDA				  ; BF 70 3F 70 | Load from absolute long,X into accumulator
	BMI $E1			  ; 30 E1 | Branch if negative
	INC $FDE7,X		  ; FE E7 FD | Increment (absolute,X)
	INC $ECFB,X		  ; FE FB EC | Increment (absolute,X)
	CMP $A3FE,Y		  ; D9 FE A3 | Compare accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	BPL $CF			  ; 10 CF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	ROL $FDCD,X		  ; 3E CD FD | Rotate left (absolute,X)
	INC				  ; 1A | Increment accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BVS $F1			  ; 70 F1 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	INX				  ; E8 | Increment X register
	BRA $0F			  ; 80 0F | Branch always
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CPX $F01C			; EC 1C F0 | Compare X register (absolute)
	STX $CFF4			; 8E F4 CF | Store X register to absolute address
	BVS $EC			  ; 70 EC | Branch if overflow set
	BMI $F4			  ; 30 F4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SBC $F479,X		  ; FD 79 F4 | Subtract with carry (absolute,X)
	SBC $7800,Y		  ; F9 00 78 | Subtract with carry (absolute,Y)
	AND $1A07,Y		  ; 39 07 1A | Logical AND with accumulator (absolute,Y)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_153
; Address: $F2CCB2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_153:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_154
; Address: $F2CCF4
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_154:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $21FF,X		  ; 1E FF 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $6F			  ; F0 6F | Branch if equal
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	CPY $8FEF			; CC EF 8F | Compare Y register (absolute)
	LDA $F02E2D		  ; AF 2D 2E F0 | Load from absolute long address into accumulator
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	BMI $0F			  ; 30 0F | Branch if negative
	CMP ($03),Y		  ; D1 03 | Compare accumulator ((zero page),Y)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	STA $0F89F9		  ; 8F F9 89 0F | Store accumulator to absolute long address
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFA,X		  ; FE FA FE | Increment (absolute,X)
	INC $FCE6,X		  ; FE E6 FC | Increment (absolute,X)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	REP #$F4			 ; C2 F4 | Reset processor status bits
	INC $DEFF			; EE FF DE | Increment (absolute)
	DEC $BEFF,X		  ; DE FF BE | Decrement (absolute,X)
	LDY $B0FD,X		  ; BC FD B0 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_155
; Address: $F2CD9F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_155:
	BEQ $AC			  ; F0 AC | Branch if equal
	LDY $8CEF			; AC EF 8C | Load from absolute address into Y register
	STX $F7			  ; 86 F7 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	EOR $7D			  ; 45 7D | Exclusive OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BNE $EF			  ; D0 EF | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_156
; Address: $F2CDCA
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_156:
	ROR $3DF1,X		  ; 7E F1 3D | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	LDA $37FE,X		  ; BD FE 37 | Load from absolute,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $3E1D			; 2C 1D 3E | Test bits in accumulator (absolute)
	ORA $030D			; 0D 0D 03 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LSR $FFA5,X		  ; 5E A5 FF | Logical shift right (absolute,X)
	INC $3D01,X		  ; FE 01 3D | Increment (absolute,X)
	ROR $C7E7,X		  ; 7E E7 C7 | Rotate right (absolute,X)
	LDA				  ; BF EE 1E 6E | Load from absolute long,X into accumulator
	STZ $7D9D,X		  ; 9E 9D 7D | Store zero to absolute,X
	STA $9C70EF		  ; 8F EF 70 9C | Store accumulator to absolute long address
	LDY #$E1			 ; A0 E1 | Load immediate value into Y register
	BEQ $61			  ; F0 61 | Branch if equal
	BEQ $42			  ; F0 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_157
; Address: $F2CE1A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_157:
	CPY $E0			  ; C4 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $61			  ; 80 61 | Branch always
	ADC $77			  ; 65 77 | Add with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	PHB				  ; 8B | Push data bank register to stack
	ORA $1DFD			; 0D FD 1D | Logical OR with accumulator (absolute)
	SBC $0688,X		  ; FD 88 06 | Subtract with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	STA $239C			; 8D 9C 23 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $CE			  ; 24 CE | Test bits in accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $FE			  ; E6 FE | Increment (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_158
; Address: $F2CE58
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_158:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $3F00,Y		  ; F9 00 3F | Subtract with carry (absolute,Y)
	ORA $E060,Y		  ; 19 60 E0 | Game work RAM access
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_159
; Address: $F2CE6B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_159:
	JSL $BE427C		  ; 22 7C 42 BE | Jump to subroutine long
	CMP ($10,X)		  ; C1 10 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $18			  ; 80 18 | Branch always
	INC $CEC0,X		  ; FE C0 CE | Increment (absolute,X)
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	CPX $38FC			; EC FC 38 | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0109			; 0E 09 01 | Arithmetic shift left (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	ADC $E019,Y		  ; 79 19 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_15A
; Address: $F2CEA9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_15A:
	JSR $60A0			; 20 A0 60 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_15B
; Address: $F2CEC0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_15B:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_15F
; Address: $F2CEE4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_15F:
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	DEC $61DE,X		  ; DE DE 61 | Decrement (absolute,X)
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	STA				  ; 9F 00 4E 00 | Store accumulator to absolute long,X
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND $2E2E			; 2D 2E 2E | Logical AND with accumulator (absolute)
	LDX $6DAD			; AE AD 6D | Load from absolute address into X register
	ROR $DEDF			; 6E DF DE | Rotate right (absolute)
	STZ $5F9F,X		  ; 9E 9F 5F | Store zero to absolute,X
	CMP $D1DD,X		  ; DD DD D1 | Compare accumulator (absolute,X)
	BNE $01			  ; D0 01 | Branch if not equal
	EOR ($03),Y		  ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
	STA ($03),Y		  ; 91 03 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank64_DmaFunction_161
; Address: $F2CF1E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_161:
	JSL $91F100		  ; 22 00 F1 91 | Jump to subroutine long
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	JMP ($364F)		  ; 6C 4F 36 | Jump to address (absolute indirect)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BVS $20			  ; 70 20 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BPL $18			  ; 10 18 | Branch if positive
	INC $FE			  ; E6 FE | Increment (zero page)
	ORA $04FF,Y		  ; 19 FF 04 | Logical OR with accumulator (absolute,Y)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_162
; Address: $F2CF7E
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_162:
	BRA $00			  ; 80 00 | Branch always
	DEC $7EFF,X		  ; DE FF 7E | Decrement (absolute,X)
	LDA				  ; BF BF CF CF | Load from absolute long,X into accumulator
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	ROR $7FE7,X		  ; 7E E7 7F | Rotate right (absolute,X)
	INC $3CFF,X		  ; FE FF 3C | Increment (absolute,X)
	STA $E7FF,Y		  ; 99 FF E7 | Store accumulator to absolute,Y
	LDA $FF			  ; A5 FF | Load from zero page into accumulator
	LDA $DBFF,X		  ; BD FF DB | Load from absolute,X into accumulator
	ROR $18E7,X		  ; 7E E7 18 | Rotate right (absolute,X)
	ROR $1880,X		  ; 7E 80 18 | Rotate right (absolute,X)
	ROL $7CBF,X		  ; 3E BF 7C | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $F7F4,X		  ; FD F4 F7 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $FF60,X		  ; FE 60 FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $BF			  ; 80 BF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ROR $017E,X		  ; 7E 7E 01 | Rotate right (absolute,X)
	STA ($37,X)		  ; 81 37 | Store accumulator to (zero page,X)
	BMI $F0			  ; 30 F0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	DEC $DEE1,X		  ; DE E1 DE | Decrement (absolute,X)
	SBC ($9E,X)		  ; E1 9E | Subtract with carry ((zero page,X))
	LDA ($1E,X)		  ; A1 1E | Load from (zero page,X) into accumulator
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	WDM #$3C			 ; 42 3C | Reserved instruction
	JMP $C0FF			; 4C FF C0 | Jump to address

;------------------------------------------------------------------------------
; Bank64_DmaFunction_165
; Address: $F2D047
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_165:
	JSR $1103			; 20 03 11 | Jump to subroutine
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ROL $3F0C,X		  ; 3E 0C 3F | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $1D00,X		  ; 3E 00 1D | Rotate left (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STZ $4C82,X		  ; 9E 82 4C | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_166
; Address: $F2D075
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_166:
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $1F19			; 0D 19 1F | Logical OR with accumulator (absolute)
	BPL $28			  ; 10 28 | Branch if positive
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	BRA $13			  ; 80 13 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_167
; Address: $F2D0AD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_167:
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	ASL $71FF			; 0E FF 71 | Arithmetic shift left (absolute)
	BRA $F0			  ; 80 F0 | Branch always
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BEQ $07			  ; F0 07 | Branch if equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_168
; Address: $F2D124
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_168:
	ORA $BBFD			; 0D FD BB | Logical OR with accumulator (absolute)
	LDA				  ; BF D5 3B 2E | Load from absolute long,X into accumulator
	ORA ($36),Y		  ; 11 36 | Logical OR with accumulator ((zero page),Y)
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BVS $FE			  ; 70 FE | Branch if overflow set
	STZ $E29E			; 9C 9E E2 | Store zero to absolute
	SEP #$FC			 ; E2 FC | Set processor status bits
	ROL $84FF,X		  ; 3E FF 84 | Rotate left (absolute,X)
	ASL $0406			; 0E 06 04 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ORA $03E0,X		  ; 1D E0 03 | Logical OR with accumulator (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $90			  ; 70 90 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_169
; Address: $F2D163
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_169:
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_16A
; Address: $F2D16B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_16A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_16B
; Address: $F2D1AF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_16B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_16C
; Address: $F2D1C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_16C:
	JSR $1F1F			; 20 1F 1F | Jump to subroutine
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $3CC1,X		  ; FE C1 3C | Increment (absolute,X)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_16F
; Address: $F2D227
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_16F:
	JSR $101F			; 20 1F 10 | Jump to subroutine
	ASL $3F0C,X		  ; 1E 0C 3F | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	LDY $FE			  ; A4 FE | Load from zero page into Y register
	SBC $C170,Y		  ; F9 70 C1 | Subtract with carry (absolute,Y)
	BMI $E2			  ; 30 E2 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $CF			  ; 06 CF | Arithmetic shift left (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_170
; Address: $F2D265
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_170:
	STY $20			  ; 84 20 | Store Y register to zero page
	ASL $3342,X		  ; 1E 42 33 | Arithmetic shift left (absolute,X)
	EOR $3837			; 4D 37 38 | Exclusive OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	STZ $5C00			; 9C 00 5C | Store zero to absolute
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	AND ($0D,X)		  ; 21 0D | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	NOP				  ; EA | No operation
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	ASL $FE00,X		  ; 1E 00 FE | Arithmetic shift left (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_171
; Address: $F2D2D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_171:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	STY $78			  ; 84 78 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_172
; Address: $F2D2F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_172:
	CPY $6800			; CC 00 68 | Compare Y register (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_175
; Address: $F2D321
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_175:
	JSR $213F			; 20 3F 21 | PPU graphics register access
	ROR $7846,X		  ; 7E 46 78 | Rotate right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BVS $50			  ; 70 50 | Branch if overflow set
	BVS $50			  ; 70 50 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_176
; Address: $F2D32C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_176:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ROR $7800,X		  ; 7E 00 78 | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_177
; Address: $F2D33C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_177:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	STY $90F0			; 8C F0 90 | Store Y register to absolute address
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL $1F13			; 0E 13 1F | Arithmetic shift left (absolute)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	BPL $07			  ; 10 07 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_178
; Address: $F2D372
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_178:
	JSR $2001			; 20 01 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCC $7C			  ; 90 7C | Branch if carry clear
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $D0			  ; D0 D0 | Branch if not equal
	BMI $30			  ; 30 30 | Branch if negative
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_179
; Address: $F2D3A7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_179:
	EOR ($7B,X)		  ; 41 7B | Exclusive OR with accumulator ((zero page,X))
	STY $1F			  ; 84 1F | Store Y register to zero page
	LSR $19			  ; 46 19 | Logical shift right (zero page)
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	CPY $9A66			; CC 66 9A | Compare Y register (absolute)
	WDM #$BE			 ; 42 BE | Reserved instruction
	BCC $70			  ; 90 70 | Branch if carry clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 9F 2D EF | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_17A
; Address: $F2D3FE
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_17A:
	BPL $00			  ; 10 00 | Branch if positive
	SBC ($9F,X)		  ; E1 9F | Subtract with carry ((zero page,X))
	INC $FFC1,X		  ; FE C1 FF | Increment (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	DEC $EFEE,X		  ; DE EE EF | Decrement (absolute,X)
	AND $2D03,X		  ; 3D 03 2D | Logical AND with accumulator (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 7F F7 8F | Load from absolute long,X into accumulator
	STA $477F			; 8D 7F 47 | Store accumulator to absolute address
	LDA				  ; BF 80 7F 8F | Load from absolute long,X into accumulator
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator
	STA				  ; 9F A0 CF FF | Store accumulator to absolute long,X
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)
	INC $CFF5			; EE F5 CF | Increment (absolute)
	SBC $FF91,Y		  ; F9 91 FF | Subtract with carry (absolute,Y)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	CPX $0C1E			; EC 1E 0C | Compare X register (absolute)
	INC $FCB0			; EE B0 FC | Increment (absolute)
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	STA $FF8FFF		  ; 8F FF 8F FF | Store accumulator to absolute long address
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	STA $85FC			; 8D FC 85 | Store accumulator to absolute address
	STA $FC			  ; 85 FC | Store accumulator to zero page
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_17B
; Address: $F2D488
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_17B:
	ASL $1EFE			; 0E FE 1E | Arithmetic shift left (absolute)
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_17C
; Address: $F2D4CB
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_17C:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	ROL $0141,X		  ; 3E 41 01 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $9E6F			; 4E 6F 9E | Logical shift right (absolute)
	STZ $1BEB,X		  ; 9E EB 1B | Store zero to absolute,X
	BNE $30			  ; D0 30 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	ADC $FF06,X		  ; 7D 06 FF | Add with carry (absolute,X)
	SBC $FC08,X		  ; FD 08 FC | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $1EEF			; 8E EF 1E | Store X register to absolute address
	ASL $3BDB,X		  ; 1E DB 3B | Arithmetic shift left (absolute,X)
	BCS $70			  ; B0 70 | Branch if carry set
	LDA $5F986F		  ; AF 6F 98 5F | Load from absolute long address into accumulator
	SBC $FF06,X		  ; FD 06 FF | Subtract with carry (absolute,X)
	SBC $FC18,X		  ; FD 18 FC | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_17E
; Address: $F2D55D
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_17E:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ROR $86			  ; 66 86 | Rotate right (zero page)
	EOR ($3B,X)		  ; 41 3B | Exclusive OR with accumulator ((zero page,X))
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	STZ $5F00,X		  ; 9E 00 5F | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	CMP #$5C			 ; C9 5C | Compare accumulator (immediate)
	ROL $99			  ; 26 99 | Rotate left (zero page)
	DEC $CF11			; CE 11 CF | Decrement (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	ROL $7D41,X		  ; 3E 41 7D | Rotate left (absolute,X)
	ADC $7D83,X		  ; 7D 83 7D | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $F8			  ; 84 F8 | Store Y register to zero page
	STY $F8			  ; 84 F8 | Store Y register to zero page
	STY $F8			  ; 84 F8 | Store Y register to zero page
	STY $7F			  ; 84 7F | Store Y register to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	BVS $7F			  ; 70 7F | Branch if overflow set
	ASL $C01F,X		  ; 1E 1F C0 | Arithmetic shift left (absolute,X)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_180
; Address: $F2D5DE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_180:
	JSR $1400			; 20 00 14 | Jump to subroutine
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $03FF			; 0E FF 03 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_181
; Address: $F2D625
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_181:
	LDA				  ; BF FF BE FF | Load from absolute long,X into accumulator
	SEP #$67			 ; E2 67 | Set processor status bits
	DEC $7F			  ; C6 7F | Decrement (zero page)
	DEC $DD7F,X		  ; DE 7F DD | Decrement (absolute,X)
	LDX $FD7F,Y		  ; BE 7F FD | Load from absolute,Y into X register
	ROR $FDFE,X		  ; 7E FE FD | Rotate right (absolute,X)
	ADC $F3F3,X		  ; 7D F3 F3 | Add with carry (absolute,X)
	DEC $3CCF			; CE CF 3C | Decrement (absolute)
	BRA $F0			  ; 80 F0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BRA $30			  ; 80 30 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $87			  ; 85 87 | Store accumulator to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $0897,X		  ; 1D 97 08 | Logical OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_182
; Address: $F2D68B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_182:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	STX $1EEF			; 8E EF 1E | Store X register to absolute address
	ROL $7BBB,X		  ; 3E BB 7B | Rotate left (absolute,X)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	SBC $FF06,X		  ; FD 06 FF | Subtract with carry (absolute,X)
	SBC $FC38,X		  ; FD 38 FC | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_183
; Address: $F2D6BE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_183:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	BCS $7F			  ; B0 7F | Branch if carry set
	STZ $9F5F			; 9C 5F 9F | Store zero to absolute
	STZ $C05F,X		  ; 9E 5F C0 | Store zero to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_184
; Address: $F2D6F4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_184:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_188
; Address: $F2D722
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_188:
	JSR $20BF			; 20 BF 20 | Jump to subroutine
	LDA				  ; BF 20 BF 70 | Load from absolute long,X into accumulator
	JMP $DF5FDF		  ; 5C DF 5F DF | Jump to address long
	ASL $C09F,X		  ; 1E 9F C0 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $091E			; 0E 1E 09 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_189
; Address: $F2D756
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_189:
	JSR $2100			; 20 00 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $FAF6,Y		  ; 19 F6 FA | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $0C00,X		  ; FE 00 0C | Increment (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	WDM #$3C			 ; 42 3C | Reserved instruction

;------------------------------------------------------------------------------
; Bank64_DmaFunction_18B
; Address: $F2D788
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_18B:
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $7001,X		  ; 1E 01 70 | Arithmetic shift left (absolute,X)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	JMP $10FC			; 4C FC 10 | Jump to address
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_18C
; Address: $F2D7C4
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_18C:
	JMP ($80EF)		  ; 6C EF 80 | Jump to address (absolute indirect)
	BRA $DC			  ; 80 DC | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $E0			  ; 10 E0 | Game work RAM access
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	STX $FE			  ; 86 FE | Store X register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	STZ $D0E1,X		  ; 9E E1 D0 | Store zero to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA				  ; BF 1B 4C FC | Load from absolute long,X into accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	CPX $03			  ; E4 03 | Compare X register (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_18D
; Address: $F2D88D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_18D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STA $885C94		  ; 8F 94 5C 88 | Store accumulator to absolute long address
	ROL $D0E1,X		  ; 3E E1 D0 | Rotate left (absolute,X)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	JMP $90FC			; 4C FC 90 | Jump to address
	CPX $03			  ; E4 03 | Compare X register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_18E
; Address: $F2D8BA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_18E:
	JSR $00CF			; 20 CF 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $87			  ; 80 87 | Branch always
	BRA $8F			  ; 80 8F | Branch always
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BRA $82			  ; 80 82 | Branch always
	BRA $87			  ; 80 87 | Branch always
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_190
; Address: $F2D90C
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_190:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $030F			; 0E 0F 03 | Arithmetic shift left (absolute)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SBC $3F3E,Y		  ; F9 3E 3F | Subtract with carry (absolute,Y)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_191
; Address: $F2D9C8
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_191:
	ORA $0C09			; 0D 09 0C | Logical OR with accumulator (absolute)
	ORA $0206			; 0D 06 02 | Logical OR with accumulator (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	EOR ($40),Y		  ; 51 40 | Exclusive OR with accumulator ((zero page),Y)
	CMP ($DB,X)		  ; C1 DB | Compare accumulator ((zero page,X))
	LDA ($91,X)		  ; A1 91 | Load from (zero page,X) into accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	EOR ($A0),Y		  ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($A0),Y		  ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $F53D,X		  ; 3D 3D F5 | Logical AND with accumulator (absolute,X)
	ORA $4B12			; 0D 12 4B | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	ADC $9A			  ; 65 9A | Add with carry (zero page)
	SBC $BA			  ; E5 BA | Subtract with carry (zero page)
	CMP $07			  ; C5 07 | Compare accumulator (zero page)
	ASL $F81E,X		  ; 1E 1E F8 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_192
; Address: $F2DA39
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_192:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX $24			  ; E4 24 | Compare X register (zero page)
	NOP				  ; EA | No operation
	BIT $EB			  ; 24 EB | Test bits in accumulator (zero page)
	SBC $7D94,Y		  ; F9 94 7D | Subtract with carry (absolute,Y)
	BCC $75			  ; 90 75 | Branch if carry clear
	BRA $04			  ; 80 04 | Branch always
	BRA $0A			  ; 80 0A | Branch always
	ORA #$46			 ; 09 46 | Logical OR with accumulator (immediate)
	ORA $0562			; 0D 62 05 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_193
; Address: $F2DA5F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_193:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	ADC ($21),Y		  ; 71 21 | PPU graphics register access
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_194
; Address: $F2DA68
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_194:
	ADC ($26),Y		  ; 71 26 | Add with carry ((zero page),Y)
	LDA #$05			 ; A9 05 | Load immediate value into accumulator
	SBC $00A8,Y		  ; F9 A8 00 | Subtract with carry (absolute,Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($06),Y		  ; 71 06 | Add with carry ((zero page),Y)
	SBC $FB04,Y		  ; F9 04 FB | Subtract with carry (absolute,Y)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA $BE			  ; 05 BE | Logical OR with accumulator (zero page)
	ORA $BA			  ; 05 BA | Logical OR with accumulator (zero page)
	STA $FD3A			; 8D 3A FD | Store accumulator to absolute address
	AND $0032,X		  ; 3D 32 00 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $10			  ; 80 10 | Branch always
	BRA $10			  ; 80 10 | Branch always
	BRA $10			  ; 80 10 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BVS $68			  ; 70 68 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	DEX				  ; CA | Decrement X register
	LDA $AFD5			; AD D5 AF | Load from absolute address into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($B8,X)		  ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $7F09,X		  ; 3E 09 7F | Rotate left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $09F6			; 8D F6 09 | Store accumulator to absolute address
	INC $0019			; EE 19 00 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_196
; Address: $F2DB17
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_196:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_197
; Address: $F2DB2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_197:
	BCC $77			  ; 90 77 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_198
; Address: $F2DB61
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_198:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BMI $C8			  ; 30 C8 | Branch if negative
	BEQ $40			  ; F0 40 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	ADC $BC8F,Y		  ; 79 8F BC | Add with carry (absolute,Y)
	LDX $DE43,Y		  ; BE 43 DE | Load from absolute,Y into X register
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_199
; Address: $F2DBC9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_199:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19A
; Address: $F2DBCF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19A:
	RTI				  ; 40 | Return from interrupt
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19B
; Address: $F2DBD8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19B:
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $30			  ; 10 30 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19C
; Address: $F2DBDE
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19C:
	JSR $9960			; 20 60 99 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $0E86,Y		  ; 19 86 0E | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($B6,X)		  ; 01 B6 | Logical OR with accumulator ((zero page,X))
	CMP $C9B6			; CD B6 C9 | Compare accumulator (absolute)
	CMP #$76			 ; C9 76 | Compare accumulator (immediate)
	BIT #$46			 ; 89 46 | Test bits in accumulator (immediate)
	BIT #$A6			 ; 89 A6 | Test bits in accumulator (immediate)
	EOR #$F7			 ; 49 F7 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $70			  ; 80 70 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	EOR ($A0),Y		  ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($A0),Y		  ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
	STX $7A			  ; 86 7A | Store X register to zero page
	ADC ($B2,X)		  ; 61 B2 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA $870E,X		  ; BD 0E 87 | Load from absolute,X into accumulator
	ASL $83			  ; 06 83 | Arithmetic shift left (zero page)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BNE $1E			  ; D0 1E | Branch if not equal
	AND ($23,X)		  ; 21 23 | Logical AND with accumulator ((zero page,X))
	WDM #$3D			 ; 42 3D | Reserved instruction
	STA $788770		  ; 8F 70 87 78 | Store accumulator to absolute long address
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	PEA #$570B		   ; F4 0B 57 | Push effective address to stack
	INC $FD06,X		  ; FE 06 FD | Increment (absolute,X)
	CMP $FBDC,Y		  ; D9 DC FB | Compare accumulator (absolute,Y)
	INC $778A,X		  ; FE 8A 77 | Increment (absolute,X)
	STA $88FF06		  ; 8F 06 FF 88 | Store accumulator to absolute long address
	CLD				  ; D8 | Clear decimal mode flag
	BIT $AF			  ; 24 AF | Test bits in accumulator (zero page)
	BVC $FE			  ; 50 FE | Branch if overflow clear
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	BIT #$27			 ; 89 27 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19D
; Address: $F2DC7D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19D:
	CLD				  ; D8 | Clear decimal mode flag
	STA $D8DF70		  ; 8F 70 DF D8 | Store accumulator to absolute long address
	INC $FF67,X		  ; FE 67 FF | Increment (absolute,X)
	LDA $3B033F		  ; AF 3F 03 3B | Load from absolute long address into accumulator
	STY $DE			  ; 84 DE | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19E
; Address: $F2DC91
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19E:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	LDA				  ; BF 40 2F C0 | Load from absolute long,X into accumulator
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	LSR $40F2			; 4E F2 40 | Logical shift right (absolute)
	INC $82			  ; E6 82 | Increment (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STX $FA			  ; 86 FA | Store X register to zero page
	INC $FD			  ; E6 FD | Increment (zero page)
	LDA $0743,X		  ; BD 43 07 | Load from absolute,X into accumulator
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	STY $78			  ; 84 78 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BVC $10			  ; 50 10 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_19F
; Address: $F2DCD0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_19F:
	JSR $9080			; 20 80 90 | Jump to subroutine
	ASL $1C13			; 0E 13 1C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $4F			  ; 30 4F | Branch if negative
	BVS $5F			  ; 70 5F | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A0
; Address: $F2DCFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A0:
	JSR $2000			; 20 00 20 | Jump to subroutine
	INC $DD11			; EE 11 DD | Increment (absolute)
	CMP $DD22,X		  ; DD 22 DD | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A1
; Address: $F2DD07
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A1:
	JSL $BB62BD		  ; 22 BD 62 BB | Jump to subroutine long
	LSR $BB			  ; 46 BB | Logical shift right (zero page)
	BRA $78			  ; 80 78 | Branch always
	LDA $860F,X		  ; BD 0F 86 | Load from absolute,X into accumulator
	DEC $F460			; CE 60 F4 | Decrement (absolute)
	BPL $18			  ; 10 18 | Branch if positive
	SEC				  ; 38 | Set carry flag
	STA $788770		  ; 8F 70 87 78 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A3
; Address: $F2DD46
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A3:
	BEQ $FF			  ; F0 FF | Branch if equal
	ASL $FFFE			; 0E FE FF | Arithmetic shift left (absolute)
	INC $3F3F,X		  ; FE 3F 3F | Increment (absolute,X)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PHX				  ; DA | Push X register to stack
	ROR $BEF1			; 6E F1 BE | Rotate right (absolute)
	LDA ($3E,X)		  ; A1 3E | Load from (zero page,X) into accumulator
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BRA $D0			  ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A4
; Address: $F2DD71
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A4:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $40			  ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A5
; Address: $F2DD78
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A5:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	AND ($EF,X)		  ; 21 EF | Logical AND with accumulator ((zero page,X))
	BMI $EF			  ; 30 EF | Branch if negative
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $F7			  ; 10 F7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BMI $C8			  ; 30 C8 | Branch if negative
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A7
; Address: $F2DDBB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A7:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $60			  ; 10 60 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1A8
; Address: $F2DDC3
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1A8:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1AB
; Address: $F2DDD4
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1AB:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $0C09			; 0D 09 0C | Logical OR with accumulator (absolute)
	ORA $0206			; 0D 06 02 | Logical OR with accumulator (absolute)
	ORA $080F			; 0D 0F 08 | Logical OR with accumulator (absolute)
	ASL $1E1B,X		  ; 1E 1B 1E | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CMP #$DF			 ; C9 DF | Compare accumulator (immediate)
	LDA ($91,X)		  ; A1 91 | Load from (zero page,X) into accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SBC $FF88,Y		  ; F9 88 FF | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1AC
; Address: $F2DE36
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1AC:
	JSR $191F			; 20 1F 19 | Jump to subroutine
	STX $0E			  ; 86 0E | Store X register to zero page
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	STX $81FE			; 8E FE 81 | Store X register to absolute address
	LDA $BE47,Y		  ; B9 47 BE | Load from absolute,Y into accumulator
	WDM #$A6			 ; 42 A6 | Reserved instruction
	WDM #$A4			 ; 42 A4 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1AD
; Address: $F2DE4E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1AD:
	JMP $0EF144		  ; 5C 44 F1 0E | Jump to address long
	STA $010600		  ; 8F 00 06 01 | Store accumulator to absolute long address
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1AE
; Address: $F2DE64
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1AE:
	CPY $3FFF			; CC FF 3F | Compare Y register (absolute)
	ROR $FC7D,X		  ; 7E 7D FC | Rotate right (absolute,X)
	STA $85			  ; 85 85 | Store accumulator to zero page
	BRA $FD			  ; 80 FD | Branch always
	STA $7A			  ; 85 7A | Store accumulator to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA $BD43,X		  ; BD 43 BD | Load from absolute,X into accumulator
	LDA $BD43,X		  ; BD 43 BD | Load from absolute,X into accumulator
	LDA $BD43,X		  ; BD 43 BD | Load from absolute,X into accumulator
	LDA $AD43			; AD 43 AD | Load from absolute address into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B0
; Address: $F2DEC4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B0:
	STA				  ; 9F E0 BF E0 | Store accumulator to absolute long,X
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B1
; Address: $F2DED1
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B1:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY $7B			  ; C4 7B | Compare Y register (zero page)
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $6A			  ; 84 6A | Store Y register to zero page
	STY $6A			  ; 84 6A | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	ASL $01FE			; 0E FE 01 | Arithmetic shift left (absolute)
	SBC $9E07,Y		  ; F9 07 9E | Subtract with carry (absolute,Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CPY $3FFF			; CC FF 3F | Compare Y register (absolute)
	ROR $FC7D,X		  ; 7E 7D FC | Rotate right (absolute,X)
	STA $85			  ; 85 85 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B2
; Address: $F2DF2E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B2:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $FD			  ; 80 FD | Branch always
	STA $7A			  ; 85 7A | Store accumulator to zero page
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $847B			; 8C 7B 84 | Store Y register to absolute address
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STY $5B			  ; 84 5B | Store Y register to zero page
	STY $5B			  ; 84 5B | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	PEA #$F41C		   ; F4 1C F4 | Push effective address to stack
	PEA #$F40C		   ; F4 0C F4 | Push effective address to stack
	PEA #$000C		   ; F4 0C 00 | Push effective address to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $30			  ; 10 30 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B4
; Address: $F2DFBA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B4:
	JSR $4060			; 20 60 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$D408		   ; F4 08 D4 | Push effective address to stack
	EOR #$88			 ; 49 88 | Exclusive OR with accumulator (immediate)
	WDM #$80			 ; 42 80 | Reserved instruction

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B5
; Address: $F2DFC9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B5:
	BRA $42			  ; 80 42 | Hardware register operation
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B6
; Address: $F2DFE2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B6:
	BRA $00			  ; 80 00 | Branch always
	ASL $DE			  ; 06 DE | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $18			  ; 30 18 | Branch if negative
	BEQ $1C			  ; F0 1C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B7
; Address: $F2DFF2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B7:
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	ASL $38E0,X		  ; 1E E0 38 | Arithmetic shift left (absolute,X)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $C0			  ; C6 C0 | Decrement (zero page)
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	AND ($1E),Y		  ; 31 1E | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	LSR $CA			  ; 46 CA | Logical shift right (zero page)
	LSR $8A			  ; 46 8A | Logical shift right (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$B1			 ; C0 B1 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1B8
; Address: $F2E063
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1B8:
	CPY #$B1			 ; C0 B1 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1BA
; Address: $F2E06C
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1BA:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $001F,X		  ; 1E 1F 00 | Arithmetic shift left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BVS $30			  ; 70 30 | Branch if overflow set
	BVS $30			  ; 70 30 | Branch if overflow set
	BMI $10			  ; 30 10 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BMI $20			  ; 30 20 | Branch if negative
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1BB
; Address: $F2E13C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1BB:
	JSR $2038			; 20 38 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	INC $2738,X		  ; FE 38 27 | Increment (absolute,X)
	ASL $5EDF,X		  ; 1E DF 5E | Arithmetic shift left (absolute,X)
	LDX $A0			  ; A6 A0 | Load from zero page into X register
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1BD
; Address: $F2E175
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1BD:
	JSR $58A6			; 20 A6 58 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BCS $50			  ; B0 50 | Branch if carry set
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	ORA $021C,Y		  ; 19 1C 02 | Logical OR with accumulator (absolute,Y)
	SBC $1E06,Y		  ; F9 06 1E | Subtract with carry (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0018,X		  ; 1E 18 00 | Arithmetic shift left (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BPL $FC			  ; 10 FC | Branch if positive
	BPL $94			  ; 10 94 | Branch if positive
	BCC $58			  ; 90 58 | Branch if carry clear
	BVS $B4			  ; 70 B4 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	CPX $98			  ; E4 98 | Compare X register (zero page)
	INC $104C,X		  ; FE 4C 10 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	BRA $BE			  ; 80 BE | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $70			  ; 80 70 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1BE
; Address: $F2E225
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1BE:
	RTI				  ; 40 | Return from interrupt
	BVS $70			  ; 70 70 | Branch if overflow set
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $70			  ; 80 70 | Branch always
	DEY				  ; 88 | Decrement Y register
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	ROL $0F0E,X		  ; 3E 0E 0F | Rotate left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BMI $3E			  ; 30 3E | Branch if negative
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	INC $7826,X		  ; FE 26 78 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	INC $7860,X		  ; FE 60 78 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ADC $26			  ; 65 26 | Add with carry (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ROL $FE00,X		  ; 3E 00 FE | Rotate left (absolute,X)
	ASL $E8EC,X		  ; 1E EC E8 | Arithmetic shift left (absolute,X)
	BPL $E6			  ; 10 E6 | Branch if positive
	BPL $BF			  ; 10 BF | Branch if positive
	DEC $E096,X		  ; DE 96 E0 | Game work RAM access
	CPY $3E00			; CC 00 3E | Compare Y register (absolute)
	ROL $FEE0,X		  ; 3E E0 FE | Rotate left (absolute,X)
	CPX #$72			 ; E0 72 | Compare X register (immediate)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	AND ($54,X)		  ; 21 54 | Logical AND with accumulator ((zero page,X))
	EOR $4813,Y		  ; 59 13 48 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1BF
; Address: $F2E2C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1BF:
	AND $68			  ; 25 68 | Logical AND with accumulator (zero page)
	AND $1732			; 2D 32 17 | Logical AND with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	AND $3712			; 2D 12 37 | Logical AND with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C0
; Address: $F2E2E7
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C0:
	JSR $284C			; 20 4C 28 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	BIT $48D0			; 2C D0 48 | Test bits in accumulator (absolute)
	BCS $F8			  ; B0 F8 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	BEQ $C0			  ; F0 C0 | Branch if equal
	ORA ($24,X)		  ; 01 24 | Logical OR with accumulator ((zero page,X))
	EOR $5023,Y		  ; 59 23 50 | Exclusive OR with accumulator (absolute,Y)
	ORA ($48),Y		  ; 11 48 | Logical OR with accumulator ((zero page),Y)
	BIT $68			  ; 24 68 | Test bits in accumulator (zero page)
	AND $1732			; 2D 32 17 | Logical AND with accumulator (absolute)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $2F			  ; 50 2F | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	AND $3712			; 2D 12 37 | Logical AND with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C1
; Address: $F2E329
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C1:
	JSR $284C			; 20 4C 28 | Jump to subroutine
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C2
; Address: $F2E32E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C2:
	CLV				  ; B8 | Clear overflow flag
	BEQ $80			  ; F0 80 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	BRA $34			  ; 80 34 | Branch always
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	BIT $68D0			; 2C D0 68 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C3
; Address: $F2E33D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C3:
	BCC $F8			  ; 90 F8 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	LDA #$2B			 ; A9 2B | Load immediate value into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $2048,Y		  ; 19 48 20 | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	CPY $2A			  ; C4 2A | Compare Y register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C5
; Address: $F2E36D
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C5:
	JSR $50D8			; 20 D8 50 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $2A			  ; 80 2A | Branch always
	CPY $32			  ; C4 32 | Compare Y register (zero page)
	CPY $D824			; CC 24 D8 | Compare Y register (absolute)
	BIT $28D0			; 2C D0 28 | Test bits in accumulator (absolute)
	BNE $58			  ; D0 58 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	STA ($13),Y		  ; 91 13 | Store accumulator to (zero page),Y
	RTI				  ; 40 | Return from interrupt
	AND #$68			 ; 29 68 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	BCC $6F			  ; 90 6F | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY $BA			  ; C4 BA | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BIT $0828			; 2C 28 08 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C6
; Address: $F2E3AD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C6:
	JSR $3060			; 20 60 30 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $3A			  ; 80 3A | Branch always
	CPY $12			  ; C4 12 | Compare Y register (zero page)
	CPX $F804			; EC 04 F8 | Compare X register (absolute)
	BIT $28D0			; 2C D0 28 | Test bits in accumulator (absolute)
	BNE $30			  ; D0 30 | Branch if not equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C7
; Address: $F2E3BF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C7:
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BMI $78			  ; 30 78 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C8
; Address: $F2E3C4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C8:
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $70			  ; 30 70 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1C9
; Address: $F2E3D6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1C9:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $DB			  ; 80 DB | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $0CC6,Y		  ; 99 C6 0C | Store accumulator to absolute,Y
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1CA
; Address: $F2E405
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1CA:
	RTI				  ; 40 | Return from interrupt
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1CB
; Address: $F2E40A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1CB:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	INX				  ; E8 | Increment X register
	BPL $E0			  ; 10 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BCC $00			  ; 90 00 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $68			  ; 70 68 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1CD
; Address: $F2E42C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1CD:
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BCC $60			  ; 90 60 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	BPL $64			  ; 10 64 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STZ $18			  ; 64 18 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $D668			; EC 68 D6 | Compare X register (absolute)
	BCC $26			  ; 90 26 | Branch if carry clear
	BPL $3F			  ; 10 3F | Branch if positive
	ASL $2076,X		  ; 1E 76 20 | Arithmetic shift left (absolute,X)
	LDY $1020,X		  ; BC 20 10 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1CE
; Address: $F2E46D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1CE:
	JSR $6040			; 20 40 60 | Jump to subroutine
	STZ $72E0			; 9C E0 72 | Store zero to absolute
	STY $0C32			; 8C 32 0C | Store Y register to absolute address
	LDY $3040,X		  ; BC 40 30 | Load from absolute,X into Y register
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $16			  ; 80 16 | Branch always
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BNE $20			  ; D0 20 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D0
; Address: $F2E4B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D0:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D1
; Address: $F2E4C7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D1:
	PHP				  ; 08 | Push processor status to stack
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $80			  ; D0 80 | Branch if not equal
	BEQ $20			  ; F0 20 | Branch if equal
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D2
; Address: $F2E4EC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D2:
	BRA $00			  ; 80 00 | Branch always
	BEQ $C0			  ; F0 C0 | Branch if equal
	BNE $20			  ; D0 20 | Branch if not equal
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D3
; Address: $F2E4FB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D3:
	BRA $80			  ; 80 80 | Branch always
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	ROL $3E0E			; 2E 0E 3E | Rotate left (absolute)
	AND $1B08			; 2D 08 1B | Logical AND with accumulator (absolute)
	ROL $3D11			; 2E 11 3D | Rotate left (absolute)
	BIT $1B13			; 2C 13 1B | Test bits in accumulator (absolute)
	BCS $E0			  ; B0 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BVC $68			  ; 50 68 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D4
; Address: $F2E52B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D4:
	JSR $80B0			; 20 B0 80 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	INX				  ; E8 | Increment X register
	BNE $E8			  ; D0 E8 | Branch if not equal
	BPL $78			  ; 10 78 | Branch if positive
	BRA $B8			  ; 80 B8 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BCC $B0			  ; 90 B0 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0F2A,X		  ; 1D 2A 0F | Logical OR with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $1E			  ; 46 1E | Logical shift right (zero page)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	AND $2F02,X		  ; 3D 02 2F | Logical AND with accumulator (absolute,X)
	ROL $5E			  ; 26 5E | Rotate left (zero page)
	AND ($7B,X)		  ; 21 7B | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D5
; Address: $F2E55A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D5:
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	BVS $A8			  ; 70 A8 | Branch if overflow set
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	BEQ $C4			  ; F0 C4 | Branch if equal
	BEQ $7C			  ; F0 7C | Branch if equal
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D6
; Address: $F2E56B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D6:
	JSR $80F0			; 20 F0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $E8			  ; 80 E8 | Branch always
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	PEA #$BC08		   ; F4 08 BC | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BNE $F0			  ; D0 F0 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEC $FF44,X		  ; DE 44 FF | Decrement (absolute,X)
	SBC $64			  ; E5 64 | Subtract with carry (zero page)
	JMP $7922EC		  ; 5C EC 22 79 | Jump to address long
	ROL $6F			  ; 26 6F | Rotate left (zero page)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	STZ $A5C0,X		  ; 9E C0 A5 | Store zero to absolute,X
	PHX				  ; DA | Push X register to stack
	LDA $DA			  ; A5 DA | Load from zero page into accumulator
	LDX $DEC0,Y		  ; BE C0 DE | Load from absolute,Y into X register
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D8
; Address: $F2E5C3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D8:
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($B000)		  ; 6C 00 B0 | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1D9
; Address: $F2E5FC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1D9:
	BRA $7F			  ; 80 7F | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BNE $50			  ; D0 50 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	BRA $EF			  ; 80 EF | Branch always
	BPL $DF			  ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1DB
; Address: $F2E61B
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1DB:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $E700,X		  ; FE 00 E7 | Increment (absolute,X)
	CPY #$BA			 ; C0 BA | Compare Y register (immediate)
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $E3DC,X		  ; FD DC E3 | Subtract with carry (absolute,X)
	CPX $03			  ; E4 03 | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	BRA $F8			  ; 80 F8 | Branch always
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $F300,X		  ; 7E 00 F3 | Rotate right (absolute,X)
	WDM #$B4			 ; 42 B4 | Reserved instruction
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $C300,X		  ; 7E 00 C3 | Rotate right (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BNE $50			  ; D0 50 | Branch if not equal

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1DC
; Address: $F2E688
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1DC:
	JSR $F0E0			; 20 E0 F0 | Jump to subroutine
	BEQ $3F			  ; F0 3F | Branch if equal
	BPL $DF			  ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1DD
; Address: $F2E695
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1DD:
	JSR $2FD0			; 20 D0 2F | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $BDC2			; EE C2 BD | Increment (absolute)
	STY $B7B7			; 8C B7 B7 | Store Y register to absolute address
	INC $DCFD,X		  ; FE FD DC | Increment (absolute,X)
	INC $BC01			; EE 01 BC | Increment (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1DE
; Address: $F2E6BF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1DE:
	BPL $F0			  ; 10 F0 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BPL $68			  ; 10 68 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $68			  ; 90 68 | Branch if carry clear
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CLC				  ; 18 | Clear carry flag
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $98			  ; F0 98 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1DF
; Address: $F2E6D8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1DF:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $70			  ; 70 70 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0005			; 0D 05 00 | Logical OR with accumulator (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL $0C			  ; 26 0C | Rotate left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1E0
; Address: $F2E712
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1E0:
	ORA $0502			; 0D 02 05 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVS $40			  ; 70 40 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	BEQ $3F			  ; F0 3F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7C 7C 1C | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	JMP $1D470A		  ; 5C 0A 47 1D | Jump to address long
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 71 91 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1E3
; Address: $F2E75C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1E3:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $06			  ; 80 06 | Branch always
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BVS $08			  ; 70 08 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	STX $B53A			; 8E 3A B5 | Store X register to absolute address
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1E4
; Address: $F2E78F
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1E4:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	LDY $F640,X		  ; BC 40 F6 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BCS $40			  ; B0 40 | Branch if carry set
	EOR $40			  ; 45 40 | Exclusive OR with accumulator (zero page)
	AND $033D,Y		  ; 39 3D 03 | Logical AND with accumulator (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	STZ $C4			  ; 64 C4 | Store zero to zero page
	LDY $D898,X		  ; BC 98 D8 | Load from absolute,X into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	JMP $343F58		  ; 5C 58 3F 34 | Jump to address long
	ASL $540F,X		  ; 1E 0F 54 | Arithmetic shift left (absolute,X)
	LDA $6E28,Y		  ; B9 28 6E | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1E6
; Address: $F2E7FE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1E6:
	ROR				  ; 6A | Rotate right (accumulator)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1EB
; Address: $F2E857
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1EB:
	JSR $0060			; 20 60 00 | Jump to subroutine
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	LDA $6E28,Y		  ; B9 28 6E | Load from absolute,Y into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1EC
; Address: $F2E882
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1EC:
	JSR $60C0			; 20 C0 60 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1EF
; Address: $F2E8D3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1EF:
	JSR $0060			; 20 60 00 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC $BF70,X		  ; 7D 70 BF | Add with carry (absolute,X)
	INC $1FEF,X		  ; FE EF 1F | Increment (absolute,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC $FE00,X		  ; 7D 00 FE | Add with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BCS $20			  ; B0 20 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F1
; Address: $F2E928
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F1:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BCS $40			  ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F2
; Address: $F2E932
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F2:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	LSR $FFBF			; 4E BF FF | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LSR $FF31			; 4E 31 FF | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROL $3D			  ; 26 3D | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $C7			  ; 30 C7 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BMI $3F			  ; 30 3F | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $0000			; EE 00 00 | Increment (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F3
; Address: $F2EA3F
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F3:
	JSR $0203			; 20 03 02 | Jump to subroutine
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ROL $0020			; 2E 20 00 | Rotate left (absolute)
	ASL $1500			; 0E 00 15 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $1C13			; 0E 13 1C | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR $9D79			; 4E 79 9D | Logical shift right (absolute)
	AND $7BE2,X		  ; 3D E2 7B | Logical AND with accumulator (absolute,X)
	DEC $FB			  ; C6 FB | Decrement (zero page)
	STY $F7			  ; 84 F7 | Store Y register to zero page
	ORA #$EE			 ; 09 EE | Logical OR with accumulator (immediate)
	ORA $2000,Y		  ; 19 00 20 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDX $AF53			; AE 53 AF | Load from absolute address into X register
	EOR ($6F),Y		  ; 51 6F | Exclusive OR with accumulator ((zero page),Y)
	BNE $6F			  ; D0 6F | Branch if not equal
	BCC $6F			  ; 90 6F | Branch if carry clear
	BCC $6F			  ; 90 6F | Branch if carry clear
	BCC $EF			  ; 90 EF | Branch if carry clear
	BCC $EF			  ; 90 EF | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F4
; Address: $F2EAE0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F4:
	JSR $83F8			; 20 F8 83 | Jump to subroutine
	LDA $860F,X		  ; BD 0F 86 | Load from absolute,X into accumulator
	DEC $F460			; CE 60 F4 | Decrement (absolute)
	BPL $18			  ; 10 18 | Branch if positive
	SEC				  ; 38 | Set carry flag
	STA $788770		  ; 8F 70 87 78 | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F7
; Address: $F2EB11
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F7:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $40			  ; B0 40 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F8
; Address: $F2EB18
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F8:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	PHX				  ; DA | Push X register to stack
	AND $25DB			; 2D DB 25 | Logical AND with accumulator (absolute)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $DD			  ; 24 DD | Test bits in accumulator (zero page)
	ROL $DD			  ; 26 DD | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1F9
; Address: $F2EB2F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1F9:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	ASL $8F79,X		  ; 1E 79 8F | Arithmetic shift left (absolute,X)
	LDX $BFC3,Y		  ; BE C3 BF | Load from absolute,Y into X register
	EOR ($DF,X)		  ; 41 DF | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1FA
; Address: $F2EB51
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1FA:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STA $7677F8		  ; 8F F8 77 76 | Store accumulator to absolute long address
	EOR #$3B			 ; 49 3B | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1FD
; Address: $F2EBBC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1FD:
	JSR $E01F			; 20 1F E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$64			 ; E0 64 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $E8			  ; F0 E8 | Branch if equal
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1FE
; Address: $F2EBD9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1FE:
	BPL $2F			  ; 10 2F | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $2C			  ; F0 2C | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $70			  ; 50 70 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_1FF
; Address: $F2EC08
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_1FF:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_200
; Address: $F2EC12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_200:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_202
; Address: $F2EC21
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_202:
	JSR $1233			; 20 33 12 | Jump to subroutine
	ASL $0C1E			; 0E 1E 0C | Arithmetic shift left (absolute)
	ROL $3A1C,X		  ; 3E 1C 3A | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BMI $5F			  ; 30 5F | Branch if negative
	BVS $5F			  ; 70 5F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_204
; Address: $F2EC4C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_204:
	LDA $B0E0,X		  ; BD E0 B0 | Load from absolute,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_205
; Address: $F2EC57
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_205:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $EE11			; EE 11 EE | Increment (absolute)
	ORA ($DE),Y		  ; 11 DE | Logical OR with accumulator ((zero page),Y)
	AND ($DD),Y		  ; 31 DD | Logical AND with accumulator ((zero page),Y)
	CMP $BD22,X		  ; DD 22 BD | Compare accumulator (absolute,X)
	LDA $B542,X		  ; BD 42 B5 | Load from absolute,X into accumulator
	REP #$00			 ; C2 00 | Reset processor status bits
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EE			  ; 10 EE | Branch if positive
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $E8			  ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_206
; Address: $F2EC8B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_206:
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	ASL $01FE			; 0E FE 01 | Arithmetic shift left (absolute)
	AND $1E07,Y		  ; 39 07 1E | Logical AND with accumulator (absolute,Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP $DD22,X		  ; DD 22 DD | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_207
; Address: $F2ECE3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_207:
	JSL $DE22DD		  ; 22 DD 22 DE | Jump to subroutine long
	DEC $5E21,X		  ; DE 21 5E | Decrement (absolute,X)
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	AND ($12,X)		  ; 21 12 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_208
; Address: $F2ED01
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_208:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	BMI $EF			  ; 30 EF | Branch if negative
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $F7			  ; 10 F7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BNE $70			  ; D0 70 | Branch if not equal
	BNE $30			  ; D0 30 | Branch if not equal
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	PEA #$341C		   ; F4 1C 34 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_209
; Address: $F2ED33
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_209:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $1500,X		  ; 1E 00 15 | Arithmetic shift left (absolute,X)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_20A
; Address: $F2ED69
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_20A:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $BFFE,X		  ; FE FE BF | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	REP #$A2			 ; C2 A2 | Reset processor status bits
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_20C
; Address: $F2EE84
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_20C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0A2E			; 0D 2E 0A | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $2A02,X		  ; 1D 02 2A | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $C0			  ; 30 C0 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BNE $C8			  ; D0 C8 | Branch if not equal
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	BMI $F4			  ; 30 F4 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $300D			; 0E 0D 30 | Arithmetic shift left (absolute)
	ORA $0740,X		  ; 1D 40 07 | Logical OR with accumulator (absolute,X)
	STX $37			  ; 86 37 | Store X register to zero page
	ROL $ECFE,X		  ; 3E FE EC | Rotate left (absolute,X)
	ASL $3100			; 0E 00 31 | Arithmetic shift left (absolute)
	ASL $3E41			; 0E 41 3E | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BVS $70			  ; 70 70 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank64_DmaFunction_20D
; Address: $F2EF76
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_20D:
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $030E			; 0E 0E 03 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROR $0F7E,X		  ; 7E 7E 0F | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_20F
; Address: $F2EFCE
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_20F:
	BMI $30			  ; 30 30 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set
	BPL $08			  ; 10 08 | Branch if positive
	SEC				  ; 38 | Set carry flag
	ROL $04			  ; 26 04 | Rotate left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $0038			; 6E 38 00 | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	EOR $7826,Y		  ; 59 26 78 | Exclusive OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	ORA $0009,Y		  ; 19 09 00 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	ORA $0006,Y		  ; 19 06 00 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_210
; Address: $F2F058
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_210:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	PLB				  ; AB | Pull data bank register from stack
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $024F11		  ; 5C 11 4F 02 | Jump to address long
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $1F1F,X		  ; 3E 1F 1F | Rotate left (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $364F27		  ; 5C 27 4F 36 | Jump to address long
	ROL				  ; 2A | Rotate left (accumulator)
	AND $1F02,X		  ; 3D 02 1F | Logical AND with accumulator (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY $84			  ; C4 84 | Compare Y register (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_211
; Address: $F2F090
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_211:
	BRA $00			  ; 80 00 | Branch always
	BRA $2A			  ; 80 2A | Branch always
	CPY $74			  ; C4 74 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	CPX $D8			  ; E4 D8 | Compare X register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $78			  ; 50 78 | Branch if overflow clear
	BRA $F0			  ; 80 F0 | Branch always
	EOR $4C16,Y		  ; 59 16 4C | Exclusive OR with accumulator (absolute,Y)
	AND ($6D,X)		  ; 21 6D | Logical AND with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	ASL $230F,X		  ; 1E 0F 23 | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $6D33			; 4C 33 6D | Jump to address
	DEC				  ; 3A | Decrement accumulator
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_212
; Address: $F2F0C9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_212:
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	STZ $98			  ; 64 98 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank64_DmaFunction_213
; Address: $F2F0D8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_213:
	JMP ($E8D0)		  ; 6C D0 E8 | Jump to address (absolute indirect)
	BNE $B8			  ; D0 B8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BVS $80			  ; 70 80 | Branch if overflow set
	ROL $1C1C			; 2E 1C 1C | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $030E			; 0E 0E 03 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $30			  ; 30 30 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_214
; Address: $F2F162
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_214:
	BCC $80			  ; 90 80 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $88			  ; 80 88 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_216
; Address: $F2F174
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_216:
	DEY				  ; 88 | Decrement Y register
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA $0605			; 0D 05 06 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0602			; 0D 02 06 | Logical OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_217
; Address: $F2F1B4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_217:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	BNE $40			  ; D0 40 | Branch if not equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_218
; Address: $F2F1FA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_218:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_219
; Address: $F2F238
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_219:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $3C7E,X		  ; 7E 7E 3C | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STX $038E			; 8E 8E 03 | Store X register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $8FFE,X		  ; FE FE 8F | Increment (absolute,X)
	STA $010303		  ; 8F 03 03 01 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_21C
; Address: $F2F28F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_21C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_220
; Address: $F2F2AA
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_220:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $E51E,Y		  ; 19 1E E5 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3F EF 7F | Load from absolute long,X into accumulator
	BMI $3F			  ; 30 3F | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SBC $FEF9,Y		  ; F9 F9 FE | Subtract with carry (absolute,Y)
	INC $FFFD,X		  ; FE FD FF | Increment (absolute,X)
	STA $FD			  ; 85 FD | Store accumulator to zero page
	ADC ($F0),Y		  ; 71 F0 | Add with carry ((zero page),Y)
	SBC $FFF0,Y		  ; F9 F0 FF | Subtract with carry (absolute,Y)
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $F102,X		  ; FD 02 F1 | Subtract with carry (absolute,X)
	ASL $0EF1			; 0E F1 0E | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_221
; Address: $F2F33A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_221:
	BRA $08			  ; 80 08 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_222
; Address: $F2F34D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_222:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_223
; Address: $F2F364
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_223:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $70			  ; 70 70 | Branch if overflow set
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	ROL $073E,X		  ; 3E 3E 07 | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $70			  ; 70 70 | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_224
; Address: $F2F43A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_224:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3D2B,X		  ; 3D 2B 3D | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_225
; Address: $F2F45F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_225:
	JSR $03FE			; 20 FE 03 | Jump to subroutine
	BRA $7F			  ; 80 7F | Branch always
	BRA $BF			  ; 80 BF | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_226
; Address: $F2F46D
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_226:
	LDY #$6F			 ; A0 6F | Load immediate value into Y register
	BCC $03			  ; 90 03 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	LDY $83			  ; A4 83 | Load from zero page into Y register
	DEY				  ; 88 | Decrement Y register
	STA $F677F8		  ; 8F F8 77 F6 | Store accumulator to absolute long address
	CMP #$3B			 ; C9 3B | Compare accumulator (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	STA $00FF70		  ; 8F 70 FF 00 | Store accumulator to absolute long address
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PEA #$D83F		   ; F4 3F D8 | Push effective address to stack
	CPX #$65			 ; E0 65 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $E8F0,Y		  ; F9 F0 E8 | Subtract with carry (absolute,Y)
	CPX #$2E			 ; E0 2E | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLX				  ; FA | Pull X register from stack
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BPL $2E			  ; 10 2E | Branch if positive
	BNE $FF			  ; D0 FF | Branch if not equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SBC $FB02,X		  ; FD 02 FB | Subtract with carry (absolute,X)
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ORA $F6			  ; 05 F6 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_227
; Address: $F2F4CF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_227:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	STZ $FC			  ; 64 FC | Store zero to zero page
	LDY $BCD4,X		  ; BC D4 BC | Load from absolute,X into Y register
	ROL $3000			; 2E 00 30 | Rotate left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $070E			; 0E 0E 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	EOR $5D76			; 4D 76 5D | Exclusive OR with accumulator (absolute)
	EOR $5D72,X		  ; 5D 72 5D | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_228
; Address: $F2F568
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_228:
	EOR $5E72,X		  ; 5D 72 5E | Exclusive OR with accumulator (absolute,X)
	LSR $5E61,X		  ; 5E 61 5E | Logical shift right (absolute,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_22C
; Address: $F2F57D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_22C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ADC $3293			; 6D 93 32 | Add with carry (absolute)
	REP #$A0			 ; C2 A0 | Reset processor status bits
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	WDM #$16			 ; 42 16 | Reserved instruction
	STY $6C			  ; 84 6C | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_22D
; Address: $F2F5B4
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_22D:
	JSR $231F			; 20 1F 23 | Jump to subroutine
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	STX $78			  ; 86 78 | Store X register to zero page
	STY $0170			; 8C 70 01 | Store Y register to absolute address
	LDX $C7C6,Y		  ; BE C6 C7 | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $C701,X		  ; FE 01 C7 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$3C			 ; 09 3C | Logical OR with accumulator (immediate)
	LDA $3503,X		  ; BD 03 35 | Load from absolute,X into accumulator
	STA $82			  ; 85 82 | Store accumulator to zero page
	AND $FFFA,X		  ; 3D FA FF | Logical AND with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	BEQ $C0			  ; F0 C0 | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STY $78			  ; 84 78 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROR $4EBA			; 6E BA 4E | Rotate right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $4EBA			; 4E BA 4E | Logical shift right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank64_DmaFunction_22E
; Address: $F2F609
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_22E:
	LSR $CE7A			; 4E 7A CE | Logical shift right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	STX $7A			  ; 86 7A | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BVS $30			  ; 70 30 | Branch if overflow set
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	AND ($31,X)		  ; 21 31 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_22F
; Address: $F2F66E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_22F:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_232
; Address: $F2F68F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_232:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_236
; Address: $F2F6A0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_236:
	LSR $5F61,X		  ; 5E 61 5F | Logical shift right (absolute,X)
	ADC ($5F,X)		  ; 61 5F | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_237
; Address: $F2F6A6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_237:
	EOR $5D60,X		  ; 5D 60 5D | Exclusive OR with accumulator (absolute,X)
	BVS $2C			  ; 70 2C | Branch if overflow set
	BMI $2C			  ; 30 2C | Branch if negative
	BMI $2C			  ; 30 2C | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23A
; Address: $F2F6B9
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23A:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $C0			  ; 10 C0 | Branch if positive
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	BRA $41			  ; 80 41 | Branch always
	BRA $41			  ; 80 41 | Branch always
	BRA $41			  ; 80 41 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BRA $18			  ; 80 18 | Branch always
	BCC $10			  ; 90 10 | Branch if carry clear
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	BVS $98			  ; 70 98 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23B
; Address: $F2F6F4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23B:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL $0100,X		  ; 3E 00 01 | Rotate left (absolute,X)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$A2			 ; E0 A2 | Compare X register (immediate)
	CMP ($C2,X)		  ; C1 C2 | Compare accumulator ((zero page,X))
	STA ($22,X)		  ; 81 22 | Store accumulator to (zero page,X)
	CMP ($92,X)		  ; C1 92 | Compare accumulator ((zero page,X))
	STA ($E9,X)		  ; 81 E9 | Store accumulator to (zero page,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23C
; Address: $F2F72E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23C:
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	BMI $F0			  ; 30 F0 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23D
; Address: $F2F73F
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23D:
	BMI $7A			  ; 30 7A | Branch if negative
	STX $FA			  ; 86 FA | Store X register to zero page
	STX $FA			  ; 86 FA | Store X register to zero page
	ASL $BA			  ; 06 BA | Arithmetic shift left (zero page)
	ASL $BA			  ; 06 BA | Arithmetic shift left (zero page)
	ASL $0C34			; 0E 34 0C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $38F981		  ; 8F 81 F9 38 | Store accumulator to absolute long address
	ASL $C18F			; 0E 8F C1 | Arithmetic shift left (absolute)
	SBC $3F38,Y		  ; F9 38 3F | Subtract with carry (absolute,Y)
	STA				  ; 9F 80 FF 7F | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA				  ; 9F 80 FF 7E | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $70			  ; 70 70 | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $070E			; 0E 0E 07 | Arithmetic shift left (absolute)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23E
; Address: $F2F826
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23E:
	JSR $E020			; 20 20 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank64_DmaFunction_23F
; Address: $F2F836
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_23F:
	JSR $E020			; 20 20 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $1438			; 2C 38 14 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0819			; 0E 19 08 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank64_DmaFunction_240
; Address: $F2F86A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_240:
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ROL $1400,X		  ; 3E 00 14 | Rotate left (absolute,X)
	ORA $1206,Y		  ; 19 06 12 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $10			  ; 30 10 | Branch if negative
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_241
; Address: $F2F8D6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_241:
	JSR $1830			; 20 30 18 | Jump to subroutine
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	LSR $4307,X		  ; 5E 07 43 | Logical shift right (absolute,X)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BMI $C0			  ; 30 C0 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $E8			  ; 90 E8 | Branch if carry clear
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCS $F8			  ; B0 F8 | Branch if carry set

;------------------------------------------------------------------------------
; Bank64_DmaFunction_242
; Address: $F2F94A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_242:
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $18			  ; D0 18 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank64_DmaFunction_243
; Address: $F2F954
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_243:
	INX				  ; E8 | Increment X register
	BPL $F8			  ; 10 F8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_244
; Address: $F2F95B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_244:
	JSR $E010			; 20 10 E0 | Game work RAM access
	BPL $E8			  ; 10 E8 | Branch if positive
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $300F			; 0E 0F 30 | Arithmetic shift left (absolute)
	BEQ $7C			  ; F0 7C | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3000			; 0E 00 30 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $F8FF,X		  ; 1E FF F8 | Arithmetic shift left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank64_DmaFunction_245
; Address: $F2F9B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_245:
	SEC				  ; 38 | Set carry flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_246
; Address: $F2F9C2
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_246:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	SEP #$3E			 ; E2 3E | Set processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $083800		  ; 8F 00 38 08 | Store accumulator to absolute long address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $38308F		  ; 8F 8F 30 38 | Store accumulator to absolute long address
	ASL $010F			; 0E 0F 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF7E,X		  ; FE 7E FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_247
; Address: $F2FA24
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_247:
	STA $0FFF80		  ; 8F 80 FF 0F | Store accumulator to absolute long address
	BRA $FE			  ; 80 FE | Branch always
	STA $0FFFF0		  ; 8F F0 FF 0F | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $1E11			; 0E 11 1E | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $9A			  ; 30 9A | Branch if negative
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	BRA $FC			  ; 80 FC | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	SBC $7E81,X		  ; FD 81 7E | Subtract with carry (absolute,X)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	STA				  ; 9F BF 3E 7E | Store accumulator to absolute long,X
	WDM #$42			 ; 42 42 | Hardware register operation
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 40 7E 81 | Load from absolute long,X into accumulator
	WDM #$BD			 ; 42 BD | Reserved instruction
	STZ $4FF9,X		  ; 9E F9 4F | Store zero to absolute,X
	INC $7F03,X		  ; FE 03 7F | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BRA $A0			  ; 80 A0 | Branch always
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BEQ $D0			  ; F0 D0 | Branch if equal
	BVS $88			  ; 70 88 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_248
; Address: $F2FAFB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_248:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_249
; Address: $F2FB0D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_249:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F F0 3F E0 | Store accumulator to absolute long,X
	ROR $C5C1,X		  ; 7E C1 C5 | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_24A
; Address: $F2FB33
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_24A:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	STZ $7D71,X		  ; 9E 71 7D | Store zero to absolute,X
	REP #$FD			 ; C2 FD | Reset processor status bits
	PHP				  ; 08 | Push processor status to stack
	BIT $48B7			; 2C B7 48 | Test bits in accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $DF			  ; 10 DF | Branch if positive
	BMI $DF			  ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_24B
; Address: $F2FB6B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_24B:
	JSR $60B8			; 20 B8 60 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	INC $FF06,X		  ; FE 06 FF | Increment (absolute,X)
	SBC $3E03,X		  ; FD 03 3E | Subtract with carry (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_24C
; Address: $F2FBA0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_24C:
	JSR $AC1C			; 20 1C AC | Jump to subroutine
	STA $3F371F		  ; 8F 1F 37 3F | Store accumulator to absolute long address
	BVS $07			  ; 70 07 | Branch if overflow set
	AND $8401,X		  ; 3D 01 84 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STA $3FC03C		  ; 8F 3C C0 3F | Store accumulator to absolute long address
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	STA $000070		  ; 8F 70 00 00 | Store accumulator to absolute long address
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BMI $38			  ; 30 38 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_24D
; Address: $F2FBFE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_24D:
	ASL $110F			; 0E 0F 11 | Arithmetic shift left (absolute)
	ASL $3E21,X		  ; 1E 21 3E | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3D2A,X		  ; 3D 2A 3D | Logical AND with accumulator (absolute,X)
	EOR $7E			  ; 45 7E | Exclusive OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank64_DmaFunction_24F
; Address: $F2FC1D
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_24F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	SBC $F100,X		  ; FD 00 F1 | Subtract with carry (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BRA $A2			  ; 80 A2 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDX #$40			 ; A2 40 | Load immediate value into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $770E			; 0E 0E 77 | Arithmetic shift left (absolute)
	AND ($51,X)		  ; 21 51 | Logical AND with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $3FF1			; 0E F1 3F | Arithmetic shift left (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	STA ($DA,X)		  ; 81 DA | Store accumulator to (zero page,X)
	EOR ($67,X)		  ; 41 67 | Exclusive OR with accumulator ((zero page,X))
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $10			  ; 80 10 | Branch always
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $84			  ; F0 84 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	REP #$3C			 ; C2 3C | Reset processor status bits
	ROR $18			  ; 66 18 | Rotate right (zero page)
	ROR $8800,X		  ; 7E 00 88 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_250
; Address: $F2FC81
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_250:
	SEI				  ; 78 | Set interrupt disable flag
	STY $7C			  ; 84 7C | Store Y register to zero page
	LDY $BC54,X		  ; BC 54 BC | Load from absolute,X into Y register
	LDX #$7E			 ; A2 7E | Load immediate value into X register
	TAX				  ; AA | Transfer accumulator to X register
	LSR $56AA,X		  ; 5E AA 56 | Logical shift right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $3FED			; 6E ED 3F | Rotate right (absolute)
	STA				  ; 9F 60 FE 01 | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $1F0E,X		  ; FE 0E 1F | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BEQ $FE			  ; F0 FE | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	CMP #$B6			 ; C9 B6 | Compare accumulator (immediate)
	CMP #$B6			 ; C9 B6 | Compare accumulator (immediate)
	CMP #$B6			 ; C9 B6 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	REP #$20			 ; C2 20 | Reset processor status bits
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank64_DmaFunction_251
; Address: $F2FD74
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_251:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LDA ($75,X)		  ; A1 75 | Load from (zero page,X) into accumulator
	PLX				  ; FA | Pull X register from stack
	ADC ($D9),Y		  ; 71 D9 | Add with carry ((zero page),Y)
	BVC $10			  ; 50 10 | Branch if overflow clear
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	CPX #$B3			 ; E0 B3 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP $E720,Y		  ; D9 20 E7 | Compare accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	PEA #$E097		   ; F4 97 E0 | Game work RAM access
	REP #$C1			 ; C2 C1 | Reset processor status bits
	BRA $21			  ; 80 21 | PPU graphics register access
	CMP ($91,X)		  ; C1 91 | Compare accumulator ((zero page,X))
	STA ($E8,X)		  ; 81 E8 | Store accumulator to (zero page,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	BMI $A9			  ; 30 A9 | Branch if negative
	LDA $AD57			; AD 57 AD | Load from absolute address into accumulator
	ADC $6DD3			; 6D D3 6D | Add with carry (absolute)
	ADC $6D93			; 6D 93 6D | Add with carry (absolute)
	ADC $00D3			; 6D D3 00 | Add with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_252
; Address: $F2FE4C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_252:
	SBC $DB1B			; ED 1B DB | Subtract with carry (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_253
; Address: $F2FE62
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_253:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_254
; Address: $F2FE79
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_254:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	NOP				  ; EA | No operation
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROR $58			  ; 66 58 | Rotate right (zero page)
	STZ $5C			  ; 64 5C | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank64_DmaFunction_256
; Address: $F2FED7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_256:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	BVC $D8			  ; 50 D8 | Branch if overflow clear
	BVC $58			  ; 50 58 | Branch if overflow clear
	BPL $58			  ; 10 58 | Branch if positive
	BPL $58			  ; 10 58 | Branch if positive
	BPL $5C			  ; 10 5C | Branch if positive
	SEC				  ; 38 | Set carry flag
	STZ $20			  ; 64 20 | Store zero to zero page
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank64_DmaFunction_259
; Address: $F2FEF9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_259:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	STZ $18			  ; 64 18 | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_25B
; Address: $F2FF02
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_25B:
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	BMI $30			  ; 30 30 | Branch if negative
	SBC $EA57			; ED 57 EA | Subtract with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROR $1A			  ; 66 1A | Rotate right (zero page)
	ROL $3A			  ; 26 3A | Rotate left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP ($D86F)		  ; 6C 6F D8 | Jump to address (absolute indirect)
	BCC $DF			  ; 90 DF | Branch if carry clear
	BMI $DF			  ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank64_DmaFunction_25C
; Address: $F2FFA9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_25C:
	JSR $60B8			; 20 B8 60 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ASL $0CFB,X		  ; 1E FB 0C | Arithmetic shift left (absolute,X)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	ROL $1F06,X		  ; 3E 06 1F | Rotate left (absolute,X)
	ADC $0003,X		  ; 7D 03 00 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank64_DmaFunction_25D
; Address: $F2FFE4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank64_DmaFunction_25D:
	JSR $A41C			; 20 1C A4 | Jump to subroutine
	LDA $3F2F3F		  ; AF 3F 2F 3F | Load from absolute long address into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $7C			  ; F0 7C | Branch if equal
